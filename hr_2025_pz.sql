PGDMP          
            }            hr    16.8    16.8 H    B           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            C           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            D           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            E           1262    16714    hr    DATABASE     w   CREATE DATABASE hr WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE hr;
                postgres    false            k           1247    16831    employee_info    TYPE     �   CREATE TYPE public.employee_info AS (
	first_name character varying(20),
	last_name character varying(25),
	salary numeric(8,2),
	hire_date timestamp without time zone,
	job_id character varying(10)
);
     DROP TYPE public.employee_info;
       public          postgres    false            �            1255    16835    buscar_empleado_id(integer)    FUNCTION       CREATE FUNCTION public.buscar_empleado_id(employeeid integer) RETURNS SETOF public.employee_info
    LANGUAGE plpgsql
    AS $$
BEGIN
	return query
    SELECT first_name, last_name, salary, hire_date, job_id from employees where employee_id = employeeid;
END;
$$;
 =   DROP FUNCTION public.buscar_empleado_id(employeeid integer);
       public          postgres    false    875            �            1259    16722 	   countries    TABLE     �   CREATE TABLE public.countries (
    country_id character(2) NOT NULL,
    country_name character varying(40),
    region_id integer
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    16745    departments    TABLE     �   CREATE TABLE public.departments (
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    manager_id integer,
    location_id integer
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    16744    departments_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departments_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.departments_department_id_seq;
       public          postgres    false    221            F           0    0    departments_department_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.departments_department_id_seq OWNED BY public.departments.department_id;
          public          postgres    false    220            �            1259    16762 	   employees    TABLE     �  CREATE TABLE public.employees (
    employee_id integer NOT NULL,
    first_name character varying(20),
    last_name character varying(25) NOT NULL,
    email character varying(25) NOT NULL,
    phone_number character varying(20),
    hire_date timestamp without time zone NOT NULL,
    job_id character varying(10) NOT NULL,
    salary numeric(8,2),
    commission_pct numeric(2,2),
    manager_id integer,
    department_id integer,
    CONSTRAINT emp_salary_min CHECK ((salary > (0)::numeric))
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16761    employees_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.employees_employee_id_seq;
       public          postgres    false    224            G           0    0    employees_employee_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.employees_employee_id_seq OWNED BY public.employees.employee_id;
          public          postgres    false    223            �            1259    16791    job_history    TABLE     8  CREATE TABLE public.job_history (
    employee_id integer NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    job_id character varying(10) NOT NULL,
    department_id integer,
    CONSTRAINT jhist_date_interval CHECK ((end_date > start_date))
);
    DROP TABLE public.job_history;
       public         heap    postgres    false            �            1259    16756    jobs    TABLE     �   CREATE TABLE public.jobs (
    job_id character varying(10) NOT NULL,
    job_title character varying(35) NOT NULL,
    min_salary numeric(6,0),
    max_salary numeric(6,0)
);
    DROP TABLE public.jobs;
       public         heap    postgres    false            �            1259    16733 	   locations    TABLE       CREATE TABLE public.locations (
    location_id integer NOT NULL,
    street_address character varying(40),
    postal_code character varying(12),
    city character varying(30) NOT NULL,
    state_province character varying(25),
    country_id character(2)
);
    DROP TABLE public.locations;
       public         heap    postgres    false            �            1259    16732    locations_location_id_seq    SEQUENCE     �   CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.locations_location_id_seq;
       public          postgres    false    219            H           0    0    locations_location_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;
          public          postgres    false    218            �            1259    16716    regions    TABLE     g   CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(25)
);
    DROP TABLE public.regions;
       public         heap    postgres    false            �            1259    16715    regions_region_id_seq    SEQUENCE     �   CREATE SEQUENCE public.regions_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.regions_region_id_seq;
       public          postgres    false    216            I           0    0    regions_region_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.regions_region_id_seq OWNED BY public.regions.region_id;
          public          postgres    false    215            �            1259    16837    salary_changes    TABLE     �   CREATE TABLE public.salary_changes (
    change_id integer NOT NULL,
    employee_id integer,
    old_salary numeric,
    new_salary numeric,
    change_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 "   DROP TABLE public.salary_changes;
       public         heap    postgres    false            �            1259    16836    salary_changes_change_id_seq    SEQUENCE     �   CREATE SEQUENCE public.salary_changes_change_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.salary_changes_change_id_seq;
       public          postgres    false    228            J           0    0    salary_changes_change_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.salary_changes_change_id_seq OWNED BY public.salary_changes.change_id;
          public          postgres    false    227            w           2604    16748    departments department_id    DEFAULT     �   ALTER TABLE ONLY public.departments ALTER COLUMN department_id SET DEFAULT nextval('public.departments_department_id_seq'::regclass);
 H   ALTER TABLE public.departments ALTER COLUMN department_id DROP DEFAULT;
       public          postgres    false    220    221    221            x           2604    16765    employees employee_id    DEFAULT     ~   ALTER TABLE ONLY public.employees ALTER COLUMN employee_id SET DEFAULT nextval('public.employees_employee_id_seq'::regclass);
 D   ALTER TABLE public.employees ALTER COLUMN employee_id DROP DEFAULT;
       public          postgres    false    223    224    224            v           2604    16736    locations location_id    DEFAULT     ~   ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);
 D   ALTER TABLE public.locations ALTER COLUMN location_id DROP DEFAULT;
       public          postgres    false    218    219    219            u           2604    16719    regions region_id    DEFAULT     v   ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public.regions_region_id_seq'::regclass);
 @   ALTER TABLE public.regions ALTER COLUMN region_id DROP DEFAULT;
       public          postgres    false    216    215    216            y           2604    16840    salary_changes change_id    DEFAULT     �   ALTER TABLE ONLY public.salary_changes ALTER COLUMN change_id SET DEFAULT nextval('public.salary_changes_change_id_seq'::regclass);
 G   ALTER TABLE public.salary_changes ALTER COLUMN change_id DROP DEFAULT;
       public          postgres    false    227    228    228            5          0    16722 	   countries 
   TABLE DATA           H   COPY public.countries (country_id, country_name, region_id) FROM stdin;
    public          postgres    false    217   X       9          0    16745    departments 
   TABLE DATA           ^   COPY public.departments (department_id, department_name, manager_id, location_id) FROM stdin;
    public          postgres    false    221   2Y       <          0    16762 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id) FROM stdin;
    public          postgres    false    224   �Z       =          0    16791    job_history 
   TABLE DATA           _   COPY public.job_history (employee_id, start_date, end_date, job_id, department_id) FROM stdin;
    public          postgres    false    225   Pg       :          0    16756    jobs 
   TABLE DATA           I   COPY public.jobs (job_id, job_title, min_salary, max_salary) FROM stdin;
    public          postgres    false    222   6h       7          0    16733 	   locations 
   TABLE DATA           o   COPY public.locations (location_id, street_address, postal_code, city, state_province, country_id) FROM stdin;
    public          postgres    false    219   �i       4          0    16716    regions 
   TABLE DATA           9   COPY public.regions (region_id, region_name) FROM stdin;
    public          postgres    false    216   �l       ?          0    16837    salary_changes 
   TABLE DATA           e   COPY public.salary_changes (change_id, employee_id, old_salary, new_salary, change_date) FROM stdin;
    public          postgres    false    228   m       K           0    0    departments_department_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.departments_department_id_seq', 1, false);
          public          postgres    false    220            L           0    0    employees_employee_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.employees_employee_id_seq', 1, false);
          public          postgres    false    223            M           0    0    locations_location_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);
          public          postgres    false    218            N           0    0    regions_region_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.regions_region_id_seq', 1, false);
          public          postgres    false    215            O           0    0    salary_changes_change_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.salary_changes_change_id_seq', 1, false);
          public          postgres    false    227            �           2606    16726    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    217            �           2606    16750    departments departments_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (department_id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    221            �           2606    16770    employees emp_email_uk 
   CONSTRAINT     R   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_email_uk UNIQUE (email);
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_email_uk;
       public            postgres    false    224            �           2606    16768    employees employees_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employee_id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    224            �           2606    16796    job_history job_history_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_pkey PRIMARY KEY (employee_id, start_date);
 F   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_pkey;
       public            postgres    false    225    225            �           2606    16760    jobs jobs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (job_id);
 8   ALTER TABLE ONLY public.jobs DROP CONSTRAINT jobs_pkey;
       public            postgres    false    222            �           2606    16738    locations locations_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);
 B   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_pkey;
       public            postgres    false    219            ~           2606    16721    regions regions_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public            postgres    false    216            �           2606    16845 "   salary_changes salary_changes_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.salary_changes
    ADD CONSTRAINT salary_changes_pkey PRIMARY KEY (change_id);
 L   ALTER TABLE ONLY public.salary_changes DROP CONSTRAINT salary_changes_pkey;
       public            postgres    false    228            �           1259    16821    dept_location_ix    INDEX     O   CREATE INDEX dept_location_ix ON public.departments USING btree (location_id);
 $   DROP INDEX public.dept_location_ix;
       public            postgres    false    221            �           1259    16817    emp_department_ix    INDEX     P   CREATE INDEX emp_department_ix ON public.employees USING btree (department_id);
 %   DROP INDEX public.emp_department_ix;
       public            postgres    false    224            �           1259    16818 
   emp_job_ix    INDEX     B   CREATE INDEX emp_job_ix ON public.employees USING btree (job_id);
    DROP INDEX public.emp_job_ix;
       public            postgres    false    224            �           1259    16819    emp_manager_ix    INDEX     J   CREATE INDEX emp_manager_ix ON public.employees USING btree (manager_id);
 "   DROP INDEX public.emp_manager_ix;
       public            postgres    false    224            �           1259    16820    emp_name_ix    INDEX     R   CREATE INDEX emp_name_ix ON public.employees USING btree (last_name, first_name);
    DROP INDEX public.emp_name_ix;
       public            postgres    false    224    224            �           1259    16824    jhist_department_ix    INDEX     T   CREATE INDEX jhist_department_ix ON public.job_history USING btree (department_id);
 '   DROP INDEX public.jhist_department_ix;
       public            postgres    false    225            �           1259    16823    jhist_employee_ix    INDEX     P   CREATE INDEX jhist_employee_ix ON public.job_history USING btree (employee_id);
 %   DROP INDEX public.jhist_employee_ix;
       public            postgres    false    225            �           1259    16822    jhist_job_ix    INDEX     F   CREATE INDEX jhist_job_ix ON public.job_history USING btree (job_id);
     DROP INDEX public.jhist_job_ix;
       public            postgres    false    225            �           1259    16825    loc_city_ix    INDEX     A   CREATE INDEX loc_city_ix ON public.locations USING btree (city);
    DROP INDEX public.loc_city_ix;
       public            postgres    false    219            �           1259    16827    loc_country_ix    INDEX     J   CREATE INDEX loc_country_ix ON public.locations USING btree (country_id);
 "   DROP INDEX public.loc_country_ix;
       public            postgres    false    219            �           1259    16826    loc_state_province_ix    INDEX     U   CREATE INDEX loc_state_province_ix ON public.locations USING btree (state_province);
 )   DROP INDEX public.loc_state_province_ix;
       public            postgres    false    219            �           2606    16727 "   countries countries_region_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id);
 L   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_region_id_fkey;
       public          postgres    false    4734    216    217            �           2606    16751 (   departments departments_location_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);
 R   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_location_id_fkey;
       public          postgres    false    221    4741    219            �           2606    16812    departments dept_mgr_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);
 A   ALTER TABLE ONLY public.departments DROP CONSTRAINT dept_mgr_fk;
       public          postgres    false    221    224    4754            �           2606    16781 &   employees employees_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 P   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_department_id_fkey;
       public          postgres    false    4743    224    221            �           2606    16771    employees employees_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 I   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_job_id_fkey;
       public          postgres    false    4746    224    222            �           2606    16776 #   employees employees_manager_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);
 M   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_manager_id_fkey;
       public          postgres    false    224    224    4754            �           2606    16807 *   job_history job_history_department_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
 T   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_department_id_fkey;
       public          postgres    false    225    221    4743            �           2606    16797 (   job_history job_history_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 R   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_employee_id_fkey;
       public          postgres    false    224    4754    225            �           2606    16802 #   job_history job_history_job_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.job_history
    ADD CONSTRAINT job_history_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
 M   ALTER TABLE ONLY public.job_history DROP CONSTRAINT job_history_job_id_fkey;
       public          postgres    false    222    4746    225            �           2606    16739 #   locations locations_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id);
 M   ALTER TABLE ONLY public.locations DROP CONSTRAINT locations_country_id_fkey;
       public          postgres    false    4736    219    217            5     x�5�An�@E�N�	*�r�$���QE�8ĄQ�I4D���Pua��򷟝 ����6���Ho�P�`��fVz�<͆�,�ٙa��	Yj��@r1�Ĕ�mc�����w�=����5�7�B�Jc[�a��ߥ������X9�'�L�����j���Z�.T�!m��;z�.�Qތ���6�)�(�_��I
�O��ǜ��G��L��o�O����X���}�a��l�%��P�V� �="ײ��s���k�5\�����kUd�      9   ^  x�]QAn�0<;��*�$�-jK�
8rq��X;rl��n��[2�;���=�g�L���;&9gb�y&9�T�ѸD�ξR�G�,Dq.8[��r�Z�<��2a�@��l{4M�-H�)�r��cg��H����3B�$^���()��Iڞs�z��� �����8�4�U
���O�R�8��Pm
7�_� �[��x,򝺎LA��������"@m�Hw!U���5�|�b��a �������:v�tL��L�=�WI�;�@�{��@g[7��XP��65�i�+1�j��'��lSC{qL��/�\��WH̼����OL��!�������?eY��h��      <   �  x����n����\��@"�?ο��6�sf�Ҫ'acNla����O5`����f��U���~��ƪ�@��y	��|�tD+0U�^��{ôlP]ǾS�;��CQ�����k�x)h��(��?���W��**Dy^R�T��#�!��s�'	OuսS�;M�����T�?-T�0�������D��~��w����:�S���Oy���NO@�}�0]���UV�A����q5�׀Y}}����K3/�Ҍ'�Gwg
�~#Z<Q�&,�k��]/MQ��,�xf���!i�i8S�z:������pؑ��H�s�u���w\���:/�wX�q�Eٷ�j�9u[�-�jS�-�`U�����3D����K��`�)� �e��v����U��bj�"?�3�7�X�C�e#U婖@%�y��2QNVXW��G,������ǅ�w�HG� U.g�����k
A:H���sh]��m[��0�K�ǖ�W���3��z�O������(]88�H�:������w�nǟY�U�i��������8b>�`����1�`�����>�w���3��AgP�k�cU��q�35�4Y骎���^�]�b� =��f�x���H� <S���	Ss�L�♞ ���i���P�W��	ԙBX]��/�׺�����nvg�b5eHk�taC���:�q ��6�8�z���oWddsB��Ҧ9�?�!/.�>xA��e*�8��m,���Ҭ=~G<}�!U O�˺@��e�No<��aF!�O��4l�o����'6Yw�_�طoT����R�	�v�T�D��uu:�*Mq�߾Q�!VU��j�S���'˶�����6�'�xL��C����	�t�P��SA�s�aA�#��Kz���Q��}1q9�z��)�m��R`R�`l6Aph�����_�fO�6��b��o�I�H��P�� f0ԘB�������C�%�&�F��T6�ږ*U���b�����J?��9�չ�Yju��P+�z?�@����T2��
����xa�2.�Vn\��+f�T��5�&a�0@�1XM���oP�5�'f���4��3(uZ�=P�u��}h���#�X�����Ē���R����G6� ���s���K���7��IIޝbM4��sج<od�C�b"��	�gY��wpw,N-_���A���A�8K�QjS�I^^^r�������,�UOU�m�@�Rn�`�k�mA�`�*m��*E'z��N�Ҕ
}�Ǻ�YK�
֩s4��<���f0�w9^)�֘�5�j/|<t�t�S�
v>��	������gƪs�T��o˞�'Q���nЗ��39_0��e�S_���ʨꔪc��V�8I�Af1ulc𐼏ޚB��J�@�g�;�IV�?s�e��w��fw���rA�d��xL�����~o0��jݺf��
#�t>���n����al�7>;Z7%��͎$Y��O�[v�os�oX7����{���hTq	j*�1k�~��w .������'�b;�?ASd��f0�)n�sz�^�멁՜lg	�`�����$��J?��Ħ��Sռ�o�}�l�}������=D�ӕ!A�H7�^0�����]��o>$_ζM�.�&�v��G��i�j���r���l�v|O��9�u���|w��Z��jh��Sb;��0�{�"�급�ť��y�lt2[���R�:��*Ɋ��	�����M�s��d�A�e��V3w��)� c.^�#}m�q�?�}���;����j��>��rٱp�w�w`��l�B'��Z���6u�������.݇�W���l�����`8��}�~�i���{��D3ġ��LT�F�Y�O���\4G�m�����g�ZD���ӡ-��Z\rXTu{�'D����˘� ��BJk�Ѧ�OV<����1����&���@�1!���O�Cq9����!H�HhW��Rؚ4�6߮���z	�B{���io�<�ic�e��Ψ�����Sf�q�C�[���@�;��k�*��������d��tzb�&�d�h92��Ղ.�R>�ք��ȵx���Z�����3fQ�̐K��s�~�ƕ&��z�P�߱A��7a��\�w�"х*���.N��6.&�SU����q���h��i����v�n+�ѷ��~A���+`m+��kɨ*<�B�s�9>v��o�Q؆����e(����3t��f�Sn�E"��.��⊆��zFᥛ=V���/UG�60�k��q�Ȍ3���d�}�6��;��q�u��e�_�%B�}���n�қ���׳q V%�R�`�J����ɔn�ڛ&�E���]Nİ�v�|a��� ;�*���]I"ǐ���g���fx�C��M�L6��PL�PD�����p������V��u�G�,���N%C�C'�bw���MI���>�l�1�5P��?�8sTX�8m���^�,��G���\!;l��(͑�ΦxeN����@x�-�`|�fփuX5��p�pEX��8
x�;^GȂ��zfkP��F��x�C��d�����fޥ��x�-!���#�{k�{�ӀCS0����n	^} N/���8]���3�<]x�>j5��Q�'*0�`%�i�/�{]T@�d��5z���܈U�X���y����y3��C��T{ru6 ���n��Z����싂�׋����K�#���ք���+�UsĶ�Ώl�Ώ�K�-�a���8Wn<vy��N!���2u�ie~��]�`���8���D�c�+�W�&��AW�9uwH���h�}�p��uf��K�,�\^uyq��l`�g��p�8�������@��+��sM8��1g��갎��T^��x�%�=��Ze/���r��A�s�EU�a#U���˵�W'K���`�d��+մj~�Z�)����d�/�*Kv��xG�r`]�Mk�ޤ�.���'z���#�0��%-�)},և#eVg����㾞�?��H܏_#!i���u���<b���]p�]�l}�d��F6�g�����7h�>��٫����%��R�7���eqMEd�{D��Z�6��+u�����mw����
�O:�)<����9{�������Ư�8�#����D���t�^�>?����j�Z��UE�%s��'�#���*��V�Ǿ�q�2��	t����%�l�������}      =   �   x���M
�@���Sx�H����n���֖i�	s�[��jE�z�����"�5 ��~�Is��\����5�`AHbq�S�i ������^FE�D6��P�]��M�1^0�@6�<�h~��S�u�X¨|���U��~�>��:��v�1/9���g��|���L��aT^��U�}Ņy9���+R.�T�����+��u��-��}�l�      :   P  x�m�ێ�0���S��ŕ�^6x��hSԫMHl�bZ���� �� !������y��"!�H�NR�d����G��z*�V�6�V�U&G����y�$���Z� ;�|:t�N�'K��_,�ȥ!ShO���a�;l��eU��0q���h�jJ�$ ���*�t%4��$�����q��� .��C�_�y��8��������	���¯����B�C���o���rs�
�v�V��i�;$Q_>������{߭�ޫ܈��'Ĵ����\��fgC
`�F�a+���Fɨ)��V�y��Z��/.���8�K���y����      7     x�MS�r�8<��ݪ(��(M�I���e;I�2&'""p��e�����^�=���QRJP��ѢX�Ec��HiVv������R5�4J���H4�1|O}DP��sx$gk��׌�R�j��=��q ��{<��)���:���>Sy�d���_�gu�a��9|������I��T~.�������ǳ�5���h����{z��L-&�W.R�>����0F�ˉ!*t�s@W۾��B�/�ű�r, �>��"pM#��ap���G��I\S��<�7�6��4+eT�1vO���!z7Vi*sv��P\�l�B�l[�.z�sY�/2e��F�ҿ��oRg߫'a��Z�e�߇#_���>���Liq��`��+-�
J����d�z�i5�d�!����˿an�����ϰ�$�oc@�b�I��UGl�+E�F*�΍c{�S�{O�Q�NP�[w�B.Z��!���K�
7��>�9��d:a���F!i�?��5,��n2�F��C�w8�梁>�}K����~Ֆ\M���a~�0��s�2) ���ɱ� v�f��,�69$�q�o8Dj��Tu{B[�"�1|�d�V<�lޝJ|�"|��tJ�n@�#Y�9G5
�/� �{R̤�#����[�˴#'vC�Ӟ7;���
��=�"�����t��fy��f���}O�h���CpP^���{KI}h8��%<F���kS���P��s{��z��s^\�v=S�1F�R&װ�w[{����,״ы��P��l�e??fY��Y�      4   ?   x�3�t--�/H�2�t�M-�LN,�2�t,�L�2���LI�IUpM,.QH�KQpL)������ �~�      ?      x������ � �     