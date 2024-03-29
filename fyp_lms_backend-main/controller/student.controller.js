
const { Op } = require('sequelize');
const { jwtconfig } = require('../config/config');

const db = require('../model');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const Students = db.student;
const refreshtoken = [];

export const getroles = async () => {
    const allrole = await db.role.findAll();
    const roles = {
        librarian: allrole.find(({ role }) => role === 'librarian'),
        student: allrole.find(({ role }) => role === 'student'),
        headdepartment: allrole.find(({ role }) => role === 'headdepartment')
    };
    return roles;
};
export const login = async (req, res) => {
    const {email, password} = req.body;

    const generateToken = (user) => {
        const accessToken = jwt.sign({role: user.role_id, email: user.email}, jwtconfig.secret, {expiresIn: "7d"});
        const refreshToken = jwt.sign({role: user.role_id, email: user.email}, jwtconfig.secret, {expiresIn: "14d"});
        refreshtoken.push(refreshToken);
        return {accessToken, refreshToken};
    };

    const authenticateUser = async (model, email) => {
        const user = await model.findOne({
            where: {
                [Op.or]: [
                    {email: email},
                    {studentID: email},
                    {ID: email},
                    {cardID: email} // Assuming the key for librarian is cardID
                ]
            },
            include: [db.role]
        });

        if (!user) {
            return null;
        }

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return false;
        }

        return user;
    };

    const respondWithToken = (user) => {
        const token = generateToken(user);
        return res.status(200).json({
            user: {
                id: user.id,
                firstname: user.firstname,
                lastname: user.lastname,
                email: user.email,
                department: user.department,
                ID: user.studentID || user.ID || user.cardID,
                role: user.role.role,
                phonenumber: user.phone_number
            },
            token: {
                accessToken: token.accessToken,
                refreshToken: token.refreshToken
            }
        });
    };

    // Attempt to authenticate across different models
    const models = [Students, db.headdepartment, db.librarian];
    for (const model of models) {
        const result = await authenticateUser(model, email);
        if (result === null) {
            continue; // User not found in this model, try the next
        } else if (result === false) {
            return res.status(401).json({message: "Incorrect Credential"});
        } else {
            return respondWithToken(result);
        }
    }

    // If none of the models returned a user
    return res.status(401).json({message: "Incorrect Credential"});
};
export const refreshToken = (req , res) => {
    const {refreshToken} = req.body
    if(!refreshtoken.includes(refreshToken)) {
        return res.status(401).send({message:"Ivalid Request"})
    } else {
        jwt.verify(refreshToken , jwtconfig.secret , (err , decode) => {
            if (err) return res.status(401).send("Invalid Request Token")
            const accessToken = jwt.sign({id:  decode.id}, jwtconfig.secret , {expireIn:'10m'})
            res.status(200).json({accessToken})
        })
    }
}
export const logout = (req ,res) => {
    const {refreshToken} = req.body
    refreshtoken.filter((token) => token != refreshToken)
    res.sendStatus(204)
}


export const createDepartment = async (req, res) => {
    const { faculty, department } = req.body;
  
    try {
      await db.department.create({
        faculty: faculty,
        department: department
      });
      return res.sendStatus(200);
    } catch (error) {
      console.error(error);
      return res.sendStatus(500);
    }
  };
  

export const getDepartment = async (req, res) => {
    const deparments = await db.department.findAll()
    let data = []

    deparments.map(i => data.push({
        department: i.department ,
        faculty : i.faculty 
    })
    )
    return res.status(200).json(data)

}

export const deletedepartment = (req ,res) => {
    const {department} = req.body
    console.log(department)
    db.department.destroy({where: {
       department: department
    }}).then(() => res.sendStatus(200)).catch((err) => {
        console.log(err)
        res.sendStatus(500)})
}

