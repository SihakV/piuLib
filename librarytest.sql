PGDMP         )                |            librarytest    14.5    14.5 W    ^           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            _           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            `           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            a           1262    16531    librarytest    DATABASE     o   CREATE DATABASE librarytest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE librarytest;
                postgres    false            b           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   cloudsqlsuperuser    false    3            c           0    0 4   FUNCTION pg_replication_origin_advance(text, pg_lsn)    ACL     c   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_advance(text, pg_lsn) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    237            d           0    0 +   FUNCTION pg_replication_origin_create(text)    ACL     Z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_create(text) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    225            e           0    0 )   FUNCTION pg_replication_origin_drop(text)    ACL     X   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_drop(text) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    226            f           0    0 (   FUNCTION pg_replication_origin_oid(text)    ACL     W   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_oid(text) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    227            g           0    0 6   FUNCTION pg_replication_origin_progress(text, boolean)    ACL     e   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_progress(text, boolean) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    228            h           0    0 1   FUNCTION pg_replication_origin_session_is_setup()    ACL     `   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_is_setup() TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    229            i           0    0 8   FUNCTION pg_replication_origin_session_progress(boolean)    ACL     g   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_progress(boolean) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    238            j           0    0 .   FUNCTION pg_replication_origin_session_reset()    ACL     ]   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_reset() TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    230            k           0    0 2   FUNCTION pg_replication_origin_session_setup(text)    ACL     a   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_session_setup(text) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    231            l           0    0 +   FUNCTION pg_replication_origin_xact_reset()    ACL     Z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_reset() TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    232            m           0    0 K   FUNCTION pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone)    ACL     z   GRANT ALL ON FUNCTION pg_catalog.pg_replication_origin_xact_setup(pg_lsn, timestamp with time zone) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    233            n           0    0    FUNCTION pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn)    ACL     �   GRANT ALL ON FUNCTION pg_catalog.pg_show_replication_origin_status(OUT local_id oid, OUT external_id text, OUT remote_lsn pg_lsn, OUT local_lsn pg_lsn) TO cloudsqlsuperuser;
       
   pg_catalog          postgres    false    239            �            1259    16532    books    TABLE     �  CREATE TABLE public.books (
    id integer NOT NULL,
    "ISBN" jsonb NOT NULL,
    cover_img character varying(255),
    title character varying(255) NOT NULL,
    description text,
    author jsonb NOT NULL,
    publisher_date timestamp with time zone NOT NULL,
    status character varying(255) NOT NULL,
    categories jsonb NOT NULL,
    borrow_count integer DEFAULT 0,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.books;
       public         heap    admin    false            �            1259    16538    books_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.books_id_seq;
       public          admin    false    209            o           0    0    books_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;
          public          admin    false    210            �            1259    16539    borrow_books    TABLE     �  CREATE TABLE public.borrow_books (
    id integer NOT NULL,
    borrow_id character varying(255) NOT NULL,
    "Books" jsonb NOT NULL,
    "studentID" character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    borrow_date timestamp with time zone NOT NULL,
    qrcode text NOT NULL,
    expect_return_date timestamp with time zone NOT NULL,
    return_date timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public.borrow_books;
       public         heap    admin    false            �            1259    16544    borrow_books_id_seq    SEQUENCE     �   CREATE SEQUENCE public.borrow_books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.borrow_books_id_seq;
       public          admin    false    211            p           0    0    borrow_books_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.borrow_books_id_seq OWNED BY public.borrow_books.id;
          public          admin    false    212            �            1259    16545 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.categories;
       public         heap    admin    false            �            1259    16548    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          admin    false    213            q           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          admin    false    214            �            1259    16549    departments    TABLE     �   CREATE TABLE public.departments (
    id integer NOT NULL,
    faculty character varying(255),
    department character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.departments;
       public         heap    admin    false            �            1259    16554    departments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.departments_id_seq;
       public          admin    false    215            r           0    0    departments_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;
          public          admin    false    216            �            1259    16555    headdepartments    TABLE     �  CREATE TABLE public.headdepartments (
    id integer NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    "ID" character varying(255) NOT NULL,
    role_id character varying(255) NOT NULL,
    department character varying(255) NOT NULL,
    phone_number integer,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public.headdepartments;
       public         heap    admin    false            �            1259    16560    headdepartments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.headdepartments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.headdepartments_id_seq;
       public          admin    false    217            s           0    0    headdepartments_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.headdepartments_id_seq OWNED BY public.headdepartments.id;
          public          admin    false    218            �            1259    16561 	   libarians    TABLE     �  CREATE TABLE public.libarians (
    id integer NOT NULL,
    fullname character varying(255) NOT NULL,
    "cardID" character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role_id character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.libarians;
       public         heap    admin    false            �            1259    16566    libarians_id_seq    SEQUENCE     �   CREATE SEQUENCE public.libarians_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.libarians_id_seq;
       public          admin    false    219            t           0    0    libarians_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.libarians_id_seq OWNED BY public.libarians.id;
          public          admin    false    220            �            1259    16567    library_entries    TABLE       CREATE TABLE public.library_entries (
    id integer NOT NULL,
    "studentID" character varying(255) NOT NULL,
    entry_date character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 #   DROP TABLE public.library_entries;
       public         heap    admin    false            �            1259    16572    library_entries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.library_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.library_entries_id_seq;
       public          admin    false    221            u           0    0    library_entries_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.library_entries_id_seq OWNED BY public.library_entries.id;
          public          admin    false    222            �            1259    16573    roles    TABLE       CREATE TABLE public.roles (
    role_id character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    role_description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.roles;
       public         heap    admin    false            �            1259    16578    students    TABLE        CREATE TABLE public.students (
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    "studentID" character varying(255) NOT NULL,
    role_id character varying(255) NOT NULL,
    department character varying(255) NOT NULL,
    date_of_birth timestamp with time zone,
    phone_number character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.students;
       public         heap    admin    false            �           2604    16583    books id    DEFAULT     d   ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);
 7   ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
       public          admin    false    210    209            �           2604    16584    borrow_books id    DEFAULT     r   ALTER TABLE ONLY public.borrow_books ALTER COLUMN id SET DEFAULT nextval('public.borrow_books_id_seq'::regclass);
 >   ALTER TABLE public.borrow_books ALTER COLUMN id DROP DEFAULT;
       public          admin    false    212    211            �           2604    16585    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          admin    false    214    213            �           2604    16586    departments id    DEFAULT     p   ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);
 =   ALTER TABLE public.departments ALTER COLUMN id DROP DEFAULT;
       public          admin    false    216    215            �           2604    16587    headdepartments id    DEFAULT     x   ALTER TABLE ONLY public.headdepartments ALTER COLUMN id SET DEFAULT nextval('public.headdepartments_id_seq'::regclass);
 A   ALTER TABLE public.headdepartments ALTER COLUMN id DROP DEFAULT;
       public          admin    false    218    217            �           2604    16588    libarians id    DEFAULT     l   ALTER TABLE ONLY public.libarians ALTER COLUMN id SET DEFAULT nextval('public.libarians_id_seq'::regclass);
 ;   ALTER TABLE public.libarians ALTER COLUMN id DROP DEFAULT;
       public          admin    false    220    219            �           2604    16589    library_entries id    DEFAULT     x   ALTER TABLE ONLY public.library_entries ALTER COLUMN id SET DEFAULT nextval('public.library_entries_id_seq'::regclass);
 A   ALTER TABLE public.library_entries ALTER COLUMN id DROP DEFAULT;
       public          admin    false    222    221            L          0    16532    books 
   TABLE DATA           �   COPY public.books (id, "ISBN", cover_img, title, description, author, publisher_date, status, categories, borrow_count, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    209   �l       N          0    16539    borrow_books 
   TABLE DATA           �   COPY public.borrow_books (id, borrow_id, "Books", "studentID", status, borrow_date, qrcode, expect_return_date, return_date, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    211   ��       P          0    16545 
   categories 
   TABLE DATA           H   COPY public.categories (id, name, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    213   ��       R          0    16549    departments 
   TABLE DATA           X   COPY public.departments (id, faculty, department, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    215   ��       T          0    16555    headdepartments 
   TABLE DATA           �   COPY public.headdepartments (id, firstname, lastname, "ID", role_id, department, phone_number, email, password, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    217   q�       V          0    16561 	   libarians 
   TABLE DATA           o   COPY public.libarians (id, fullname, "cardID", email, role_id, password, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    219   %�       X          0    16567    library_entries 
   TABLE DATA           `   COPY public.library_entries (id, "studentID", entry_date, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    221   j�       Z          0    16573    roles 
   TABLE DATA           Z   COPY public.roles (role_id, role, role_description, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    223   Ͱ       [          0    16578    students 
   TABLE DATA           �   COPY public.students (firstname, lastname, "studentID", role_id, department, date_of_birth, phone_number, email, password, "createdAt", "updatedAt") FROM stdin;
    public          admin    false    224   |�       v           0    0    books_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.books_id_seq', 33, true);
          public          admin    false    210            w           0    0    borrow_books_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.borrow_books_id_seq', 50, true);
          public          admin    false    212            x           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          admin    false    214            y           0    0    departments_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.departments_id_seq', 9, true);
          public          admin    false    216            z           0    0    headdepartments_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.headdepartments_id_seq', 3, true);
          public          admin    false    218            {           0    0    libarians_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.libarians_id_seq', 4, true);
          public          admin    false    220            |           0    0    library_entries_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.library_entries_id_seq', 832, true);
          public          admin    false    222            �           2606    16594    books books_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            admin    false    209            �           2606    16596 '   borrow_books borrow_books_borrow_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.borrow_books
    ADD CONSTRAINT borrow_books_borrow_id_key UNIQUE (borrow_id);
 Q   ALTER TABLE ONLY public.borrow_books DROP CONSTRAINT borrow_books_borrow_id_key;
       public            admin    false    211            �           2606    16598    borrow_books borrow_books_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.borrow_books
    ADD CONSTRAINT borrow_books_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.borrow_books DROP CONSTRAINT borrow_books_pkey;
       public            admin    false    211            �           2606    16600    categories categories_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_name_key;
       public            admin    false    213            �           2606    16602    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            admin    false    213            �           2606    16604 &   departments departments_department_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_department_key UNIQUE (department);
 P   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_department_key;
       public            admin    false    215            �           2606    16606    departments departments_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            admin    false    215            �           2606    16608 &   headdepartments headdepartments_ID_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.headdepartments
    ADD CONSTRAINT "headdepartments_ID_key" UNIQUE ("ID");
 R   ALTER TABLE ONLY public.headdepartments DROP CONSTRAINT "headdepartments_ID_key";
       public            admin    false    217            �           2606    16610 )   headdepartments headdepartments_email_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.headdepartments
    ADD CONSTRAINT headdepartments_email_key UNIQUE (email);
 S   ALTER TABLE ONLY public.headdepartments DROP CONSTRAINT headdepartments_email_key;
       public            admin    false    217            �           2606    16612 0   headdepartments headdepartments_phone_number_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.headdepartments
    ADD CONSTRAINT headdepartments_phone_number_key UNIQUE (phone_number);
 Z   ALTER TABLE ONLY public.headdepartments DROP CONSTRAINT headdepartments_phone_number_key;
       public            admin    false    217            �           2606    16614 $   headdepartments headdepartments_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.headdepartments
    ADD CONSTRAINT headdepartments_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.headdepartments DROP CONSTRAINT headdepartments_pkey;
       public            admin    false    217            �           2606    16616    libarians libarians_cardID_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.libarians
    ADD CONSTRAINT "libarians_cardID_key" UNIQUE ("cardID");
 J   ALTER TABLE ONLY public.libarians DROP CONSTRAINT "libarians_cardID_key";
       public            admin    false    219            �           2606    16618    libarians libarians_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.libarians
    ADD CONSTRAINT libarians_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.libarians DROP CONSTRAINT libarians_email_key;
       public            admin    false    219            �           2606    16620    libarians libarians_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.libarians
    ADD CONSTRAINT libarians_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.libarians DROP CONSTRAINT libarians_pkey;
       public            admin    false    219            �           2606    16622 $   library_entries library_entries_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.library_entries
    ADD CONSTRAINT library_entries_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.library_entries DROP CONSTRAINT library_entries_pkey;
       public            admin    false    221            �           2606    16624    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            admin    false    223            �           2606    16626    students students_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.students DROP CONSTRAINT students_email_key;
       public            admin    false    224            �           2606    16628 "   students students_phone_number_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_phone_number_key UNIQUE (phone_number);
 L   ALTER TABLE ONLY public.students DROP CONSTRAINT students_phone_number_key;
       public            admin    false    224            �           2606    16630    students students_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY ("studentID");
 @   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey;
       public            admin    false    224            �           2606    16631 (   borrow_books borrow_books_studentID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.borrow_books
    ADD CONSTRAINT "borrow_books_studentID_fkey" FOREIGN KEY ("studentID") REFERENCES public.students("studentID") ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.borrow_books DROP CONSTRAINT "borrow_books_studentID_fkey";
       public          admin    false    3259    211    224            �           2606    16636 ,   headdepartments headdepartments_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.headdepartments
    ADD CONSTRAINT headdepartments_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.headdepartments DROP CONSTRAINT headdepartments_role_id_fkey;
       public          admin    false    217    223    3253            �           2606    16641     libarians libarians_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.libarians
    ADD CONSTRAINT libarians_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.libarians DROP CONSTRAINT libarians_role_id_fkey;
       public          admin    false    219    3253    223            �           2606    16646 .   library_entries library_entries_studentID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.library_entries
    ADD CONSTRAINT "library_entries_studentID_fkey" FOREIGN KEY ("studentID") REFERENCES public.students("studentID") ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.library_entries DROP CONSTRAINT "library_entries_studentID_fkey";
       public          admin    false    3259    221    224            �           2606    16651    students students_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.students DROP CONSTRAINT students_role_id_fkey;
       public          admin    false    3253    223    224            L      x��\�r7���<�[��5$ͫn[�)J�mٲ�Xr�dvj
�I��t����*��g_/O��w�MR��H�V�l�� ��;�����~P����zpzyt��N�AC=���;���A{0�uݽv�������������;ӢX>~<rnZ�&�i%n?x�������۽���鏶�z����ۼ&�v��F⮍���'�v�����W��|;��ݹ�u�}�c��W.h�켲�T�L=��&s�웠��g�J�I�˕Vs���jdt2�G�9v�����k�RύZ�"�b�jj�Zh_��+��*#a���V/��Eh�ԕ��(=����mb�g�R�2�1Yꖹ�dF�ʷ�UKa#�Ƞ�S�OTfƅ;�W�jT�p��D�։�����B��h��8���l��5�'��k�'�-S��ͼөZd���sz�8[�/�R��ә�6-�Ի9��5��ε�aRR�]L���Wo[�-�ԛ2�AA��9��u��i�J� �������8��Uf���zE^���kY9?�um�C��rc<�Q��NA	^)<[43�}�U��҂6�sq��E�Y�Qk��ހ_��2�����t�{�v?��w�n����H��4C�Ia]�w{;�vo�ݮ�v����������n�;P��a�s��v���諃;*��n����۽�bn��C1���|�8u��)�+]�<]��;/ �Ai?�Ȯ���Z}oM�빺6� 
�"qYf&F-��D�J�����K5!������N�'��b� �|	z���	��@H�r���>��L��i�DC\R_N�P*0�(yƠ���S���7Yr8��W��|RLeʱ�D\�ai|��UnL��fAp�A7%���\��7��x�A�4ja�D�D{��[�B�,�q)���RZ�+!�xs
W:Î*�Y޻��c<�&U��&�}�9�306K97:�ۭz�׿�^t�}>�����b�.�~����nӍ[�i=�/��N.�����ޏwP�N̷I�OU�>�s~�����Q3oa���p�2ZN97K=������UB	��8���/�櫐G����hL o��*�MH���MƤT��k]�9�t���|Z�	��ɝ�y��B�[��l���z}t���"�u��!�E�Zԧ�.2G�����s=����Q��bU���q|�I��R�)^���r��X�-�
ք8ԅȂG)ozfQ�� �J�Yj�����"[Xx;p,��4�	���F+s��"��&*�Z�Ã+z��� ��46��RFGދ�N�l�['g�z/����n�N�/���̢�k+�5dC����c_�?n�DLA-�r��,�-�V���`"uV��厤I���L�SYVn�W`�|p9��ّ�~W~g�:�R�Ӣ�8�N����9���q���F��g��Q0�r���F&���\@�>�n�F,%3n����G�R�����CHf��#3���3�V��^dzՐ��0��cf4�Q�F�̈́��q��ek?)!�[Ȣ�& �6L����R-CԲ��ɧJ5ҵ�[��ښe�P����rK���ʹ�(.i���L�+�i.����S�%D?�>�Q,� ��d\qgCpex�,W2�KS,��+[, 4esV����a^�-�H�jBߵ�)A�7�ro٠ B@0G�o�4�����`?�%�����΃"�($(���NJ��'Ӣ�	���P�vj�=�P`yZ�Oyx�Nj'F
;�vrcn����Œ�э�
�gz%nK�*S�đ�ա����;
b�7����nx�
eYrpD�� t1���Ǖ��R�h���j��V�yd'�*�UX��nW��.����f�pC(E��6Y^c����$��U��>���8bo�z����!��Ч�_F��2
���O���k��y�zu�����U�Y��4d�P���Sdu�V|V%vrp�JTn�F$),t
�]R�O�wp���]��,g-�d8t@�9C1|��[���ӳG����Q�9�rC�h�^�|�H��IRGԊK���@h{��;��e��M�+H�~l�mf?�|>RWh�l.���/�9�X;�É`ԓ���\qG~����\��._�`2����/A�z��ݗyԯJV^��7F8����GtW�X�_ygg�2�����7��Z�?��t��D�8�#���ڰ8�.�C�/ ���2���r8����ff�H=��U_caX�c�3�1�9��;b�a��`"\���[���9&�2��r�D#�]6���9n(8'Z��W�F<�3-�F�&�zᦘznR9��=�p��T��'���A7���m�� 	�Y=���8}���3��×p$��jܙ� �8wf��G����w���>眦1�>ͧzdM�����:�����k�X�>��P���*�/�����̲@1Y��`�gO�,����>�i�P?���׾Z�?\�zg�$k��#�:�2J=�)]B1d�v|Q��5�.�7Q��S��8���J������8�N��l�[�Ԃz�Xy׀PФ!��낔I`Qۆ!=-�T�w/i��.�a�.�h:f�����9��7�8���� �a���aS=%G�ߍ����^�@���z�G������`�o�����O�.��WAׄt}����=��vU�9�`q�IԨ�M����:)=`����P�79`��T�����<�����搽�AsOS�HaÍW%"�O���o"}���	�z��+��N��k{����1|:&��>�����V�p#�S���A�p�����3��-G��w����~�9�z���B����y��O�����9�W��^ό�lQ��#��U��~�<s�_�(�`U�d��
 L�f�a�Gтe<��pW�V�1�D3e0i�����)�2|^N�z���8�a���Ya�s�K�7��\S���)�T���9 ,�rjX��r���R�35�#Ƅ@�R�3	�E� _wL�t�J��~��V�+����R)���n�>�ؿ��t����.��w&����P�Z�
�U��`�����2����o c^�p�^�EՓI��
��U�d3�!�/�f��n��q1ޥ��A����%3��}s>�H"T��&>�K�)��Z��@�&�V�9o_2nǄ1̐`�Gr�xd���L~m�s.�0�H�	�7�V(���*�O��e �0`�QpA@8��෤��z2�]�&�0i��r�J���Vlo�РPo,�)��y����Ոl%�&Fv�a��PJ�XWHf��c�o��[��F���b���U�T�@��ZB��8�ƍx)�n���[�0�'�ARm�ib�\��u��{b�I.��
ŸD���@`o�2g�H3A@��8�Hˤ��)_��9k�{'��Y��ޫ�9l����������W��`�����1��=N��?������{�/����h;(�#f�j�M�K1����ȹLpLv��+e�J
��Rc$�	�i��f@��˼�+,u�%.j@��r()��ҘM$��Q��x3)3�`1�$y�*M�0��Ch�	���,�k@I�p�J�|�A�r
���s`C����+[gЄ����4F�am'ė�h�����,�5�;`�5�*�B:#�(���d�e|���������8Y�~��mtb��}7!�t�����=��s�rE�x�����5�#{�I�s��9-�M|N��5�+������)0A����a�li�C���k�c��B'3� ".��'��p���z�r�H�>�U%TY1{���%�2f��#G-��ҎM�/Na:� �`V��ű�f�'�y{�iMJ�6C>YJ���C�ʙ�z�HuR���U��+�*?HV1sf���w��F�bs�(�V|�d�8)k7��x�<����w�'���h3F�DSSW��	H5�RRe��ѻ
��'�a�X��b�Ur�RT�8�L��H�{� 6ҕ��l�_�y[��
����+$ƽ4�� �  =|ja��RR�Lw�3��>6�kv:tN��o�z���^e�;�݃���B�z@�~U�����p8�����+=���c�A]�4\*�b&8"�����9D�Z~�t^�˒�����S�T>Fnż,a����؝�&H.uj6�/1�Z�;:&.� ��b5���y�p��G����3C�G��j�{8���1�ݻ�s��9��:�[�y=�}�s~���������h�I��=��` �Y_Q;�Uɱ�0!��PH]25)�[c��ZK<z3�ݞ����Q������T�c|m#�� S�ji�5drlԙ�E{"`N�U��)�Mb{���l-�����
�Ī��C��Ӑr셎/�.���X�՞��i���jR��r�1} ��qJ(m��q�$� �Ӓs
m�	k���j�/p�e��H�N�ͤ���i��F��'�}6��9!Ҹ��x��+u\�֪���I���*��u�Υ��A*1_.�-Ω-y�r~�*vK�#�e̤T�P�lGQ)6���)��5�0�	��$�?	���ʽT�a �����yK���\�����2c��
Acf��t ���ޝ���ͭ�NWuڇ��aw��DxK?חr-��n����=�R���И�ǧO��ӆ��
���'UD\�@�XN�yD;�uyr�\�1H:�ji�Geը惉
�]T�M����/�E��{V���|tI��&��^=Z�*�k�l�
��D۹�օ����Hs=,��h�f����1�$^q=��� p�ݣ�z0��Sc?QG*+\XW�o֔?)�b#�8�Vb+�OݢP8��A�R����Ӳ&��Y-(�zi���c� ۰'-�`�b�n�s빵X-������hv�v(lr`�&�R{��K��`����Rzz�k�d�@�`?|�/���� ��$�r6��	��^�aHL�_�73��$X�h���/&]����%l�w${g�<�߭���d���陊�b���R6�D�gtEl�ݜv���*��s���J�
���V��כ���4"���I��C�c����V����L:�wMV�W����:%-h�4��XxC"1,����W�ۡٯ�=$@�c����
c�TS�����SZ�Kf���;u9�^g3��%��ov�Vt���VK����nko7B�[�.��5��^x�rּ��������?���&k~$)I����;�q��;�3�̘{�,�-��,\G� q��ˈ�N6���� eb��2���	ڿ!XXʊ�c:N�6i�9T8�5U��ESLz	^�̊��c��:\�ӵ�	�Վ��Il�dE#�p�^����al�?w�6Z��-��t���7M��(&�nd�5#�ؽN�D(�+ ������f�f#tt�����K��X�����W�jY��7�����a��D�0֡����aGK���UF�fL�bW�^�c_w�K��[�@��=�I���6��W�,��?�ZR
��
/*C<2k�f�*Ç�5DG�iu��g9g��g��T����oϱW8�C�jbE��OTl;Ա+��ڐ�� 2�6�q�gm�0b�Ö@��sŴq��b�l��-��x�^���h����{r�(:I����4'�.O(<Nΰ��s��-�q�{<�IYT����kb
.��'�����ume�ѾA;��;`߂��f��dۉ�ՙi�'�0��]��W��O_����zr�t��tx�U��}9��'����@j�m7!��/8�����3�J�����k@F�XVb��V��b�o�ww���ϊ�U��J�޺aI���Qɭ�e;#c�
X���@���J�n�g)?��_����u��"����|�X}�=�#�L�U�BJb��dD\#����xC"e6&a�;�W�l=_[���륞YRb�p�6k w�6$��TqicF
i&��s�-��H _45-E3@X�l�L�#hD��d:�����'�Y\n4Uw=�VF"��[�����1�!V6X
I��r�=;���"~�5ٷ��z���VP�դ��=��^�ku��[��tũ���������HY�j��Ur��cW�.����7�f��	�\*3^��!���D�	|���Î�8�����w}r��zW�t�����8�h��%�` 6K��Q(�ơE���?V(0U�?��1d%��z�ޝ{Ov�_o�Q�G��k���s/���tn-�}	Es��zON߿����͙�3(6I=�zu6�ҬG��G�D�Smrsd'�n������V�T7��Ɔl��0U,�ړ~��0 3n��meP׈F��H~LTѿ�����e$�0����dkP���x3�[:n˞��:w L+�n�0aG��C����{�(?~̪^�������]�ӕ�hD��f�]�U#�*�4�'�~��O#���&fM	Y��<|su�(���*�(s[H��/��B�&K ����$u��aZ�T�EH�1�yǦ�-�ĳ�B��U�L�H�q�"�p��z�6�t
��o�Z�}٭��,^���d��.��޺�V��L�I�{LR��Y����^w�<q�S���az�,���x���~�������2E2t�W��˶N�M��P�"`�6,�-�	��u�u�H8��+���x��Y<���8)��܍8�����Ȃ�
A��c���%���Kva����Dl�[��=w�i��0�]�d�/N�LF��ܬ����=&X���o�~����xI�V�hN��r�6C�/���v(Uيx^Qm>@U�tYoB����ηM	���z�sb�r�N��%����c�g������&�/~�A?�^�~j=�~���^�u�i/� e(�~�������7���}��ŦA(�t���ݭy9��WЂ�@eş����B�o�H:�����
�9���2��� �K�B�b�I��^��b&_�Q�>^i������Ѿ`�9"��Y;�b�ί�����$h�J���j2�/�1_��Z0���3�:i�231C�M�!+%��7_$�R��BzSdw�1�ӕz��둄�t���Q���[�����O�O�N�������Dj�{�7 ��Z��@��;A��~�����^��_W����`W�\��T�y�)k'����������t��N	��eC������f�����X4W��z��\ϯ����6t��me�cm�ڊ�b���Q�;�o�`�(S�`��-���L���QA!,��J5���\�1����U��o9�kv��3��E�˶n\�(�b
T�;~�N��XS�-u���]#��	Fe��8�\����~��;�Q|�48��x�} ������0 �!��'?�K_�+=�A�l���ߑ��A�Pߩ�gw϶��zwK�4���A������h�gx-݆Q��D�EL��^�q��X��A[�Z����(�.�^�vݗlU�r���͍���-�.����K���E6mZb���~u�=�g���*�|��W���ꫯ��a8      N   �  x��Z��6��<�zAmG��+�\�I�4�L�i�E@I�̌$�$e�Y�;l����I�;�d{O'�v[,�6�y;��|����F:��|2���Iw2�G�(�8DI��?���nMYtحӳ������f)��}�<naPf��r.���`4�ƃq<	o��a��o.����5�_~�+m��/;Q�������.i^ۅ��?�z��-{Tg�h���fh9_qY�{����4���(���M�J���i`a�rz�v�ԅ��J�襪�_�NUe!�g2�cG���z6�;�=�p�ee�H��5f�?Ćw�_)U�/Rq'O�s���T-���ҩQ����E��`��7��?8�����a7��i8�(��)��JKa�U��:�!7�b?�)l*UmX����V�O��2aR-����,�E�`Bm[K�`�a�.��n���6���b�ɠǂ�
�N8yHi��u5�RO݌�<��E�q�G��\tU�1^Y��J�aҰ��]��_�̖1��d�[f���)��J-J��KHck9ny��E�EE�c�'n��D��ӊݯ�Z�ٳ�"�$)��ۺ���O녂�Em,IÖj-4��I���@�dC�%�2qe�r-�R��'��Ǟ�9\�S,�0�'�
ƭ3�B��s
��f�r�>�M��}�C�,�+�sc��&��)�Ԛ��BU�������演ŦÒ�`t+�����-k�l�B�%���]�j�׌��}{��C��=�[�e��y؟��t0�������Z������zG�ջ~��_�I!��{w�΃`��� ��#�������q4
�~���0:�`G o�`| _��X���y)��r��RV9{*R�D�@�ĥ��s��}�+�g�YhN_er����ܽ�D��;i��wĵ�4����j\�KN�p�{�Ip��7Rhs�*�C!'{gGj�`B��*j��`���ֺ&'��3�\�Q���n1n��2���Φ���#in�5��>�'CB��"x\�_���d��� ��C.0!�m�y�,�~t��:@[�kAj��;��X�'��)B3�r�҉j%�S:���2%L��e�Ìs	p� G�X���������I뀺��et����p�=|J�3fE��T�r�9��f4�v�6f�0�rIi��ʳ��J���HΌ(�;�� �BYK@�}:Ѷ��z{����?�yO�v.�PW��fيW�[��g�\R�A8��X�5;�B���O�zsYU�h-��sYe�:�6Paŋ�b�;�"u�o2��ͅ�nȰ�1����Z��N�۷��a4<���{���E������Ӎv�;YX8���4�F���ب�۱�ן�iloY�R���_�z�0�jՈ���7��x&�n$���Qw��n���~4���n�p��D����0~"ܮd�S�
�]a^���2�� �.J�0(Uܪu��{�� `��
��e����4re��ɋ����������/#Gp�'�~���c�eg�c	�\�w�2�tD�ap`0�RL)Z�2��hZ#��3:����Ȕ3R@QFr�ʴ��^�t��`#��E^\SBxa(�q���V�w�s,jwJ;81�`'78������ Dĕ�nS�-��CR�q`��VFr	�VN�z铝_S.�X���(,��6���[�j�r.��i0�M��1���������{8��h����}���=CX�	z���CwV�c�a_(�@�W4��談jQ|�����P�������Z��_p�/��g�=��U��%B9�%�M����X�����JT&p]K
dwӿ:2>��;_n�Uپ.�='�ר�$�:3P�u7�kW�
�X�� Î���^i�T:x�[�� �T2-@��[� 4���K��5�Ae-<w4�� Q��Ԡ7f�a]\`t���B^_JjE�d�"`aC!Nc7eղ�|�r��H�j̈�/�VZ������T+	�T��"�I�ۿ�o���a������G��Q�+���p0�V\�����#^��oT�3J���.��'�Ǽ�/#�Q��.��pv� 7i�ⷐ��zs�-���Mݎ���1�P��tO��^4	'&�L���ۧ�G�U�%ҏ��e�ڴ�Y&�s���Me�K��e���������@6B6����3[q_<��Ɇ ���)�x�Km4ѭ��yMy�ؚ�ĶnH[m�5�����-nc.)�
M�bi�
DM="N{T��Ɇ�Wim�V�n�����;Q=��	B�����Dנls(TW�� ]Vdyt|�/
��K�O�2@�Dd��ʦ����N�jf�lVTd&9|yK���X�a�FG�ENn�E��@8q�c�ҿ\�ۡao0�+�E-�92N�����U�^䪟���F����(�x��	O��p<��Q�db>��8����nʨ�h���n-8�!��_=�R�(̤�p���$;[���?�?v���y�x�w�H�����ߥ?vB��[��K�;�z���s�P�h�Π�O�����E�0D^$$�P����'��c�}��׿���KB�o$�* �ږP�2s"W
 ��NGx��h�aV	�k���9�#�T�-2�G�q�3�>�%a��lZ]��ٵ�uy|�UgJ��1�|�r�ի�i@&����O��(c���Ȕ�"PE����4vS��lV�z�N��|1ϩ�+�������}�O�J��VWҚζe��K�.5��O$4M����`�9�$�隔�7t��Riߧ�P�R�r�0�w�\����(P�T���uW�	�
������MrR��8��䣣��I�A#+��.��}�P>�m���`j[j��e�gn:(ٷ�D$C@`���NU�LDY�(�(;PǛ"���B�Z���7��Zz�\�h���V'���������z������kU�o)�mkP�F�M6�}�n̰s�uO]�c�u=�D*]�m�p|��V%��5�~*�oiB�Yv�F���4�>V���'�}'�3�{�~��t2\��)�@c�.�n�:s�_�Wo[��k�C����"h�j�.*�.|�68�V·�����a���*L�Z��D`�6ه�m��at�O��I4��}����[ȋ������'��M����}��Ot])v"��/�N9�(�{��h��=� vg�Ͽ~|�5{t��ݻ�`��tv�gс��k]~�'���s�w��t�W�T�x�9|���
��ق�|_¥#�)��z~��0���(E&�~H�X�3E�N~;�{���m�+��~O&�u���1��'w]��>T�G�ΡF���/���O_��� *��
�^�){@u�c�����'��I[x�l���5FƗ���+������$��C�Pk 'l�q�5�N��H�׿���v?"��n�T;�yd$�n��FeZ�K?��C�����-y��]����0-�C�m��V�/d�#��k�^`7/B^c|�^��~���k�~V@��y�-~��̭^�b�W��������*�L-H�iaԎo�ܕ��5k�k~G�d:IM1�1'�\mC��RW��&?v�)���݅6%@mѹDR�?���<�!�ׄ�tu`�(*M�9�x���<����V�s���0�����I��:B�
"v/���}v�O��k=Yq	u��wl�mf����������A܋{5:u���=("�}���Ջ�hH%�?z7o����(      P      x������ � �      R   �   x�}�?�0���St7�R�J75�88����6�����o�b"�I�]�~�d���#�xף5�C��\з��A�n�F�����E��y"2ƗJ%e�y9�?]�u,B#mkУ�fRWggц؍��*g�+9WO��>(?-�N��������}��MS-�R+c|���ʴ���n�SJ)���d      T   �  x���Ko�@ ���+|�Vy�3���T����Ґ����6�_ĬQ���DJ���:i�ͧA��{C&Zn�H�dcJ]�h7 p��V�h;10ۗ
l�k��1JrU����ƺS���&�}�uINm�������YAU]�>�}`���Wj����s��v����z������,	N���i��v��'�� Cn3�f����Q!���K��/����6:��}5�<��q���'/N��Y�o��lH�ߖ��#Kw�����8����H��_gg!�b`�	���@ sݝG�ɻ�����n�n��&�+YX�Fn�5�6֗:��&So˪��*?dնn�[�"ٶ��}'��/�ՃF�e��.]n����u�b�Q~>]���e`!�;���b���&7Āz<8c�^������      V   5  x���MO�@��s�+z�fv��]�mOF-�b�h�/[�J��������E��̼�'��0KS���B$BJ���:�8��CnҌO��J0�tG&��&)1,��f��"�:
��0U�\��E@�A�9D��	��: �K�2p����m���J�Ml,p��
\�7�_-
[��䆖�f ��&2Gr�n�T���Q�Dqu��z4�.�E���3s���`Ǔ�Q�����3�ￋ�|�N@د��������{������/����M��v5����z���<��y�P8��PH�����d�s۶_�!��      X      x���M��ȑ��S���65�_���Y��f���=jx�-C��~3Y,VD��"��c�`LV�Sd~EDF�م�;߻�O�������_?��?�ه�š���x��\���w���ˇ��Ͽ�|8����o/_������ǿ�����7�\�����ǿLO�up��h:����w?~}-?����Ґ���������)�@A�w�O��~�AךN���έB˃��������唻+�}v!C�b�V�sөݽ��[�7�'�5��;7�'�������۹�����W�͏��������ǖM�Ƌ�Ša��w�A��=�};CKoD��2�eөi��a��x��ׯ����/�2�S_�����mhm:�^�^��e�b����:N���ήbY���C���b�>ڽ��N��?�����׿]��Bݐܞ-g3�ߞ���[�rP1z�������2Ufh�e�܅���A��Š��z�y��0�0���ioF/5������?����_�JT�ň�ClJ�>*F/���'T{[]�\?Q��ʢ��ڿM�M�4>jr!�q$�NF������/�Pm�<��>��h*����<�wAo��l ��o�uʋi���w �� �l���x�����pͅ�G�i��x��k��̰�tg&�ٌ�bY)�/�Y���3�߈0��H0Cc���Ȝ#�V*�e��ߔ_:x7�����U]4�G��@jc���AC��Q�LR���p�6u�W}4A���z���&�iӚ��Z����&�׈y����f��6�m꫻��1{=�~|���-NUR�-�z���V�j)�}�O�) �ɕ�G���#�r���iv[ˇ�o�]	>�+�b�-�ڿM��g��9U{�����.3�����u�_�9�J-�r7���T1s�Y��7\����7r��t���9 5�fN�����˞S�n:��Io1Å���<�8[�~:|���n���ޱ{��ޞ!�i9�
��`�,d;�۪ R��/j��E Ռ_��kK�!��}���7�؄�����Q�M5�U��:"�������� ��8��A�5� Dͷ1��p�]z ���&����&�Kv�1Re���a7�Ta#�T�����2F�Ez���HOG�*�5�*���/���ci��s@jX� 5.�W����+@ͷ1RW���#�݊�P���D��һ�+~@]�s ��s����IjU�9 U�9����s@jУ��[��ρ�o=~b�G@��ΨLpF�O��	
@41`�h�Z �<5�
����B;�f1�'׮3�SN{��k���CԨ=b���G�j|�/�N��z���Ʋ���j��Y!j�G�X�����8�vc����65����2��uS�7�m�I�Fj�WC����gFob�nȹ8��6b�ּ�ZWy-�+�Z��K�:�M�j���y��_k���1|�ښ�Q�̩ox�9��4����Ѵ��;7�Bgfθ"v�o��d-��f�0��̜1�h�
��M�0s�Q�3�z�c��D-3'���&�f�TK��%����{������7�������t�����:m7AT���jУ	�極v�����r֚[�+��r� ��V8@M:���Y�UTG��V�^ �� =�mD���A�a���h��&�QM����k�*��_�{�"�RE���B�������L����6"Cm��=��s jX�<ԬWD&��6zE��F���zm�"z"B R�^!��s���s ��s ��s ��s����s��p荟Q��Q��Q�C�U�U�9�i��s@�9����Ig�BT�]�T�� gWљ����8B]�
��
�k�
�?���|���]�0���޳��Z����M���]��
��K?�xj�K���,�ZS���\����z}m��
��?5F=�ƪ�<�ļS�`5�|ı_����x��.km���Ubn*T��Q3��k-��Z�wV�m�ʺ{�jj�oU0m�f���>jc�ƸD���n ����sS�vK���m\Y���kn��m�v&3����f_�>뮜��TY+7)D�Ik�|8ƍb���������z����
����^c59��T��z�k�������nYez85���K`Ww˘)@1SЖ1S���=���)H1S�Z���a����Q�����DMzW���^�!��T{=���������&S��9��zִ�3��ԘAT3�|:��z�N��U�LAjе�5k��ճ���e>�j4�h��ȃ�F5���(�crC ����&7���(�f�&��?���h��Լ9�j�+��j�
��x(Rkr�!��F��&���lt�j2�!���|'��������"���Q�Fr��<�(�AT���]�<�j�8���<:�3�9՜�@Ts�Q�y�C�늋s�)I����z7N�#�UE�ė�����
sn(ĠWC��J�^b��"�h����_.��z�XV?��4����m��P��}!���b��v��ᴣ>e+5��Ǻ�ĩr���C�5ť�n谯^{��5�>�T��r?����0�;?)��0��Km|+Uj�U�x�9=k��.'��Y�tnDS���Y���o�jI���Jm�6D���S-�\OV:5}�h�K�L��>M���G�}�ɠb�R[��o��{��2l|��J[�P���9�?�C�aqo}Von��F������A����AT+��&o���DQ;�^
R��Ҝ�k����a��PeEG5]��MED5]�daC��[j� TSG��}�*��0��e�UA�F[i���QE���M��񖳉BԤ��f=�!jcs��XB�^���^�G|L+��z��f�Bo8�1=k�c���
��Zc�G�"y�~t�*�+�jn+�����H�T��T��Q{�3�h�T�������D@�w�QMND59��D@g����6����l������C�*����1���e��Q�. Gz�@Ԥ�0D�zC�v��w��O�C����I�Թ�P��:PM�9C��� 5.W���ަ���~�ږ�t���C/c+5��d���h5�tbꩯ?�G��_�.��c�gN�t���^ӷM�_�҂�pX��6��h�F�
����j���j*	 j��+�JH=*���U�v�ʉ��z}��:,U��=gE���=gM�
��(�TSQ���@�:H5g��4��q�}��6�T���L�m�@T��Qӿ��8�jNB!��\5��R>���養3H�*��@��K�԰�?�"RE4��5�����b�\(�Z��de��5�>�T�������9j/��*u�@��A�T����T�<�p�5�g�f�f�T7�R݌�Ju3�*��8jg��a�RS�JM�:_��&���Y�@zρ�Q�95���f��A�F�9��{D5�5�Z��!;]g"�D ��@T!��&B QM� ���z���0jц櫽����ڛ�W�j2 j��7�d-����Ig,�;�릏����ES��,�Y�r��&C���{��8�=������d�CTsݨ�������/��ܬW�M�j��!��?��F���s�j���Fu��J5�K,�uΪ��qg�F��<��^�87��0�����hHm�yB�j"��2����-ڭ�`"�D ��@T!��i� PM� ����d�BM����P�M�5�Yͭaг��� jx;��@����
u��V�ћ<\��r{�*�L5
Y�����M�j� ������a�ju� ��储Q��zCڬ��C�zCT�J@�F��j�y����9u��o�z��î�9U�lW|x#��Q�^%�7l���g5����BTSe QM�D���=�^j�jΏB��bq��������4�68�j�ec��:�jt�!������;���2������zuc����}��2���ʀ��+�T1_A��m���� ��h�]��p�qp�L��Sה� ��\��rт��|2�̗�F�JJ�iCY/��q��-.�����~]Q�����@� N  u�\��3I�_{{vŌ�UF�_�" ׯ����W{����-L@�JU�_�-L�h���L����*uC�~�Z\�&m�B�Ěf�����*�g%���q	�tjW5���iO]�<��vk���5����6�ES��)O�m	�Y;�]�kӤ�Sӌʿ��������6و�k���BԨ�f���OQ�m���V��Q!�S�j���i��5��T��V<�jnLf����Q�]|���Q�]|5��
Q��uWj`���]�>���W����+Hj%u΂7�T�������o��f�Ӎ���a҃)Vx�e�8�*��2f�QeD���xF��� U�qp� �W�*2��]͚�~�nWV�f�X%@js����US��Bmo���3��/oO;�z�G$�u΂��m��m�D<�~+�>5i{���a�j2�!��Z���2����f���_�gm�|�^�x�T{��	n��v�]m������=�QE55Hm�=�Q[o�����9j/�a�:�#N�������
{T7S[�61�N�#�[���>e��הYDS�v�n¨}��7�����K4��o�ݧ�K��zg[�U� ����Q;����Զ5��@3�Ԭ@3GT@�3'�}w�3G䆀3���a�ڹ��8��5�9�
�f�P�g�Ȫǰ�m�ư_��;~�4�L.�"�(h4uz�l	��K Ը�Ձ1l*Q�1,j�6��S��
���	��i��I{��̙w|�di|�tva�Z.�4��sW����ˇ�����/�{����O����?���S�D��ZS��4�_�&=��7]]����^?|Oc:�s�]��맟B�*Ҽ�t�ߧ����OL��      Z   �   x�}�;�0 �99;re;?�gaq~�T���#`.�ޠ�$�,��y(��M�cs)$�涔M�EWc�`>1�.�$a:c�C�x_r�#0}Z��\�,�jd��_����A|x|����|P�|!�J���
�ڃ�vm�?t��'9�~d/����(G�      [   h  x���K��H���+\�݄XUP<\��T�ָ�y�C�_?EO?�n�qc��`w�/2�T\7�C��!e� �c�%cӪ�0�5�����rM�8��M1�<�B����6�B/�3��9a D� aA`�����t���Y��Y�e~ �?�|�e�q��z	H�"�C@{�%�l6}�1e�X[�@[I��(��� �j@�AX����D,/p �R�,Ġu0)9y�0�' �?�Wb ��5Pv������QyZ���ª�j��C��0W-�+��:�r���k�l|��Pb%���T�G�{ٚ'o��"�fKt@K���9&M���K�Å��;Wî��f�Dk���Cy��s�'E��5{��;<0�
�X����H�Vh-U���\�Of3-3D���=bL}h������՟��`�d�8��@̶{OP��u�ԯRc��������f�U�kQn�-1zr����.?���%6<���F�m[�y�$h4(��'���.���[�jk�m���$|G��*�K�1��dt7:���{�J�yF����Hh�7B��c��(��Q��bg���O��w}MnP��|
ts��i�o�δg�+=P�R 
B}���T�С6L��|�1|
Ob�����8s�}}��J=d��z�^|~�*���T���j:�Y�b��c�|e�~�Y$sw�n��N+��-�0���G_y�Ofb�%����4��A�K�|?+��p��	���a\ǉ���˅D;��z���� +����&1�^��ȼ����� c��C:g�������RF���U��6��t���`���t~���P�Z��r���N��ݍD�X/D-'��d~�M�q��ӏ=ʮ��`�x�`��	9;�QdTLg�^�k
c밚�H'���{B�a�݇@C2���Q,��}6�3xc&����)��2U-�|-u��:Z��]k�󗖦^��x���q�,_VG��(ӗ��=���F�5<ڽ�є�=}|��)����z��z�"������b:P��|R�����t�Wd��_�7s�P�>�>$X��^�n%�퟼�c�ߧ�OY�c�	��9������j:a?6�VsÉ�p'v��{]lTo�\�#H'���8:uY���f�Tn?����;y� ���Rk����Ay}Q>�	�,�45�_\������V+�4�&�K:~�]�_�S�-�~�v'[M�7�\��;�XI~O>�2׀\�'* ��Tj!̱1Pz]��b�����C4�0��a�ɼY4���̉�4�l��	�JG{��/�؂�n�ݽU|[�he��X�z��d+��_O��     