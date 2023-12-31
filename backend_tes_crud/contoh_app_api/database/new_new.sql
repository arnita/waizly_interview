PGDMP     '                    x         	   sekolahan    10.9    10.9    B           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            C           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            D           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            E           1262    32124 	   sekolahan    DATABASE     g   CREATE DATABASE sekolahan WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE sekolahan;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            F           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13241    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            G           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    32125    absensi    TABLE     �  CREATE TABLE public.absensi (
    absensi_id bigint NOT NULL,
    student_id bigint,
    absensi_type character varying(191),
    absensi_total integer,
    month integer,
    step_study_id bigint,
    absensi_insert_by integer,
    absensi_insert_time timestamp(0) without time zone,
    absensi_update_time timestamp(0) without time zone,
    absensi_update_by integer,
    absensi_delete_time timestamp(0) without time zone,
    absensi_delete_by integer
);
    DROP TABLE public.absensi;
       public         postgres    false    3            �            1259    32128    absensi_absensi_id_seq    SEQUENCE        CREATE SEQUENCE public.absensi_absensi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.absensi_absensi_id_seq;
       public       postgres    false    196    3            H           0    0    absensi_absensi_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.absensi_absensi_id_seq OWNED BY public.absensi.absensi_id;
            public       postgres    false    197            �            1259    32130    class_advisor    TABLE     �  CREATE TABLE public.class_advisor (
    class_advisor_id bigint NOT NULL,
    employee_id bigint,
    unit_year_id bigint,
    study_group_id bigint,
    class_advisor_insert_by integer,
    class_advisor_insert_time timestamp(0) without time zone,
    class_advisor_update_time timestamp(0) without time zone,
    class_advisor_update_by integer,
    class_advisor_delete_time timestamp(0) without time zone,
    class_advisor_delete_by integer
);
 !   DROP TABLE public.class_advisor;
       public         postgres    false    3            �            1259    32133 "   class_advisor_class_advisor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.class_advisor_class_advisor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.class_advisor_class_advisor_id_seq;
       public       postgres    false    3    198            I           0    0 "   class_advisor_class_advisor_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.class_advisor_class_advisor_id_seq OWNED BY public.class_advisor.class_advisor_id;
            public       postgres    false    199            �            1259    32135    course_setting    TABLE     �  CREATE TABLE public.course_setting (
    course_setting_id bigint NOT NULL,
    course_id bigint,
    study_group_id bigint,
    course_setting_status character varying(191),
    course_setting_insert_by integer,
    course_setting_insert_time timestamp(0) without time zone,
    course_setting_update_time timestamp(0) without time zone,
    course_setting_update_by integer,
    course_setting_delete_time timestamp(0) without time zone,
    course_setting_delete_by integer,
    unit_year_id bigint
);
 "   DROP TABLE public.course_setting;
       public         postgres    false    3            �            1259    32138 $   course_setting_course_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_setting_course_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.course_setting_course_setting_id_seq;
       public       postgres    false    3    200            J           0    0 $   course_setting_course_setting_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.course_setting_course_setting_id_seq OWNED BY public.course_setting.course_setting_id;
            public       postgres    false    201            �            1259    32140    daily_exercise    TABLE     D  CREATE TABLE public.daily_exercise (
    daily_exercise_id bigint NOT NULL,
    student_id bigint,
    kd_detail_id bigint,
    structure_tematic_id bigint,
    kd_type character varying,
    score double precision,
    daily_exercise_type integer,
    daily_exercise_insert_by integer,
    daily_exercise_insert_time timestamp(0) without time zone,
    daily_exercise_update_time timestamp(0) without time zone,
    daily_exercise_update_by integer,
    daily_exercise_delete_time timestamp(0) without time zone,
    daily_exercise_delete_by integer,
    step_study_id bigint
);
 "   DROP TABLE public.daily_exercise;
       public         postgres    false    3            �            1259    32146    daily_exercise_skill    TABLE     +  CREATE TABLE public.daily_exercise_skill (
    daily_exercise_skill_id bigint NOT NULL,
    student_id bigint,
    kd_id bigint,
    skill_value integer,
    daily_exercise_skill_insert_by integer,
    daily_exercise_skill_insert_time timestamp(0) without time zone,
    daily_exercise_skill_update_time timestamp(0) without time zone,
    daily_exercise_skill_update_by integer,
    daily_exercise_skill_delete_time timestamp(0) without time zone,
    daily_exercise_skill_delete_by integer,
    step_study_id bigint,
    skill_type character varying
);
 (   DROP TABLE public.daily_exercise_skill;
       public         postgres    false    3            �            1259    32152 $   dialy_exercise_dialy_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dialy_exercise_dialy_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.dialy_exercise_dialy_exercise_id_seq;
       public       postgres    false    3    202            K           0    0 $   dialy_exercise_dialy_exercise_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.dialy_exercise_dialy_exercise_id_seq OWNED BY public.daily_exercise.daily_exercise_id;
            public       postgres    false    204            �            1259    32154 *   dialy_exercise_skill_dialy_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dialy_exercise_skill_dialy_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.dialy_exercise_skill_dialy_exercise_id_seq;
       public       postgres    false    3    203            L           0    0 *   dialy_exercise_skill_dialy_exercise_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.dialy_exercise_skill_dialy_exercise_id_seq OWNED BY public.daily_exercise_skill.daily_exercise_skill_id;
            public       postgres    false    205            �            1259    32156    employee_unit    TABLE     �  CREATE TABLE public.employee_unit (
    employee_unit_id bigint NOT NULL,
    unit_id bigint,
    employee_id bigint,
    employee_unit_insert_by integer,
    employee_unit_insert_time timestamp(0) without time zone,
    employee_unit_update_time timestamp(0) without time zone,
    employee_unit_update_by integer,
    employee_unit_delete_time timestamp(0) without time zone,
    employee_unit_delete_by integer
);
 !   DROP TABLE public.employee_unit;
       public         postgres    false    3            �            1259    32159 "   employee_unit_employee_unit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_unit_employee_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.employee_unit_employee_unit_id_seq;
       public       postgres    false    206    3            M           0    0 "   employee_unit_employee_unit_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.employee_unit_employee_unit_id_seq OWNED BY public.employee_unit.employee_unit_id;
            public       postgres    false    207            �            1259    32161    extracurricular    TABLE       CREATE TABLE public.extracurricular (
    extracurricular_id bigint NOT NULL,
    student_id bigint,
    step_study_id bigint,
    type character varying(191),
    value character varying(191),
    "desc" character varying(191),
    extracurricular_insert_by integer,
    extracurricular_insert_time timestamp(0) without time zone,
    extracurricular_update_time timestamp(0) without time zone,
    extracurricular_update_by integer,
    extracurricular_delete_time timestamp(0) without time zone,
    extracurricular_delete_by integer
);
 #   DROP TABLE public.extracurricular;
       public         postgres    false    3            �            1259    32167 &   extracurricular_extracurricular_id_seq    SEQUENCE     �   CREATE SEQUENCE public.extracurricular_extracurricular_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.extracurricular_extracurricular_id_seq;
       public       postgres    false    208    3            N           0    0 &   extracurricular_extracurricular_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.extracurricular_extracurricular_id_seq OWNED BY public.extracurricular.extracurricular_id;
            public       postgres    false    209            �            1259    32169    friendly_value    TABLE     �  CREATE TABLE public.friendly_value (
    friendly_value_id bigint NOT NULL,
    student_id bigint,
    step_study_id bigint,
    friendly_value_type character varying(191),
    friendly_value_category character varying(191),
    friendly_value_value character varying(255),
    friendly_value_insert_by integer,
    friendly_value_insert_time timestamp(0) without time zone,
    friendly_value_update_time timestamp(0) without time zone,
    friendly_value_update_by integer,
    friendly_value_delete_time timestamp(0) without time zone,
    friendly_value_delete_by integer,
    CONSTRAINT friendly_value_friendly_value_value_check CHECK (((friendly_value_value)::text = ANY (ARRAY[('SB'::character varying)::text, ('PB'::character varying)::text])))
);
 "   DROP TABLE public.friendly_value;
       public         postgres    false    3            �            1259    32176 $   friendly_value_friendly_value_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendly_value_friendly_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.friendly_value_friendly_value_id_seq;
       public       postgres    false    210    3            O           0    0 $   friendly_value_friendly_value_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.friendly_value_friendly_value_id_seq OWNED BY public.friendly_value.friendly_value_id;
            public       postgres    false    211            �            1259    32178    input_analysis    TABLE     _  CREATE TABLE public.input_analysis (
    input_analysis_id bigint NOT NULL,
    kd_id bigint,
    student_id bigint,
    number_question integer,
    value_quality character varying(191),
    total_value character varying(191),
    input_analysis_type character varying(191),
    input_analysis_insert_by integer,
    input_analysis_insert_time timestamp(0) without time zone,
    input_analysis_update_time timestamp(0) without time zone,
    input_analysis_update_by integer,
    input_analysis_delete_time timestamp(0) without time zone,
    input_analysis_delete_by integer,
    step_study_id bigint
);
 "   DROP TABLE public.input_analysis;
       public         postgres    false    3            �            1259    32184 $   input_analysis_input_analysis_id_seq    SEQUENCE     �   CREATE SEQUENCE public.input_analysis_input_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.input_analysis_input_analysis_id_seq;
       public       postgres    false    3    212            P           0    0 $   input_analysis_input_analysis_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.input_analysis_input_analysis_id_seq OWNED BY public.input_analysis.input_analysis_id;
            public       postgres    false    213            �            1259    32186    input_analysis_tema    TABLE     �  CREATE TABLE public.input_analysis_tema (
    input_analysis_tema_id bigint NOT NULL,
    kd_id bigint,
    student_id bigint,
    number_question integer,
    value_quality character varying(191),
    total_value character varying(191),
    input_analysis_tema_type character varying(191),
    input_analysis_tema_insert_by integer,
    input_analysis_tema_insert_time timestamp(0) without time zone,
    input_analysis_tema_update_time timestamp(0) without time zone,
    input_analysis_tema_update_by integer,
    input_analysis_tema_delete_time timestamp(0) without time zone,
    input_analysis_tema_delete_by integer,
    structure_tematic_id bigint
);
 '   DROP TABLE public.input_analysis_tema;
       public         postgres    false    3            �            1259    32192 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq;
       public       postgres    false    214    3            Q           0    0 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq OWNED BY public.input_analysis_tema.input_analysis_tema_id;
            public       postgres    false    215            �            1259    32194    institution    TABLE     �  CREATE TABLE public.institution (
    institution_id integer NOT NULL,
    institution_name character varying(191),
    institution_desc text,
    institution_address character varying(191),
    institution_telp character varying(191),
    institution_email character varying(191),
    institution_start_time timestamp(0) without time zone,
    institution_end_time timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.institution;
       public         postgres    false    3            �            1259    32200    institution_institution_id_seq    SEQUENCE     �   CREATE SEQUENCE public.institution_institution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.institution_institution_id_seq;
       public       postgres    false    216    3            R           0    0    institution_institution_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.institution_institution_id_seq OWNED BY public.institution.institution_id;
            public       postgres    false    217            �            1259    32202    list_question_per_kd    TABLE       CREATE TABLE public.list_question_per_kd (
    list_question_per_kd_id bigint NOT NULL,
    quiz_per_kd_id bigint,
    number_question integer,
    quality_question character varying(191),
    list_question_per_kd_insert_by integer,
    list_question_per_kd_insert_time timestamp(0) without time zone,
    list_question_per_kd_update_time timestamp(0) without time zone,
    list_question_per_kd_update_by integer,
    list_question_per_kd_delete_time timestamp(0) without time zone,
    list_question_per_kd_delete_by integer
);
 (   DROP TABLE public.list_question_per_kd;
       public         postgres    false    3            �            1259    32205 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq;
       public       postgres    false    3    218            S           0    0 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq OWNED BY public.list_question_per_kd.list_question_per_kd_id;
            public       postgres    false    219            �            1259    32207    list_question_per_tema    TABLE     /  CREATE TABLE public.list_question_per_tema (
    list_question_per_tema_id bigint NOT NULL,
    number_question integer,
    quality_question character varying(191),
    list_question_per_tema_insert_by integer,
    list_question_per_tema_insert_time timestamp(0) without time zone,
    list_question_per_tema_update_time timestamp(0) without time zone,
    list_question_per_tema_update_by integer,
    list_question_per_tema_delete_time timestamp(0) without time zone,
    list_question_per_tema_delete_by integer,
    structure_tematic_detail_id bigint
);
 *   DROP TABLE public.list_question_per_tema;
       public         postgres    false    3            �            1259    32210 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq;
       public       postgres    false    220    3            T           0    0 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq OWNED BY public.list_question_per_tema.list_question_per_tema_id;
            public       postgres    false    221            �            1259    32212 
   m_building    TABLE     �  CREATE TABLE public.m_building (
    building_id bigint NOT NULL,
    building_name character varying(191),
    building_desc character varying(191),
    building_status character varying(191),
    building_insert_by integer,
    building_insert_time timestamp(0) without time zone,
    building_update_time timestamp(0) without time zone,
    building_update_by integer,
    building_delete_time timestamp(0) without time zone,
    building_delete_by integer
);
    DROP TABLE public.m_building;
       public         postgres    false    3            �            1259    32218    m_building_building_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_building_building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_building_building_id_seq;
       public       postgres    false    3    222            U           0    0    m_building_building_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_building_building_id_seq OWNED BY public.m_building.building_id;
            public       postgres    false    223            �            1259    32220    m_class_grade    TABLE       CREATE TABLE public.m_class_grade (
    class_grade_id bigint NOT NULL,
    unit_id bigint,
    class_grade_order integer,
    class_grade_status character varying(191),
    class_grade_name character varying(191),
    class_grade_desc text,
    class_grade_insert_by integer,
    class_grade_insert_time timestamp(0) without time zone,
    class_grade_update_time timestamp(0) without time zone,
    class_grade_update_by integer,
    class_grade_delete_time timestamp(0) without time zone,
    class_grade_delete_by integer
);
 !   DROP TABLE public.m_class_grade;
       public         postgres    false    3            �            1259    32226     m_class_grade_class_grade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_class_grade_class_grade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_class_grade_class_grade_id_seq;
       public       postgres    false    3    224            V           0    0     m_class_grade_class_grade_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_class_grade_class_grade_id_seq OWNED BY public.m_class_grade.class_grade_id;
            public       postgres    false    225            �            1259    32228    m_class_room    TABLE       CREATE TABLE public.m_class_room (
    class_room_id bigint NOT NULL,
    unit_id bigint,
    class_room_name character varying(191),
    class_room_text text,
    class_room_status character varying(191),
    class_room_desc text,
    class_room_insert_by integer,
    class_room_insert_time timestamp(0) without time zone,
    class_room_update_time timestamp(0) without time zone,
    class_room_update_by integer,
    class_room_delete_time timestamp(0) without time zone,
    class_room_delete_by integer,
    floor_id bigint
);
     DROP TABLE public.m_class_room;
       public         postgres    false    3            �            1259    32234    m_class_room_class_room_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_class_room_class_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_class_room_class_room_id_seq;
       public       postgres    false    3    226            W           0    0    m_class_room_class_room_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_class_room_class_room_id_seq OWNED BY public.m_class_room.class_room_id;
            public       postgres    false    227            �            1259    32236    m_course    TABLE     )  CREATE TABLE public.m_course (
    course_id bigint NOT NULL,
    course_status character varying(191),
    course_name character varying(191),
    course_code character varying(191),
    course_desc character varying(191),
    course_insert_by integer,
    course_insert_time timestamp(0) without time zone,
    course_update_time timestamp(0) without time zone,
    course_update_by integer,
    course_delete_time timestamp(0) without time zone,
    course_delete_by integer,
    kkm_value double precision,
    course_type character varying(191)
);
    DROP TABLE public.m_course;
       public         postgres    false    3            �            1259    32242    m_course_course_id_seq    SEQUENCE        CREATE SEQUENCE public.m_course_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.m_course_course_id_seq;
       public       postgres    false    228    3            X           0    0    m_course_course_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.m_course_course_id_seq OWNED BY public.m_course.course_id;
            public       postgres    false    229            �            1259    32244    m_department    TABLE     �  CREATE TABLE public.m_department (
    department_id bigint NOT NULL,
    department_name character varying(191),
    department_desc character varying(191),
    department_status character varying(191),
    department_insert_by integer,
    department_insert_time timestamp(0) without time zone,
    department_update_time timestamp(0) without time zone,
    department_update_by integer,
    department_delete_time timestamp(0) without time zone,
    department_delete_by integer
);
     DROP TABLE public.m_department;
       public         postgres    false    3            �            1259    32250    m_department_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_department_department_id_seq;
       public       postgres    false    230    3            Y           0    0    m_department_department_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_department_department_id_seq OWNED BY public.m_department.department_id;
            public       postgres    false    231            �            1259    32252    m_education_level    TABLE     9  CREATE TABLE public.m_education_level (
    education_level_id bigint NOT NULL,
    education_level_name character varying(191) NOT NULL,
    education_level_status character varying(191) NOT NULL,
    education_level_resume character varying(191) NOT NULL,
    education_level_insert_by integer,
    education_level_insert_time timestamp(0) without time zone,
    education_level_update_time timestamp(0) without time zone,
    education_level_update_by integer,
    education_level_delete_time timestamp(0) without time zone,
    education_level_delete_by integer
);
 %   DROP TABLE public.m_education_level;
       public         postgres    false    3            �            1259    32258 (   m_education_level_education_level_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_education_level_education_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.m_education_level_education_level_id_seq;
       public       postgres    false    3    232            Z           0    0 (   m_education_level_education_level_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.m_education_level_education_level_id_seq OWNED BY public.m_education_level.education_level_id;
            public       postgres    false    233            �            1259    32260 
   m_employee    TABLE     �  CREATE TABLE public.m_employee (
    employee_id bigint NOT NULL,
    employee_status character varying(191),
    employee_id_card character varying(191),
    position_id bigint,
    user_id bigint,
    employee_type character varying(191),
    employee_name character varying(191),
    employee_working_status character varying(191),
    employee_nik character varying(191),
    employee_gender character varying(191),
    employee_birth_place character varying(191),
    employee_birth_date date,
    employee_religion character varying(191),
    employee_identity character varying(191),
    employee_last_education character varying(191),
    employee_marital_status character varying(191),
    employee_hp character varying(191),
    employee_website character varying(191),
    employee_telp character varying(191),
    employee_address character varying(191),
    employee_photo character varying(191),
    employee_desc character varying(191),
    employee_email character varying(191),
    employee_insert_by integer,
    employee_insert_time timestamp(0) without time zone,
    employee_update_time timestamp(0) without time zone,
    employee_update_by integer,
    employee_delete_time timestamp(0) without time zone,
    employee_delete_by integer
);
    DROP TABLE public.m_employee;
       public         postgres    false    3            �            1259    32266    m_employee_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_employee_employee_id_seq;
       public       postgres    false    3    234            [           0    0    m_employee_employee_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_employee_employee_id_seq OWNED BY public.m_employee.employee_id;
            public       postgres    false    235            �            1259    32268    m_floor    TABLE     �  CREATE TABLE public.m_floor (
    floor_id bigint NOT NULL,
    building_id bigint,
    floor_name character varying(191),
    floor_desc character varying(191),
    floor_insert_by integer,
    floor_insert_time timestamp(0) without time zone,
    floor_update_time timestamp(0) without time zone,
    floor_update_by integer,
    floor_delete_time timestamp(0) without time zone,
    floor_delete_by integer
);
    DROP TABLE public.m_floor;
       public         postgres    false    3            �            1259    32271    m_floor_floor_id_seq    SEQUENCE     }   CREATE SEQUENCE public.m_floor_floor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.m_floor_floor_id_seq;
       public       postgres    false    236    3            \           0    0    m_floor_floor_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.m_floor_floor_id_seq OWNED BY public.m_floor.floor_id;
            public       postgres    false    237            �            1259    32273    m_kd    TABLE     �  CREATE TABLE public.m_kd (
    kd_id bigint NOT NULL,
    unit_year_id bigint,
    course_id bigint,
    kd_code character varying(191),
    kd_name character varying(191),
    kd_desc character varying(191),
    kd_insert_by integer,
    kd_insert_time timestamp(0) without time zone,
    kd_update_time timestamp(0) without time zone,
    kd_update_by integer,
    kd_delete_time timestamp(0) without time zone,
    kd_delete_by integer,
    kd_type character varying,
    unit_id bigint
);
    DROP TABLE public.m_kd;
       public         postgres    false    3            �            1259    32279    m_kd_detail    TABLE     �  CREATE TABLE public.m_kd_detail (
    kd_detail_id bigint NOT NULL,
    kd_id bigint,
    step_study_id bigint,
    kd_detail_insert_by integer,
    kd_detail_insert_time timestamp(0) without time zone,
    kd_detail_update_time timestamp(0) without time zone,
    kd_detail_update_by integer,
    kd_detail_delete_time timestamp(0) without time zone,
    kd_detail_delete_by integer
);
    DROP TABLE public.m_kd_detail;
       public         postgres    false    3            �            1259    32282    m_kd_detail_kd_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_kd_detail_kd_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.m_kd_detail_kd_detail_id_seq;
       public       postgres    false    3    239            ]           0    0    m_kd_detail_kd_detail_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.m_kd_detail_kd_detail_id_seq OWNED BY public.m_kd_detail.kd_detail_id;
            public       postgres    false    240            �            1259    32284    m_kd_kd_id_seq    SEQUENCE     w   CREATE SEQUENCE public.m_kd_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.m_kd_kd_id_seq;
       public       postgres    false    238    3            ^           0    0    m_kd_kd_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.m_kd_kd_id_seq OWNED BY public.m_kd.kd_id;
            public       postgres    false    241            �            1259    32286    m_kkm    TABLE     �  CREATE TABLE public.m_kkm (
    kkm_id bigint NOT NULL,
    kkm_value integer,
    kkm_a integer,
    kkm_b integer,
    kkm_c integer,
    kkm_d integer,
    kkm_insert_by integer,
    kkm_insert_time timestamp(0) without time zone,
    kkm_update_time timestamp(0) without time zone,
    kkm_update_by integer,
    kkm_delete_time timestamp(0) without time zone,
    kkm_delete_by integer,
    step_study_id bigint,
    course_id bigint,
    class_grade_id bigint
);
    DROP TABLE public.m_kkm;
       public         postgres    false    3            �            1259    32289    m_kkm_kkm_id_seq    SEQUENCE     y   CREATE SEQUENCE public.m_kkm_kkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.m_kkm_kkm_id_seq;
       public       postgres    false    3    242            _           0    0    m_kkm_kkm_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.m_kkm_kkm_id_seq OWNED BY public.m_kkm.kkm_id;
            public       postgres    false    243            �            1259    32291    m_lesson_hour    TABLE     z  CREATE TABLE public.m_lesson_hour (
    lesson_hour_id bigint NOT NULL,
    lesson_day character varying(191),
    hour_to integer,
    lesson_hour_type character varying(191),
    lesson_hour_start time(0) without time zone,
    lesson_hour_end time(0) without time zone,
    lesson_hour_desc text,
    lesson_hour_status character varying(191),
    lesson_hour_insert_by integer,
    lesson_hour_insert_time timestamp(0) without time zone,
    lesson_hour_update_time timestamp(0) without time zone,
    lesson_hour_update_by integer,
    lesson_hour_delete_time timestamp(0) without time zone,
    lesson_hour_delete_by integer
);
 !   DROP TABLE public.m_lesson_hour;
       public         postgres    false    3            �            1259    32297     m_lesson_hour_lesson_hour_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_lesson_hour_lesson_hour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_lesson_hour_lesson_hour_id_seq;
       public       postgres    false    3    244            `           0    0     m_lesson_hour_lesson_hour_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_lesson_hour_lesson_hour_id_seq OWNED BY public.m_lesson_hour.lesson_hour_id;
            public       postgres    false    245            �            1259    32299    m_parent    TABLE     �  CREATE TABLE public.m_parent (
    parent_id bigint NOT NULL,
    student_id bigint,
    user_id bigint,
    parent_name character varying(191),
    parent_id_card character varying(191),
    parent_status character varying(191),
    parent_nickname character varying(191),
    parent_gender character varying(191),
    parent_birth_place character varying(191),
    parent_birth_date date,
    parent_address text,
    parent_hp character varying(191),
    parent_telp character varying(191),
    parent_email character varying(191),
    parent_photo character varying(191),
    parent_hobby character varying(191),
    parent_religion character varying(191),
    parent_insert_by integer,
    parent_insert_time timestamp(0) without time zone,
    parent_update_time timestamp(0) without time zone,
    parent_update_by integer,
    parent_delete_time timestamp(0) without time zone,
    parent_delete_by integer
);
    DROP TABLE public.m_parent;
       public         postgres    false    3            �            1259    32305    m_parent_parent_id_seq    SEQUENCE        CREATE SEQUENCE public.m_parent_parent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.m_parent_parent_id_seq;
       public       postgres    false    3    246            a           0    0    m_parent_parent_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.m_parent_parent_id_seq OWNED BY public.m_parent.parent_id;
            public       postgres    false    247            �            1259    32307 
   m_position    TABLE     �  CREATE TABLE public.m_position (
    position_id bigint NOT NULL,
    department_id bigint,
    position_name character varying(191),
    position_desc character varying(191),
    position_status character varying(191),
    position_insert_by integer,
    position_insert_time timestamp(0) without time zone,
    position_update_time timestamp(0) without time zone,
    position_update_by integer,
    position_delete_time timestamp(0) without time zone,
    position_delete_by integer
);
    DROP TABLE public.m_position;
       public         postgres    false    3            �            1259    32313    m_position_position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_position_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_position_position_id_seq;
       public       postgres    false    3    248            b           0    0    m_position_position_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_position_position_id_seq OWNED BY public.m_position.position_id;
            public       postgres    false    249            �            1259    32315    m_step_study    TABLE        CREATE TABLE public.m_step_study (
    step_study_id bigint NOT NULL,
    unit_year_id bigint,
    step_study_name character varying(191),
    step_study_desc text,
    step_study_start date,
    step_study_end date,
    step_study_status character varying(191),
    step_study_insert_by integer,
    step_study_insert_time timestamp(0) without time zone,
    step_study_update_time timestamp(0) without time zone,
    step_study_update_by integer,
    step_study_delete_time timestamp(0) without time zone,
    step_study_delete_by integer
);
     DROP TABLE public.m_step_study;
       public         postgres    false    3            �            1259    32321    m_step_study_step_study_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_step_study_step_study_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_step_study_step_study_id_seq;
       public       postgres    false    3    250            c           0    0    m_step_study_step_study_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_step_study_step_study_id_seq OWNED BY public.m_step_study.step_study_id;
            public       postgres    false    251            �            1259    32323 	   m_student    TABLE     �  CREATE TABLE public.m_student (
    student_id bigint NOT NULL,
    unit_id bigint,
    class_grade_id bigint,
    user_id bigint,
    student_name character varying(191),
    student_id_card character varying(191),
    student_status character varying(191),
    student_nickname character varying(191),
    student_gender character varying(191),
    student_birth_place character varying(191),
    student_birth_date date,
    student_address text,
    student_hp character varying(191),
    student_telp character varying(191),
    student_email character varying(191),
    student_father_hp character varying(191),
    student_mother_hp character varying(191),
    student_child_to integer,
    student_brother integer,
    student_child_status character varying(191),
    student_photo character varying(191),
    student_hobby character varying(191),
    student_orphan_status character varying(191),
    student_school_origin character varying(191),
    student_school_origin_address character varying(191),
    student_nisn character varying(191),
    student_test_number character varying(191),
    student_achievement character varying(191),
    student_blood_type character varying(191),
    student_religion character varying(191),
    student_kk character varying(191),
    student_ktp character varying(191),
    student_ijazah character varying(191),
    student_mother_name character varying(191),
    student_father_name character varying(191),
    student_mother_job character varying(191),
    student_father_job character varying(191),
    student_father_income character varying(191),
    student_mother_income character varying(191),
    student_insert_by integer,
    student_insert_time timestamp(0) without time zone,
    student_update_time timestamp(0) without time zone,
    student_update_by integer,
    student_delete_time timestamp(0) without time zone,
    student_delete_by integer,
    student_tall integer,
    student_weight character varying(191)
);
    DROP TABLE public.m_student;
       public         postgres    false    3            �            1259    32329    m_student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.m_student_student_id_seq;
       public       postgres    false    252    3            d           0    0    m_student_student_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.m_student_student_id_seq OWNED BY public.m_student.student_id;
            public       postgres    false    253            �            1259    32331    m_study_group    TABLE     '  CREATE TABLE public.m_study_group (
    study_group_id bigint NOT NULL,
    unit_id bigint,
    class_grade_id bigint,
    class_room_id bigint,
    study_group_status character varying(191),
    study_group_name character varying(191),
    study_group_desc text,
    study_group_insert_by integer,
    study_group_insert_time timestamp(0) without time zone,
    study_group_update_time timestamp(0) without time zone,
    study_group_update_by integer,
    study_group_delete_time timestamp(0) without time zone,
    study_group_delete_by integer
);
 !   DROP TABLE public.m_study_group;
       public         postgres    false    3            �            1259    32337     m_study_group_study_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_study_group_study_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_study_group_study_group_id_seq;
       public       postgres    false    3    254            e           0    0     m_study_group_study_group_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_study_group_study_group_id_seq OWNED BY public.m_study_group.study_group_id;
            public       postgres    false    255                        1259    32339    m_unit    TABLE     �  CREATE TABLE public.m_unit (
    unit_id bigint NOT NULL,
    education_level_id bigint,
    unit_name character varying(191),
    unit_desc character varying(191),
    unit_logo character varying(191),
    unit_prefix character varying(191),
    unit_address text,
    unit_telp character varying(191),
    unit_email character varying(191),
    unit_website character varying(191),
    unit_status character varying(191),
    unit_insert_by integer,
    unit_insert_time timestamp(0) without time zone,
    unit_update_time timestamp(0) without time zone,
    unit_update_by integer,
    unit_delete_time timestamp(0) without time zone,
    unit_delete_by integer,
    foundation_id bigint
);
    DROP TABLE public.m_unit;
       public         postgres    false    3                       1259    32345    m_unit_unit_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_unit_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_unit_unit_id_seq;
       public       postgres    false    3    256            f           0    0    m_unit_unit_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.m_unit_unit_id_seq OWNED BY public.m_unit.unit_id;
            public       postgres    false    257                       1259    32347    m_unit_year    TABLE     ;  CREATE TABLE public.m_unit_year (
    unit_year_id bigint NOT NULL,
    unit_id bigint,
    unit_year_status character varying(191),
    unit_year_name character varying(191),
    unit_year_prefix character varying(191),
    unit_year_start date,
    unit_year_end date,
    unit_year_desc text,
    unit_year_insert_by integer,
    unit_year_insert_time timestamp(0) without time zone,
    unit_year_update_time timestamp(0) without time zone,
    unit_year_update_by integer,
    unit_year_delete_time timestamp(0) without time zone,
    unit_year_delete_by integer
);
    DROP TABLE public.m_unit_year;
       public         postgres    false    3                       1259    32353    m_unit_year_unit_year_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_unit_year_unit_year_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.m_unit_year_unit_year_id_seq;
       public       postgres    false    3    258            g           0    0    m_unit_year_unit_year_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.m_unit_year_unit_year_id_seq OWNED BY public.m_unit_year.unit_year_id;
            public       postgres    false    259                       1259    32355    menu    TABLE     g  CREATE TABLE public.menu (
    menu_id bigint NOT NULL,
    menu_name character varying(191),
    menu_desc character varying(191),
    menu_url character varying(191),
    menu_parent character varying(191),
    type character varying(191),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    no_urut integer
);
    DROP TABLE public.menu;
       public         postgres    false    3                       1259    32361    menu_menu_id_seq    SEQUENCE     y   CREATE SEQUENCE public.menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.menu_menu_id_seq;
       public       postgres    false    3    260            h           0    0    menu_menu_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu.menu_id;
            public       postgres    false    261                       1259    32363 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         postgres    false    3                       1259    32366    migrations_id_seq    SEQUENCE     z   CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public       postgres    false    3    262            i           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
            public       postgres    false    263                       1259    32368    model_has_permissions    TABLE     �   CREATE TABLE public.model_has_permissions (
    permission_id integer NOT NULL,
    model_type character varying(191) NOT NULL,
    model_id bigint NOT NULL
);
 )   DROP TABLE public.model_has_permissions;
       public         postgres    false    3            	           1259    32371    model_has_roles    TABLE     �   CREATE TABLE public.model_has_roles (
    role_id integer NOT NULL,
    model_type character varying(191) NOT NULL,
    model_id bigint NOT NULL
);
 #   DROP TABLE public.model_has_roles;
       public         postgres    false    3            
           1259    32374 	   observasi    TABLE       CREATE TABLE public.observasi (
    observasi_id bigint NOT NULL,
    student_id bigint,
    step_study_id bigint,
    observasi_type character varying(191),
    observasi_category character varying(191),
    observasi_insert_by integer,
    observasi_insert_time timestamp(0) without time zone,
    observasi_update_time timestamp(0) without time zone,
    observasi_update_by integer,
    observasi_delete_time timestamp(0) without time zone,
    observasi_delete_by integer,
    observasi_value character varying(191)
);
    DROP TABLE public.observasi;
       public         postgres    false    3                       1259    32380    observasi_observasi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.observasi_observasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.observasi_observasi_id_seq;
       public       postgres    false    3    266            j           0    0    observasi_observasi_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.observasi_observasi_id_seq OWNED BY public.observasi.observasi_id;
            public       postgres    false    267                       1259    32382 	   parlookup    TABLE     A  CREATE TABLE public.parlookup (
    parlookup_id bigint NOT NULL,
    name character varying(191),
    value character varying(191),
    category character varying(191),
    "desc" character varying(191),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    unit_id bigint
);
    DROP TABLE public.parlookup;
       public         postgres    false    3                       1259    32388    parlookup_parlookup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.parlookup_parlookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.parlookup_parlookup_id_seq;
       public       postgres    false    3    268            k           0    0    parlookup_parlookup_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.parlookup_parlookup_id_seq OWNED BY public.parlookup.parlookup_id;
            public       postgres    false    269                       1259    32390    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         postgres    false    3                       1259    32393    pd    TABLE     L  CREATE TABLE public.pd (
    pd_id bigint NOT NULL,
    student_id bigint,
    step_study_id bigint,
    pd_type character varying(191),
    pd_category character varying(191),
    pd_value character varying(255),
    pd_insert_by integer,
    pd_insert_time timestamp(0) without time zone,
    pd_update_time timestamp(0) without time zone,
    pd_update_by integer,
    pd_delete_time timestamp(0) without time zone,
    pd_delete_by integer,
    CONSTRAINT pd_pd_value_check CHECK (((pd_value)::text = ANY (ARRAY[('SB'::character varying)::text, ('PB'::character varying)::text])))
);
    DROP TABLE public.pd;
       public         postgres    false    3                       1259    32400    pd_pd_id_seq    SEQUENCE     u   CREATE SEQUENCE public.pd_pd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pd_pd_id_seq;
       public       postgres    false    3    271            l           0    0    pd_pd_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pd_pd_id_seq OWNED BY public.pd.pd_id;
            public       postgres    false    272                       1259    32402    permissions    TABLE     
  CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying(191) NOT NULL,
    guard_name character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    menu_id integer
);
    DROP TABLE public.permissions;
       public         postgres    false    3                       1259    32405    permissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public       postgres    false    3    273            m           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
            public       postgres    false    274                       1259    32407    personality    TABLE     �  CREATE TABLE public.personality (
    personality_id bigint NOT NULL,
    student_id bigint,
    personality_type character varying(191),
    personality_value character varying(191),
    personality_insert_by integer,
    personality_insert_time timestamp(0) without time zone,
    personality_update_time timestamp(0) without time zone,
    personality_update_by integer,
    personality_delete_time timestamp(0) without time zone,
    personality_delete_by integer,
    step_study_id bigint
);
    DROP TABLE public.personality;
       public         postgres    false    3                       1259    32410    personality_personality_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personality_personality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.personality_personality_id_seq;
       public       postgres    false    3    275            n           0    0    personality_personality_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.personality_personality_id_seq OWNED BY public.personality.personality_id;
            public       postgres    false    276                       1259    32412    physical_student    TABLE     A  CREATE TABLE public.physical_student (
    physical_student_id bigint NOT NULL,
    student_id bigint,
    physical_type character varying(191),
    physical_category character varying(191),
    physical_value character varying(191),
    step_study_id bigint,
    physical_student_insert_by integer,
    physical_student_insert_time timestamp(0) without time zone,
    physical_student_update_time timestamp(0) without time zone,
    physical_student_update_by integer,
    physical_student_delete_time timestamp(0) without time zone,
    physical_student_delete_by integer
);
 $   DROP TABLE public.physical_student;
       public         postgres    false    3                       1259    32418 (   physical_student_physical_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.physical_student_physical_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.physical_student_physical_student_id_seq;
       public       postgres    false    3    277            o           0    0 (   physical_student_physical_student_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.physical_student_physical_student_id_seq OWNED BY public.physical_student.physical_student_id;
            public       postgres    false    278                       1259    32420 
   prestation    TABLE     �  CREATE TABLE public.prestation (
    prestation_id bigint NOT NULL,
    student_id bigint,
    step_study_id bigint,
    type character varying(191),
    value character varying(191),
    "desc" character varying(191),
    prestation_insert_by integer,
    prestation_insert_time timestamp(0) without time zone,
    prestation_update_time timestamp(0) without time zone,
    prestation_update_by integer,
    prestation_delete_time timestamp(0) without time zone,
    prestation_delete_by integer
);
    DROP TABLE public.prestation;
       public         postgres    false    3                       1259    32426    prestation_prestation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prestation_prestation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.prestation_prestation_id_seq;
       public       postgres    false    3    279            p           0    0    prestation_prestation_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.prestation_prestation_id_seq OWNED BY public.prestation.prestation_id;
            public       postgres    false    280                       1259    32428    quiz_per_kd    TABLE     �  CREATE TABLE public.quiz_per_kd (
    quiz_per_kd_id bigint NOT NULL,
    kd_id bigint,
    total_question integer,
    type_question character varying(191),
    description text,
    quiz_per_kd_insert_by integer,
    quiz_per_kd_insert_time timestamp(0) without time zone,
    quiz_per_kd_update_time timestamp(0) without time zone,
    quiz_per_kd_update_by integer,
    quiz_per_kd_delete_time timestamp(0) without time zone,
    quiz_per_kd_delete_by integer,
    step_study_id bigint
);
    DROP TABLE public.quiz_per_kd;
       public         postgres    false    3                       1259    32434    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq;
       public       postgres    false    3    281            q           0    0    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq OWNED BY public.quiz_per_kd.quiz_per_kd_id;
            public       postgres    false    282                       1259    32436    raport    TABLE     i  CREATE TABLE public.raport (
    raport_id bigint NOT NULL,
    course_id bigint,
    student_id bigint,
    step_study_id bigint,
    total_pengetahuan integer,
    total_keterampilan integer,
    predikat_pengetahuan character varying(191),
    predikat_keterampilan character varying(191),
    keterangan_pengetahuan text,
    keterangan_keterampilan text,
    raport_insert_by integer,
    raport_insert_time timestamp(0) without time zone,
    raport_update_time timestamp(0) without time zone,
    raport_update_by integer,
    raport_delete_time timestamp(0) without time zone,
    raport_delete_by integer
);
    DROP TABLE public.raport;
       public         postgres    false    3                       1259    32442 
   raport_pts    TABLE     �  CREATE TABLE public.raport_pts (
    raport_pts_id bigint NOT NULL,
    course_id bigint,
    student_id bigint,
    step_study_id bigint,
    total_pengetahuan integer,
    total_keterampilan integer,
    predikat_pengetahuan character varying(191),
    predikat_keterampilan character varying(191),
    keterangan_pengetahuan text,
    keterangan_keterampilan text,
    raport_pts_insert_by integer,
    raport_pts_insert_time timestamp(0) without time zone,
    raport_pts_update_time timestamp(0) without time zone,
    raport_pts_update_by integer,
    raport_pts_delete_time timestamp(0) without time zone,
    raport_pts_delete_by integer
);
    DROP TABLE public.raport_pts;
       public         postgres    false    3                       1259    32448    raport_pts_raport_pts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.raport_pts_raport_pts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.raport_pts_raport_pts_id_seq;
       public       postgres    false    3    284            r           0    0    raport_pts_raport_pts_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.raport_pts_raport_pts_id_seq OWNED BY public.raport_pts.raport_pts_id;
            public       postgres    false    285                       1259    32450    raport_raport_id_seq    SEQUENCE     }   CREATE SEQUENCE public.raport_raport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.raport_raport_id_seq;
       public       postgres    false    283    3            s           0    0    raport_raport_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.raport_raport_id_seq OWNED BY public.raport.raport_id;
            public       postgres    false    286                       1259    32452    role_has_permissions    TABLE     o   CREATE TABLE public.role_has_permissions (
    permission_id integer NOT NULL,
    role_id integer NOT NULL
);
 (   DROP TABLE public.role_has_permissions;
       public         postgres    false    3                        1259    32455    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(191) NOT NULL,
    guard_name character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.roles;
       public         postgres    false    3            !           1259    32458    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false    288    3            t           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       postgres    false    289            "           1259    32460    setting_daily_exercise    TABLE       CREATE TABLE public.setting_daily_exercise (
    setting_daily_exercise_id integer NOT NULL,
    kd_id bigint,
    skill_type character varying(191),
    step_study_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.setting_daily_exercise;
       public         postgres    false    3            #           1259    32463 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq;
       public       postgres    false    3    290            u           0    0 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq OWNED BY public.setting_daily_exercise.setting_daily_exercise_id;
            public       postgres    false    291            $           1259    32465    structure_tematic    TABLE     O  CREATE TABLE public.structure_tematic (
    structure_tematic_id bigint NOT NULL,
    structure_tematic_name character varying(191) NOT NULL,
    study_group_id bigint,
    step_study_id bigint,
    structure_tematic_desc text,
    structure_tematic_question integer,
    structure_tematic_insert_by integer,
    structure_tematic_insert_time timestamp(0) without time zone,
    structure_tematic_update_time timestamp(0) without time zone,
    structure_tematic_update_by integer,
    structure_tematic_delete_time timestamp(0) without time zone,
    structure_tematic_delete_by integer
);
 %   DROP TABLE public.structure_tematic;
       public         postgres    false    3            %           1259    32471    structure_tematic_detail    TABLE     �  CREATE TABLE public.structure_tematic_detail (
    structure_tematic_detail_id bigint NOT NULL,
    structure_tematic_id bigint,
    total_question integer,
    structure_tematic_detail_insert_by integer,
    structure_tematic_detail_insert_time timestamp(0) without time zone,
    structure_tematic_detail_update_time timestamp(0) without time zone,
    structure_tematic_detail_update_by integer,
    structure_tematic_detail_delete_time timestamp(0) without time zone,
    structure_tematic_detail_delete_by integer,
    kd_id bigint,
    question_uts integer,
    question_uas integer,
    question_daily integer,
    type_question character varying(191)
);
 ,   DROP TABLE public.structure_tematic_detail;
       public         postgres    false    3            &           1259    32474 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq;
       public       postgres    false    3    293            v           0    0 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq OWNED BY public.structure_tematic_detail.structure_tematic_detail_id;
            public       postgres    false    294            '           1259    32476 *   structure_tematic_structure_tematic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.structure_tematic_structure_tematic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.structure_tematic_structure_tematic_id_seq;
       public       postgres    false    292    3            w           0    0 *   structure_tematic_structure_tematic_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.structure_tematic_structure_tematic_id_seq OWNED BY public.structure_tematic.structure_tematic_id;
            public       postgres    false    295            (           1259    32478    study_group_setting    TABLE     '  CREATE TABLE public.study_group_setting (
    study_group_setting_id bigint NOT NULL,
    student_id bigint,
    study_group_id bigint,
    study_group_setting_status character varying(191),
    study_group_setting_insert_by integer,
    study_group_setting_insert_time timestamp(0) without time zone,
    study_group_setting_update_time timestamp(0) without time zone,
    study_group_setting_update_by integer,
    study_group_setting_delete_time timestamp(0) without time zone,
    study_group_setting_delete_by integer,
    unit_year_id bigint
);
 '   DROP TABLE public.study_group_setting;
       public         postgres    false    3            )           1259    32481 .   study_group_setting_study_group_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.study_group_setting_study_group_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.study_group_setting_study_group_setting_id_seq;
       public       postgres    false    3    296            x           0    0 .   study_group_setting_study_group_setting_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.study_group_setting_study_group_setting_id_seq OWNED BY public.study_group_setting.study_group_setting_id;
            public       postgres    false    297            *           1259    32483 
   summary_kd    TABLE     �  CREATE TABLE public.summary_kd (
    summary_kd_id bigint NOT NULL,
    kd_id bigint,
    student_id bigint,
    step_study_id bigint,
    type character varying(191) NOT NULL,
    total integer NOT NULL,
    summary_kd_insert_by integer,
    summary_kd_insert_time timestamp(0) without time zone,
    summary_kd_update_time timestamp(0) without time zone,
    summary_kd_update_by integer,
    summary_kd_delete_time timestamp(0) without time zone,
    summary_kd_delete_by integer
);
    DROP TABLE public.summary_kd;
       public         postgres    false    3            +           1259    32486    summary_kd_summary_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_kd_summary_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.summary_kd_summary_kd_id_seq;
       public       postgres    false    3    298            y           0    0    summary_kd_summary_kd_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.summary_kd_summary_kd_id_seq OWNED BY public.summary_kd.summary_kd_id;
            public       postgres    false    299            ,           1259    32488    summary_skill    TABLE     �  CREATE TABLE public.summary_skill (
    summary_skill_id bigint NOT NULL,
    kd_id bigint,
    student_id bigint,
    step_study_id bigint,
    total_skill integer,
    summary_skill_insert_by integer,
    summary_skill_insert_time timestamp(0) without time zone,
    summary_skill_update_time timestamp(0) without time zone,
    summary_skill_update_by integer,
    summary_skill_delete_time timestamp(0) without time zone,
    summary_skill_delete_by integer
);
 !   DROP TABLE public.summary_skill;
       public         postgres    false    3            -           1259    32491 "   summary_skill_summary_skill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_skill_summary_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.summary_skill_summary_skill_id_seq;
       public       postgres    false    3    300            z           0    0 "   summary_skill_summary_skill_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.summary_skill_summary_skill_id_seq OWNED BY public.summary_skill.summary_skill_id;
            public       postgres    false    301            .           1259    32493    summary_tematic    TABLE     /  CREATE TABLE public.summary_tematic (
    summary_tematic_id bigint NOT NULL,
    kd_id bigint,
    student_id bigint,
    structure_tematic_id bigint,
    type character varying(191) NOT NULL,
    total integer NOT NULL,
    summary_tematic_insert_by integer,
    summary_tematic_insert_time timestamp(0) without time zone,
    summary_tematic_update_time timestamp(0) without time zone,
    summary_tematic_update_by integer,
    summary_tematic_delete_time timestamp(0) without time zone,
    summary_tematic_delete_by integer,
    step_study_id bigint
);
 #   DROP TABLE public.summary_tematic;
       public         postgres    false    3            /           1259    32496 &   summary_tematic_summary_tematic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_tematic_summary_tematic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.summary_tematic_summary_tematic_id_seq;
       public       postgres    false    3    302            {           0    0 &   summary_tematic_summary_tematic_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.summary_tematic_summary_tematic_id_seq OWNED BY public.summary_tematic.summary_tematic_id;
            public       postgres    false    303            0           1259    32498    tahfizh    TABLE     �  CREATE TABLE public.tahfizh (
    tahfizh_id bigint NOT NULL,
    tahfizh_type character varying(191) NOT NULL,
    tahfizh_value character varying(191),
    student_id bigint,
    step_study_id bigint,
    tahfizh_insert_by integer,
    tahfizh_insert_time timestamp(0) without time zone,
    tahfizh_update_time timestamp(0) without time zone,
    tahfizh_update_by integer,
    tahfizh_delete_time timestamp(0) without time zone,
    tahfizh_delete_by integer
);
    DROP TABLE public.tahfizh;
       public         postgres    false    3            1           1259    32501    tahfizh_tahfizh_id_seq    SEQUENCE        CREATE SEQUENCE public.tahfizh_tahfizh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tahfizh_tahfizh_id_seq;
       public       postgres    false    304    3            |           0    0    tahfizh_tahfizh_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tahfizh_tahfizh_id_seq OWNED BY public.tahfizh.tahfizh_id;
            public       postgres    false    305            2           1259    32503    tahsin    TABLE     �  CREATE TABLE public.tahsin (
    tahsin_id bigint NOT NULL,
    tahsin_type character varying(191) NOT NULL,
    tahsin_value character varying(191),
    student_id bigint,
    step_study_id bigint,
    tahsin_insert_by integer,
    tahsin_insert_time timestamp(0) without time zone,
    tahsin_update_time timestamp(0) without time zone,
    tahsin_update_by integer,
    tahsin_delete_time timestamp(0) without time zone,
    tahsin_delete_by integer
);
    DROP TABLE public.tahsin;
       public         postgres    false    3            3           1259    32506    tahsin_tahsin_id_seq    SEQUENCE     }   CREATE SEQUENCE public.tahsin_tahsin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tahsin_tahsin_id_seq;
       public       postgres    false    3    306            }           0    0    tahsin_tahsin_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tahsin_tahsin_id_seq OWNED BY public.tahsin.tahsin_id;
            public       postgres    false    307            4           1259    32508    teacher_note    TABLE     �  CREATE TABLE public.teacher_note (
    teacher_note_id bigint NOT NULL,
    student_id bigint,
    step_study_id bigint,
    raport_pts text,
    raport_pas text,
    teacher_note_insert_by integer,
    teacher_note_insert_time timestamp(0) without time zone,
    teacher_note_update_time timestamp(0) without time zone,
    teacher_note_update_by integer,
    teacher_note_delete_time timestamp(0) without time zone,
    teacher_note_delete_by integer
);
     DROP TABLE public.teacher_note;
       public         postgres    false    3            5           1259    32514     teacher_note_teacher_note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_note_teacher_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.teacher_note_teacher_note_id_seq;
       public       postgres    false    308    3            ~           0    0     teacher_note_teacher_note_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.teacher_note_teacher_note_id_seq OWNED BY public.teacher_note.teacher_note_id;
            public       postgres    false    309            6           1259    32516    teacher_setting    TABLE       CREATE TABLE public.teacher_setting (
    teacher_setting_id bigint NOT NULL,
    employee_id bigint,
    unit_year_id bigint,
    course_id bigint,
    teacher_setting_status character varying(191),
    teacher_setting_insert_by integer,
    teacher_setting_insert_time timestamp(0) without time zone,
    teacher_setting_update_time timestamp(0) without time zone,
    teacher_setting_update_by integer,
    teacher_setting_delete_time timestamp(0) without time zone,
    teacher_setting_delete_by integer,
    study_group_id bigint
);
 #   DROP TABLE public.teacher_setting;
       public         postgres    false    3            7           1259    32519 &   teacher_setting_teacher_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_setting_teacher_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.teacher_setting_teacher_setting_id_seq;
       public       postgres    false    3    310                       0    0 &   teacher_setting_teacher_setting_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.teacher_setting_teacher_setting_id_seq OWNED BY public.teacher_setting.teacher_setting_id;
            public       postgres    false    311            8           1259    32521    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(191) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    username character varying(191),
    user_status character varying(191),
    api_token character varying(191)
);
    DROP TABLE public.users;
       public         postgres    false    3            9           1259    32527    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    3    312            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    313            .           2604    32529    absensi absensi_id    DEFAULT     x   ALTER TABLE ONLY public.absensi ALTER COLUMN absensi_id SET DEFAULT nextval('public.absensi_absensi_id_seq'::regclass);
 A   ALTER TABLE public.absensi ALTER COLUMN absensi_id DROP DEFAULT;
       public       postgres    false    197    196            /           2604    32530    class_advisor class_advisor_id    DEFAULT     �   ALTER TABLE ONLY public.class_advisor ALTER COLUMN class_advisor_id SET DEFAULT nextval('public.class_advisor_class_advisor_id_seq'::regclass);
 M   ALTER TABLE public.class_advisor ALTER COLUMN class_advisor_id DROP DEFAULT;
       public       postgres    false    199    198            0           2604    32531     course_setting course_setting_id    DEFAULT     �   ALTER TABLE ONLY public.course_setting ALTER COLUMN course_setting_id SET DEFAULT nextval('public.course_setting_course_setting_id_seq'::regclass);
 O   ALTER TABLE public.course_setting ALTER COLUMN course_setting_id DROP DEFAULT;
       public       postgres    false    201    200            1           2604    32532     daily_exercise daily_exercise_id    DEFAULT     �   ALTER TABLE ONLY public.daily_exercise ALTER COLUMN daily_exercise_id SET DEFAULT nextval('public.dialy_exercise_dialy_exercise_id_seq'::regclass);
 O   ALTER TABLE public.daily_exercise ALTER COLUMN daily_exercise_id DROP DEFAULT;
       public       postgres    false    204    202            2           2604    32533 ,   daily_exercise_skill daily_exercise_skill_id    DEFAULT     �   ALTER TABLE ONLY public.daily_exercise_skill ALTER COLUMN daily_exercise_skill_id SET DEFAULT nextval('public.dialy_exercise_skill_dialy_exercise_id_seq'::regclass);
 [   ALTER TABLE public.daily_exercise_skill ALTER COLUMN daily_exercise_skill_id DROP DEFAULT;
       public       postgres    false    205    203            3           2604    32534    employee_unit employee_unit_id    DEFAULT     �   ALTER TABLE ONLY public.employee_unit ALTER COLUMN employee_unit_id SET DEFAULT nextval('public.employee_unit_employee_unit_id_seq'::regclass);
 M   ALTER TABLE public.employee_unit ALTER COLUMN employee_unit_id DROP DEFAULT;
       public       postgres    false    207    206            4           2604    32535 "   extracurricular extracurricular_id    DEFAULT     �   ALTER TABLE ONLY public.extracurricular ALTER COLUMN extracurricular_id SET DEFAULT nextval('public.extracurricular_extracurricular_id_seq'::regclass);
 Q   ALTER TABLE public.extracurricular ALTER COLUMN extracurricular_id DROP DEFAULT;
       public       postgres    false    209    208            5           2604    32536     friendly_value friendly_value_id    DEFAULT     �   ALTER TABLE ONLY public.friendly_value ALTER COLUMN friendly_value_id SET DEFAULT nextval('public.friendly_value_friendly_value_id_seq'::regclass);
 O   ALTER TABLE public.friendly_value ALTER COLUMN friendly_value_id DROP DEFAULT;
       public       postgres    false    211    210            7           2604    32537     input_analysis input_analysis_id    DEFAULT     �   ALTER TABLE ONLY public.input_analysis ALTER COLUMN input_analysis_id SET DEFAULT nextval('public.input_analysis_input_analysis_id_seq'::regclass);
 O   ALTER TABLE public.input_analysis ALTER COLUMN input_analysis_id DROP DEFAULT;
       public       postgres    false    213    212            8           2604    32538 *   input_analysis_tema input_analysis_tema_id    DEFAULT     �   ALTER TABLE ONLY public.input_analysis_tema ALTER COLUMN input_analysis_tema_id SET DEFAULT nextval('public.input_analysis_tema_input_analysis_tema_id_seq'::regclass);
 Y   ALTER TABLE public.input_analysis_tema ALTER COLUMN input_analysis_tema_id DROP DEFAULT;
       public       postgres    false    215    214            9           2604    32539    institution institution_id    DEFAULT     �   ALTER TABLE ONLY public.institution ALTER COLUMN institution_id SET DEFAULT nextval('public.institution_institution_id_seq'::regclass);
 I   ALTER TABLE public.institution ALTER COLUMN institution_id DROP DEFAULT;
       public       postgres    false    217    216            :           2604    32540 ,   list_question_per_kd list_question_per_kd_id    DEFAULT     �   ALTER TABLE ONLY public.list_question_per_kd ALTER COLUMN list_question_per_kd_id SET DEFAULT nextval('public.list_question_per_kd_list_question_per_kd_id_seq'::regclass);
 [   ALTER TABLE public.list_question_per_kd ALTER COLUMN list_question_per_kd_id DROP DEFAULT;
       public       postgres    false    219    218            ;           2604    32541 0   list_question_per_tema list_question_per_tema_id    DEFAULT     �   ALTER TABLE ONLY public.list_question_per_tema ALTER COLUMN list_question_per_tema_id SET DEFAULT nextval('public.list_question_per_tema_list_question_per_tema_id_seq'::regclass);
 _   ALTER TABLE public.list_question_per_tema ALTER COLUMN list_question_per_tema_id DROP DEFAULT;
       public       postgres    false    221    220            <           2604    32542    m_building building_id    DEFAULT     �   ALTER TABLE ONLY public.m_building ALTER COLUMN building_id SET DEFAULT nextval('public.m_building_building_id_seq'::regclass);
 E   ALTER TABLE public.m_building ALTER COLUMN building_id DROP DEFAULT;
       public       postgres    false    223    222            =           2604    32543    m_class_grade class_grade_id    DEFAULT     �   ALTER TABLE ONLY public.m_class_grade ALTER COLUMN class_grade_id SET DEFAULT nextval('public.m_class_grade_class_grade_id_seq'::regclass);
 K   ALTER TABLE public.m_class_grade ALTER COLUMN class_grade_id DROP DEFAULT;
       public       postgres    false    225    224            >           2604    32544    m_class_room class_room_id    DEFAULT     �   ALTER TABLE ONLY public.m_class_room ALTER COLUMN class_room_id SET DEFAULT nextval('public.m_class_room_class_room_id_seq'::regclass);
 I   ALTER TABLE public.m_class_room ALTER COLUMN class_room_id DROP DEFAULT;
       public       postgres    false    227    226            ?           2604    32545    m_course course_id    DEFAULT     x   ALTER TABLE ONLY public.m_course ALTER COLUMN course_id SET DEFAULT nextval('public.m_course_course_id_seq'::regclass);
 A   ALTER TABLE public.m_course ALTER COLUMN course_id DROP DEFAULT;
       public       postgres    false    229    228            @           2604    32546    m_department department_id    DEFAULT     �   ALTER TABLE ONLY public.m_department ALTER COLUMN department_id SET DEFAULT nextval('public.m_department_department_id_seq'::regclass);
 I   ALTER TABLE public.m_department ALTER COLUMN department_id DROP DEFAULT;
       public       postgres    false    231    230            A           2604    32547 $   m_education_level education_level_id    DEFAULT     �   ALTER TABLE ONLY public.m_education_level ALTER COLUMN education_level_id SET DEFAULT nextval('public.m_education_level_education_level_id_seq'::regclass);
 S   ALTER TABLE public.m_education_level ALTER COLUMN education_level_id DROP DEFAULT;
       public       postgres    false    233    232            B           2604    32548    m_employee employee_id    DEFAULT     �   ALTER TABLE ONLY public.m_employee ALTER COLUMN employee_id SET DEFAULT nextval('public.m_employee_employee_id_seq'::regclass);
 E   ALTER TABLE public.m_employee ALTER COLUMN employee_id DROP DEFAULT;
       public       postgres    false    235    234            C           2604    32549    m_floor floor_id    DEFAULT     t   ALTER TABLE ONLY public.m_floor ALTER COLUMN floor_id SET DEFAULT nextval('public.m_floor_floor_id_seq'::regclass);
 ?   ALTER TABLE public.m_floor ALTER COLUMN floor_id DROP DEFAULT;
       public       postgres    false    237    236            D           2604    32550 
   m_kd kd_id    DEFAULT     h   ALTER TABLE ONLY public.m_kd ALTER COLUMN kd_id SET DEFAULT nextval('public.m_kd_kd_id_seq'::regclass);
 9   ALTER TABLE public.m_kd ALTER COLUMN kd_id DROP DEFAULT;
       public       postgres    false    241    238            E           2604    32551    m_kd_detail kd_detail_id    DEFAULT     �   ALTER TABLE ONLY public.m_kd_detail ALTER COLUMN kd_detail_id SET DEFAULT nextval('public.m_kd_detail_kd_detail_id_seq'::regclass);
 G   ALTER TABLE public.m_kd_detail ALTER COLUMN kd_detail_id DROP DEFAULT;
       public       postgres    false    240    239            F           2604    32552    m_kkm kkm_id    DEFAULT     l   ALTER TABLE ONLY public.m_kkm ALTER COLUMN kkm_id SET DEFAULT nextval('public.m_kkm_kkm_id_seq'::regclass);
 ;   ALTER TABLE public.m_kkm ALTER COLUMN kkm_id DROP DEFAULT;
       public       postgres    false    243    242            G           2604    32553    m_lesson_hour lesson_hour_id    DEFAULT     �   ALTER TABLE ONLY public.m_lesson_hour ALTER COLUMN lesson_hour_id SET DEFAULT nextval('public.m_lesson_hour_lesson_hour_id_seq'::regclass);
 K   ALTER TABLE public.m_lesson_hour ALTER COLUMN lesson_hour_id DROP DEFAULT;
       public       postgres    false    245    244            H           2604    32554    m_parent parent_id    DEFAULT     x   ALTER TABLE ONLY public.m_parent ALTER COLUMN parent_id SET DEFAULT nextval('public.m_parent_parent_id_seq'::regclass);
 A   ALTER TABLE public.m_parent ALTER COLUMN parent_id DROP DEFAULT;
       public       postgres    false    247    246            I           2604    32555    m_position position_id    DEFAULT     �   ALTER TABLE ONLY public.m_position ALTER COLUMN position_id SET DEFAULT nextval('public.m_position_position_id_seq'::regclass);
 E   ALTER TABLE public.m_position ALTER COLUMN position_id DROP DEFAULT;
       public       postgres    false    249    248            J           2604    32556    m_step_study step_study_id    DEFAULT     �   ALTER TABLE ONLY public.m_step_study ALTER COLUMN step_study_id SET DEFAULT nextval('public.m_step_study_step_study_id_seq'::regclass);
 I   ALTER TABLE public.m_step_study ALTER COLUMN step_study_id DROP DEFAULT;
       public       postgres    false    251    250            K           2604    32557    m_student student_id    DEFAULT     |   ALTER TABLE ONLY public.m_student ALTER COLUMN student_id SET DEFAULT nextval('public.m_student_student_id_seq'::regclass);
 C   ALTER TABLE public.m_student ALTER COLUMN student_id DROP DEFAULT;
       public       postgres    false    253    252            L           2604    32558    m_study_group study_group_id    DEFAULT     �   ALTER TABLE ONLY public.m_study_group ALTER COLUMN study_group_id SET DEFAULT nextval('public.m_study_group_study_group_id_seq'::regclass);
 K   ALTER TABLE public.m_study_group ALTER COLUMN study_group_id DROP DEFAULT;
       public       postgres    false    255    254            M           2604    32559    m_unit unit_id    DEFAULT     p   ALTER TABLE ONLY public.m_unit ALTER COLUMN unit_id SET DEFAULT nextval('public.m_unit_unit_id_seq'::regclass);
 =   ALTER TABLE public.m_unit ALTER COLUMN unit_id DROP DEFAULT;
       public       postgres    false    257    256            N           2604    32560    m_unit_year unit_year_id    DEFAULT     �   ALTER TABLE ONLY public.m_unit_year ALTER COLUMN unit_year_id SET DEFAULT nextval('public.m_unit_year_unit_year_id_seq'::regclass);
 G   ALTER TABLE public.m_unit_year ALTER COLUMN unit_year_id DROP DEFAULT;
       public       postgres    false    259    258            O           2604    32561    menu menu_id    DEFAULT     l   ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);
 ;   ALTER TABLE public.menu ALTER COLUMN menu_id DROP DEFAULT;
       public       postgres    false    261    260            P           2604    32562    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    263    262            Q           2604    32563    observasi observasi_id    DEFAULT     �   ALTER TABLE ONLY public.observasi ALTER COLUMN observasi_id SET DEFAULT nextval('public.observasi_observasi_id_seq'::regclass);
 E   ALTER TABLE public.observasi ALTER COLUMN observasi_id DROP DEFAULT;
       public       postgres    false    267    266            R           2604    32564    parlookup parlookup_id    DEFAULT     �   ALTER TABLE ONLY public.parlookup ALTER COLUMN parlookup_id SET DEFAULT nextval('public.parlookup_parlookup_id_seq'::regclass);
 E   ALTER TABLE public.parlookup ALTER COLUMN parlookup_id DROP DEFAULT;
       public       postgres    false    269    268            S           2604    32565    pd pd_id    DEFAULT     d   ALTER TABLE ONLY public.pd ALTER COLUMN pd_id SET DEFAULT nextval('public.pd_pd_id_seq'::regclass);
 7   ALTER TABLE public.pd ALTER COLUMN pd_id DROP DEFAULT;
       public       postgres    false    272    271            U           2604    32566    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    274    273            V           2604    32567    personality personality_id    DEFAULT     �   ALTER TABLE ONLY public.personality ALTER COLUMN personality_id SET DEFAULT nextval('public.personality_personality_id_seq'::regclass);
 I   ALTER TABLE public.personality ALTER COLUMN personality_id DROP DEFAULT;
       public       postgres    false    276    275            W           2604    32568 $   physical_student physical_student_id    DEFAULT     �   ALTER TABLE ONLY public.physical_student ALTER COLUMN physical_student_id SET DEFAULT nextval('public.physical_student_physical_student_id_seq'::regclass);
 S   ALTER TABLE public.physical_student ALTER COLUMN physical_student_id DROP DEFAULT;
       public       postgres    false    278    277            X           2604    32569    prestation prestation_id    DEFAULT     �   ALTER TABLE ONLY public.prestation ALTER COLUMN prestation_id SET DEFAULT nextval('public.prestation_prestation_id_seq'::regclass);
 G   ALTER TABLE public.prestation ALTER COLUMN prestation_id DROP DEFAULT;
       public       postgres    false    280    279            Y           2604    32570    quiz_per_kd quiz_per_kd_id    DEFAULT     �   ALTER TABLE ONLY public.quiz_per_kd ALTER COLUMN quiz_per_kd_id SET DEFAULT nextval('public.quiz_per_kd_quiz_per_kd_id_seq'::regclass);
 I   ALTER TABLE public.quiz_per_kd ALTER COLUMN quiz_per_kd_id DROP DEFAULT;
       public       postgres    false    282    281            Z           2604    32571    raport raport_id    DEFAULT     t   ALTER TABLE ONLY public.raport ALTER COLUMN raport_id SET DEFAULT nextval('public.raport_raport_id_seq'::regclass);
 ?   ALTER TABLE public.raport ALTER COLUMN raport_id DROP DEFAULT;
       public       postgres    false    286    283            [           2604    32572    raport_pts raport_pts_id    DEFAULT     �   ALTER TABLE ONLY public.raport_pts ALTER COLUMN raport_pts_id SET DEFAULT nextval('public.raport_pts_raport_pts_id_seq'::regclass);
 G   ALTER TABLE public.raport_pts ALTER COLUMN raport_pts_id DROP DEFAULT;
       public       postgres    false    285    284            \           2604    32573    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    289    288            ]           2604    32574 0   setting_daily_exercise setting_daily_exercise_id    DEFAULT     �   ALTER TABLE ONLY public.setting_daily_exercise ALTER COLUMN setting_daily_exercise_id SET DEFAULT nextval('public.setting_daily_exercise_setting_daily_exercise_id_seq'::regclass);
 _   ALTER TABLE public.setting_daily_exercise ALTER COLUMN setting_daily_exercise_id DROP DEFAULT;
       public       postgres    false    291    290            ^           2604    32575 &   structure_tematic structure_tematic_id    DEFAULT     �   ALTER TABLE ONLY public.structure_tematic ALTER COLUMN structure_tematic_id SET DEFAULT nextval('public.structure_tematic_structure_tematic_id_seq'::regclass);
 U   ALTER TABLE public.structure_tematic ALTER COLUMN structure_tematic_id DROP DEFAULT;
       public       postgres    false    295    292            _           2604    32576 4   structure_tematic_detail structure_tematic_detail_id    DEFAULT     �   ALTER TABLE ONLY public.structure_tematic_detail ALTER COLUMN structure_tematic_detail_id SET DEFAULT nextval('public.structure_tematic_detail_structure_tematic_detail_id_seq'::regclass);
 c   ALTER TABLE public.structure_tematic_detail ALTER COLUMN structure_tematic_detail_id DROP DEFAULT;
       public       postgres    false    294    293            `           2604    32577 *   study_group_setting study_group_setting_id    DEFAULT     �   ALTER TABLE ONLY public.study_group_setting ALTER COLUMN study_group_setting_id SET DEFAULT nextval('public.study_group_setting_study_group_setting_id_seq'::regclass);
 Y   ALTER TABLE public.study_group_setting ALTER COLUMN study_group_setting_id DROP DEFAULT;
       public       postgres    false    297    296            a           2604    32578    summary_kd summary_kd_id    DEFAULT     �   ALTER TABLE ONLY public.summary_kd ALTER COLUMN summary_kd_id SET DEFAULT nextval('public.summary_kd_summary_kd_id_seq'::regclass);
 G   ALTER TABLE public.summary_kd ALTER COLUMN summary_kd_id DROP DEFAULT;
       public       postgres    false    299    298            b           2604    32579    summary_skill summary_skill_id    DEFAULT     �   ALTER TABLE ONLY public.summary_skill ALTER COLUMN summary_skill_id SET DEFAULT nextval('public.summary_skill_summary_skill_id_seq'::regclass);
 M   ALTER TABLE public.summary_skill ALTER COLUMN summary_skill_id DROP DEFAULT;
       public       postgres    false    301    300            c           2604    32580 "   summary_tematic summary_tematic_id    DEFAULT     �   ALTER TABLE ONLY public.summary_tematic ALTER COLUMN summary_tematic_id SET DEFAULT nextval('public.summary_tematic_summary_tematic_id_seq'::regclass);
 Q   ALTER TABLE public.summary_tematic ALTER COLUMN summary_tematic_id DROP DEFAULT;
       public       postgres    false    303    302            d           2604    32581    tahfizh tahfizh_id    DEFAULT     x   ALTER TABLE ONLY public.tahfizh ALTER COLUMN tahfizh_id SET DEFAULT nextval('public.tahfizh_tahfizh_id_seq'::regclass);
 A   ALTER TABLE public.tahfizh ALTER COLUMN tahfizh_id DROP DEFAULT;
       public       postgres    false    305    304            e           2604    32582    tahsin tahsin_id    DEFAULT     t   ALTER TABLE ONLY public.tahsin ALTER COLUMN tahsin_id SET DEFAULT nextval('public.tahsin_tahsin_id_seq'::regclass);
 ?   ALTER TABLE public.tahsin ALTER COLUMN tahsin_id DROP DEFAULT;
       public       postgres    false    307    306            f           2604    32583    teacher_note teacher_note_id    DEFAULT     �   ALTER TABLE ONLY public.teacher_note ALTER COLUMN teacher_note_id SET DEFAULT nextval('public.teacher_note_teacher_note_id_seq'::regclass);
 K   ALTER TABLE public.teacher_note ALTER COLUMN teacher_note_id DROP DEFAULT;
       public       postgres    false    309    308            g           2604    32584 "   teacher_setting teacher_setting_id    DEFAULT     �   ALTER TABLE ONLY public.teacher_setting ALTER COLUMN teacher_setting_id SET DEFAULT nextval('public.teacher_setting_teacher_setting_id_seq'::regclass);
 Q   ALTER TABLE public.teacher_setting ALTER COLUMN teacher_setting_id DROP DEFAULT;
       public       postgres    false    311    310            h           2604    32585    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    313    312            �          0    32125    absensi 
   TABLE DATA               �   COPY public.absensi (absensi_id, student_id, absensi_type, absensi_total, month, step_study_id, absensi_insert_by, absensi_insert_time, absensi_update_time, absensi_update_by, absensi_delete_time, absensi_delete_by) FROM stdin;
    public       postgres    false    196   5      �          0    32130    class_advisor 
   TABLE DATA                  COPY public.class_advisor (class_advisor_id, employee_id, unit_year_id, study_group_id, class_advisor_insert_by, class_advisor_insert_time, class_advisor_update_time, class_advisor_update_by, class_advisor_delete_time, class_advisor_delete_by) FROM stdin;
    public       postgres    false    198   �5      �          0    32135    course_setting 
   TABLE DATA                 COPY public.course_setting (course_setting_id, course_id, study_group_id, course_setting_status, course_setting_insert_by, course_setting_insert_time, course_setting_update_time, course_setting_update_by, course_setting_delete_time, course_setting_delete_by, unit_year_id) FROM stdin;
    public       postgres    false    200   6      �          0    32140    daily_exercise 
   TABLE DATA               A  COPY public.daily_exercise (daily_exercise_id, student_id, kd_detail_id, structure_tematic_id, kd_type, score, daily_exercise_type, daily_exercise_insert_by, daily_exercise_insert_time, daily_exercise_update_time, daily_exercise_update_by, daily_exercise_delete_time, daily_exercise_delete_by, step_study_id) FROM stdin;
    public       postgres    false    202   �6      �          0    32146    daily_exercise_skill 
   TABLE DATA               H  COPY public.daily_exercise_skill (daily_exercise_skill_id, student_id, kd_id, skill_value, daily_exercise_skill_insert_by, daily_exercise_skill_insert_time, daily_exercise_skill_update_time, daily_exercise_skill_update_by, daily_exercise_skill_delete_time, daily_exercise_skill_delete_by, step_study_id, skill_type) FROM stdin;
    public       postgres    false    203   7      �          0    32156    employee_unit 
   TABLE DATA               �   COPY public.employee_unit (employee_unit_id, unit_id, employee_id, employee_unit_insert_by, employee_unit_insert_time, employee_unit_update_time, employee_unit_update_by, employee_unit_delete_time, employee_unit_delete_by) FROM stdin;
    public       postgres    false    206   -7      �          0    32161    extracurricular 
   TABLE DATA                 COPY public.extracurricular (extracurricular_id, student_id, step_study_id, type, value, "desc", extracurricular_insert_by, extracurricular_insert_time, extracurricular_update_time, extracurricular_update_by, extracurricular_delete_time, extracurricular_delete_by) FROM stdin;
    public       postgres    false    208   J7      �          0    32169    friendly_value 
   TABLE DATA               <  COPY public.friendly_value (friendly_value_id, student_id, step_study_id, friendly_value_type, friendly_value_category, friendly_value_value, friendly_value_insert_by, friendly_value_insert_time, friendly_value_update_time, friendly_value_update_by, friendly_value_delete_time, friendly_value_delete_by) FROM stdin;
    public       postgres    false    210   8      �          0    32178    input_analysis 
   TABLE DATA               A  COPY public.input_analysis (input_analysis_id, kd_id, student_id, number_question, value_quality, total_value, input_analysis_type, input_analysis_insert_by, input_analysis_insert_time, input_analysis_update_time, input_analysis_update_by, input_analysis_delete_time, input_analysis_delete_by, step_study_id) FROM stdin;
    public       postgres    false    212   �8      �          0    32186    input_analysis_tema 
   TABLE DATA               u  COPY public.input_analysis_tema (input_analysis_tema_id, kd_id, student_id, number_question, value_quality, total_value, input_analysis_tema_type, input_analysis_tema_insert_by, input_analysis_tema_insert_time, input_analysis_tema_update_time, input_analysis_tema_update_by, input_analysis_tema_delete_time, input_analysis_tema_delete_by, structure_tematic_id) FROM stdin;
    public       postgres    false    214   �;      �          0    32194    institution 
   TABLE DATA               �   COPY public.institution (institution_id, institution_name, institution_desc, institution_address, institution_telp, institution_email, institution_start_time, institution_end_time, created_at, updated_at) FROM stdin;
    public       postgres    false    216   �<      �          0    32202    list_question_per_kd 
   TABLE DATA               @  COPY public.list_question_per_kd (list_question_per_kd_id, quiz_per_kd_id, number_question, quality_question, list_question_per_kd_insert_by, list_question_per_kd_insert_time, list_question_per_kd_update_time, list_question_per_kd_update_by, list_question_per_kd_delete_time, list_question_per_kd_delete_by) FROM stdin;
    public       postgres    false    218   ?=      �          0    32207    list_question_per_tema 
   TABLE DATA               ]  COPY public.list_question_per_tema (list_question_per_tema_id, number_question, quality_question, list_question_per_tema_insert_by, list_question_per_tema_insert_time, list_question_per_tema_update_time, list_question_per_tema_update_by, list_question_per_tema_delete_time, list_question_per_tema_delete_by, structure_tematic_detail_id) FROM stdin;
    public       postgres    false    220   �=      �          0    32212 
   m_building 
   TABLE DATA               �   COPY public.m_building (building_id, building_name, building_desc, building_status, building_insert_by, building_insert_time, building_update_time, building_update_by, building_delete_time, building_delete_by) FROM stdin;
    public       postgres    false    222   G>      �          0    32220    m_class_grade 
   TABLE DATA                 COPY public.m_class_grade (class_grade_id, unit_id, class_grade_order, class_grade_status, class_grade_name, class_grade_desc, class_grade_insert_by, class_grade_insert_time, class_grade_update_time, class_grade_update_by, class_grade_delete_time, class_grade_delete_by) FROM stdin;
    public       postgres    false    224   d>      �          0    32228    m_class_room 
   TABLE DATA                 COPY public.m_class_room (class_room_id, unit_id, class_room_name, class_room_text, class_room_status, class_room_desc, class_room_insert_by, class_room_insert_time, class_room_update_time, class_room_update_by, class_room_delete_time, class_room_delete_by, floor_id) FROM stdin;
    public       postgres    false    226   �>      �          0    32236    m_course 
   TABLE DATA               �   COPY public.m_course (course_id, course_status, course_name, course_code, course_desc, course_insert_by, course_insert_time, course_update_time, course_update_by, course_delete_time, course_delete_by, kkm_value, course_type) FROM stdin;
    public       postgres    false    228   T?      �          0    32244    m_department 
   TABLE DATA               �   COPY public.m_department (department_id, department_name, department_desc, department_status, department_insert_by, department_insert_time, department_update_time, department_update_by, department_delete_time, department_delete_by) FROM stdin;
    public       postgres    false    230   '@      �          0    32252    m_education_level 
   TABLE DATA               -  COPY public.m_education_level (education_level_id, education_level_name, education_level_status, education_level_resume, education_level_insert_by, education_level_insert_time, education_level_update_time, education_level_update_by, education_level_delete_time, education_level_delete_by) FROM stdin;
    public       postgres    false    232   D@      �          0    32260 
   m_employee 
   TABLE DATA               0  COPY public.m_employee (employee_id, employee_status, employee_id_card, position_id, user_id, employee_type, employee_name, employee_working_status, employee_nik, employee_gender, employee_birth_place, employee_birth_date, employee_religion, employee_identity, employee_last_education, employee_marital_status, employee_hp, employee_website, employee_telp, employee_address, employee_photo, employee_desc, employee_email, employee_insert_by, employee_insert_time, employee_update_time, employee_update_by, employee_delete_time, employee_delete_by) FROM stdin;
    public       postgres    false    234   a@      �          0    32268    m_floor 
   TABLE DATA               �   COPY public.m_floor (floor_id, building_id, floor_name, floor_desc, floor_insert_by, floor_insert_time, floor_update_time, floor_update_by, floor_delete_time, floor_delete_by) FROM stdin;
    public       postgres    false    236   A      �          0    32273    m_kd 
   TABLE DATA               �   COPY public.m_kd (kd_id, unit_year_id, course_id, kd_code, kd_name, kd_desc, kd_insert_by, kd_insert_time, kd_update_time, kd_update_by, kd_delete_time, kd_delete_by, kd_type, unit_id) FROM stdin;
    public       postgres    false    238   6A      �          0    32279    m_kd_detail 
   TABLE DATA               �   COPY public.m_kd_detail (kd_detail_id, kd_id, step_study_id, kd_detail_insert_by, kd_detail_insert_time, kd_detail_update_time, kd_detail_update_by, kd_detail_delete_time, kd_detail_delete_by) FROM stdin;
    public       postgres    false    239   �B      �          0    32286    m_kkm 
   TABLE DATA               �   COPY public.m_kkm (kkm_id, kkm_value, kkm_a, kkm_b, kkm_c, kkm_d, kkm_insert_by, kkm_insert_time, kkm_update_time, kkm_update_by, kkm_delete_time, kkm_delete_by, step_study_id, course_id, class_grade_id) FROM stdin;
    public       postgres    false    242   C      �          0    32291    m_lesson_hour 
   TABLE DATA               8  COPY public.m_lesson_hour (lesson_hour_id, lesson_day, hour_to, lesson_hour_type, lesson_hour_start, lesson_hour_end, lesson_hour_desc, lesson_hour_status, lesson_hour_insert_by, lesson_hour_insert_time, lesson_hour_update_time, lesson_hour_update_by, lesson_hour_delete_time, lesson_hour_delete_by) FROM stdin;
    public       postgres    false    244   �C      �          0    32299    m_parent 
   TABLE DATA               �  COPY public.m_parent (parent_id, student_id, user_id, parent_name, parent_id_card, parent_status, parent_nickname, parent_gender, parent_birth_place, parent_birth_date, parent_address, parent_hp, parent_telp, parent_email, parent_photo, parent_hobby, parent_religion, parent_insert_by, parent_insert_time, parent_update_time, parent_update_by, parent_delete_time, parent_delete_by) FROM stdin;
    public       postgres    false    246   pD      �          0    32307 
   m_position 
   TABLE DATA               �   COPY public.m_position (position_id, department_id, position_name, position_desc, position_status, position_insert_by, position_insert_time, position_update_time, position_update_by, position_delete_time, position_delete_by) FROM stdin;
    public       postgres    false    248   �D                 0    32315    m_step_study 
   TABLE DATA               $  COPY public.m_step_study (step_study_id, unit_year_id, step_study_name, step_study_desc, step_study_start, step_study_end, step_study_status, step_study_insert_by, step_study_insert_time, step_study_update_time, step_study_update_by, step_study_delete_time, step_study_delete_by) FROM stdin;
    public       postgres    false    250   �D                0    32323 	   m_student 
   TABLE DATA               l  COPY public.m_student (student_id, unit_id, class_grade_id, user_id, student_name, student_id_card, student_status, student_nickname, student_gender, student_birth_place, student_birth_date, student_address, student_hp, student_telp, student_email, student_father_hp, student_mother_hp, student_child_to, student_brother, student_child_status, student_photo, student_hobby, student_orphan_status, student_school_origin, student_school_origin_address, student_nisn, student_test_number, student_achievement, student_blood_type, student_religion, student_kk, student_ktp, student_ijazah, student_mother_name, student_father_name, student_mother_job, student_father_job, student_father_income, student_mother_income, student_insert_by, student_insert_time, student_update_time, student_update_by, student_delete_time, student_delete_by, student_tall, student_weight) FROM stdin;
    public       postgres    false    252   ,E                0    32331    m_study_group 
   TABLE DATA               '  COPY public.m_study_group (study_group_id, unit_id, class_grade_id, class_room_id, study_group_status, study_group_name, study_group_desc, study_group_insert_by, study_group_insert_time, study_group_update_time, study_group_update_by, study_group_delete_time, study_group_delete_by) FROM stdin;
    public       postgres    false    254   1M                0    32339    m_unit 
   TABLE DATA                  COPY public.m_unit (unit_id, education_level_id, unit_name, unit_desc, unit_logo, unit_prefix, unit_address, unit_telp, unit_email, unit_website, unit_status, unit_insert_by, unit_insert_time, unit_update_time, unit_update_by, unit_delete_time, unit_delete_by, foundation_id) FROM stdin;
    public       postgres    false    256   �M                0    32347    m_unit_year 
   TABLE DATA               $  COPY public.m_unit_year (unit_year_id, unit_id, unit_year_status, unit_year_name, unit_year_prefix, unit_year_start, unit_year_end, unit_year_desc, unit_year_insert_by, unit_year_insert_time, unit_year_update_time, unit_year_update_by, unit_year_delete_time, unit_year_delete_by) FROM stdin;
    public       postgres    false    258   kN      
          0    32355    menu 
   TABLE DATA               {   COPY public.menu (menu_id, menu_name, menu_desc, menu_url, menu_parent, type, created_at, updated_at, no_urut) FROM stdin;
    public       postgres    false    260   �N                0    32363 
   migrations 
   TABLE DATA               :   COPY public.migrations (id, migration, batch) FROM stdin;
    public       postgres    false    262   XU                0    32368    model_has_permissions 
   TABLE DATA               T   COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
    public       postgres    false    264   M\                0    32371    model_has_roles 
   TABLE DATA               H   COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
    public       postgres    false    265   j\                0    32374 	   observasi 
   TABLE DATA                 COPY public.observasi (observasi_id, student_id, step_study_id, observasi_type, observasi_category, observasi_insert_by, observasi_insert_time, observasi_update_time, observasi_update_by, observasi_delete_time, observasi_delete_by, observasi_value) FROM stdin;
    public       postgres    false    266   �\                0    32382 	   parlookup 
   TABLE DATA               q   COPY public.parlookup (parlookup_id, name, value, category, "desc", created_at, updated_at, unit_id) FROM stdin;
    public       postgres    false    268   �^                0    32390    password_resets 
   TABLE DATA               C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public       postgres    false    270   �a                0    32393    pd 
   TABLE DATA               �   COPY public.pd (pd_id, student_id, step_study_id, pd_type, pd_category, pd_value, pd_insert_by, pd_insert_time, pd_update_time, pd_update_by, pd_delete_time, pd_delete_by) FROM stdin;
    public       postgres    false    271   �a                0    32402    permissions 
   TABLE DATA               \   COPY public.permissions (id, name, guard_name, created_at, updated_at, menu_id) FROM stdin;
    public       postgres    false    273   �b                0    32407    personality 
   TABLE DATA                 COPY public.personality (personality_id, student_id, personality_type, personality_value, personality_insert_by, personality_insert_time, personality_update_time, personality_update_by, personality_delete_time, personality_delete_by, step_study_id) FROM stdin;
    public       postgres    false    275   l                0    32412    physical_student 
   TABLE DATA               :  COPY public.physical_student (physical_student_id, student_id, physical_type, physical_category, physical_value, step_study_id, physical_student_insert_by, physical_student_insert_time, physical_student_update_time, physical_student_update_by, physical_student_delete_time, physical_student_delete_by) FROM stdin;
    public       postgres    false    277   Vm                0    32420 
   prestation 
   TABLE DATA               �   COPY public.prestation (prestation_id, student_id, step_study_id, type, value, "desc", prestation_insert_by, prestation_insert_time, prestation_update_time, prestation_update_by, prestation_delete_time, prestation_delete_by) FROM stdin;
    public       postgres    false    279   �n                0    32428    quiz_per_kd 
   TABLE DATA                 COPY public.quiz_per_kd (quiz_per_kd_id, kd_id, total_question, type_question, description, quiz_per_kd_insert_by, quiz_per_kd_insert_time, quiz_per_kd_update_time, quiz_per_kd_update_by, quiz_per_kd_delete_time, quiz_per_kd_delete_by, step_study_id) FROM stdin;
    public       postgres    false    281   o      !          0    32436    raport 
   TABLE DATA               H  COPY public.raport (raport_id, course_id, student_id, step_study_id, total_pengetahuan, total_keterampilan, predikat_pengetahuan, predikat_keterampilan, keterangan_pengetahuan, keterangan_keterampilan, raport_insert_by, raport_insert_time, raport_update_time, raport_update_by, raport_delete_time, raport_delete_by) FROM stdin;
    public       postgres    false    283   �o      "          0    32442 
   raport_pts 
   TABLE DATA               h  COPY public.raport_pts (raport_pts_id, course_id, student_id, step_study_id, total_pengetahuan, total_keterampilan, predikat_pengetahuan, predikat_keterampilan, keterangan_pengetahuan, keterangan_keterampilan, raport_pts_insert_by, raport_pts_insert_time, raport_pts_update_time, raport_pts_update_by, raport_pts_delete_time, raport_pts_delete_by) FROM stdin;
    public       postgres    false    284   v      %          0    32452    role_has_permissions 
   TABLE DATA               F   COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
    public       postgres    false    287   �|      &          0    32455    roles 
   TABLE DATA               M   COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
    public       postgres    false    288   ~~      (          0    32460    setting_daily_exercise 
   TABLE DATA               �   COPY public.setting_daily_exercise (setting_daily_exercise_id, kd_id, skill_type, step_study_id, created_at, updated_at) FROM stdin;
    public       postgres    false    290   �~      *          0    32465    structure_tematic 
   TABLE DATA               `  COPY public.structure_tematic (structure_tematic_id, structure_tematic_name, study_group_id, step_study_id, structure_tematic_desc, structure_tematic_question, structure_tematic_insert_by, structure_tematic_insert_time, structure_tematic_update_time, structure_tematic_update_by, structure_tematic_delete_time, structure_tematic_delete_by) FROM stdin;
    public       postgres    false    292   �~      +          0    32471    structure_tematic_detail 
   TABLE DATA               �  COPY public.structure_tematic_detail (structure_tematic_detail_id, structure_tematic_id, total_question, structure_tematic_detail_insert_by, structure_tematic_detail_insert_time, structure_tematic_detail_update_time, structure_tematic_detail_update_by, structure_tematic_detail_delete_time, structure_tematic_detail_delete_by, kd_id, question_uts, question_uas, question_daily, type_question) FROM stdin;
    public       postgres    false    293   #      .          0    32478    study_group_setting 
   TABLE DATA               K  COPY public.study_group_setting (study_group_setting_id, student_id, study_group_id, study_group_setting_status, study_group_setting_insert_by, study_group_setting_insert_time, study_group_setting_update_time, study_group_setting_update_by, study_group_setting_delete_time, study_group_setting_delete_by, unit_year_id) FROM stdin;
    public       postgres    false    296   �      0          0    32483 
   summary_kd 
   TABLE DATA               �   COPY public.summary_kd (summary_kd_id, kd_id, student_id, step_study_id, type, total, summary_kd_insert_by, summary_kd_insert_time, summary_kd_update_time, summary_kd_update_by, summary_kd_delete_time, summary_kd_delete_by) FROM stdin;
    public       postgres    false    298   @�      2          0    32488    summary_skill 
   TABLE DATA                 COPY public.summary_skill (summary_skill_id, kd_id, student_id, step_study_id, total_skill, summary_skill_insert_by, summary_skill_insert_time, summary_skill_update_time, summary_skill_update_by, summary_skill_delete_time, summary_skill_delete_by) FROM stdin;
    public       postgres    false    300   Ȁ      4          0    32493    summary_tematic 
   TABLE DATA               *  COPY public.summary_tematic (summary_tematic_id, kd_id, student_id, structure_tematic_id, type, total, summary_tematic_insert_by, summary_tematic_insert_time, summary_tematic_update_time, summary_tematic_update_by, summary_tematic_delete_time, summary_tematic_delete_by, step_study_id) FROM stdin;
    public       postgres    false    302   M�      6          0    32498    tahfizh 
   TABLE DATA               �   COPY public.tahfizh (tahfizh_id, tahfizh_type, tahfizh_value, student_id, step_study_id, tahfizh_insert_by, tahfizh_insert_time, tahfizh_update_time, tahfizh_update_by, tahfizh_delete_time, tahfizh_delete_by) FROM stdin;
    public       postgres    false    304   ��      8          0    32503    tahsin 
   TABLE DATA               �   COPY public.tahsin (tahsin_id, tahsin_type, tahsin_value, student_id, step_study_id, tahsin_insert_by, tahsin_insert_time, tahsin_update_time, tahsin_update_by, tahsin_delete_time, tahsin_delete_by) FROM stdin;
    public       postgres    false    306   ��      :          0    32508    teacher_note 
   TABLE DATA                  COPY public.teacher_note (teacher_note_id, student_id, step_study_id, raport_pts, raport_pas, teacher_note_insert_by, teacher_note_insert_time, teacher_note_update_time, teacher_note_update_by, teacher_note_delete_time, teacher_note_delete_by) FROM stdin;
    public       postgres    false    308   Y�      <          0    32516    teacher_setting 
   TABLE DATA               3  COPY public.teacher_setting (teacher_setting_id, employee_id, unit_year_id, course_id, teacher_setting_status, teacher_setting_insert_by, teacher_setting_insert_time, teacher_setting_update_time, teacher_setting_update_by, teacher_setting_delete_time, teacher_setting_delete_by, study_group_id) FROM stdin;
    public       postgres    false    310   ��      >          0    32521    users 
   TABLE DATA               �   COPY public.users (id, email_verified_at, password, remember_token, created_at, updated_at, username, user_status, api_token) FROM stdin;
    public       postgres    false    312   �      �           0    0    absensi_absensi_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.absensi_absensi_id_seq', 345, true);
            public       postgres    false    197            �           0    0 "   class_advisor_class_advisor_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.class_advisor_class_advisor_id_seq', 9, true);
            public       postgres    false    199            �           0    0 $   course_setting_course_setting_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.course_setting_course_setting_id_seq', 31, true);
            public       postgres    false    201            �           0    0 $   dialy_exercise_dialy_exercise_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.dialy_exercise_dialy_exercise_id_seq', 2308, true);
            public       postgres    false    204            �           0    0 *   dialy_exercise_skill_dialy_exercise_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.dialy_exercise_skill_dialy_exercise_id_seq', 8258, true);
            public       postgres    false    205            �           0    0 "   employee_unit_employee_unit_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.employee_unit_employee_unit_id_seq', 39, true);
            public       postgres    false    207            �           0    0 &   extracurricular_extracurricular_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.extracurricular_extracurricular_id_seq', 232, true);
            public       postgres    false    209            �           0    0 $   friendly_value_friendly_value_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.friendly_value_friendly_value_id_seq', 36, true);
            public       postgres    false    211            �           0    0 $   input_analysis_input_analysis_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.input_analysis_input_analysis_id_seq', 4572, true);
            public       postgres    false    213            �           0    0 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.input_analysis_tema_input_analysis_tema_id_seq', 2188, true);
            public       postgres    false    215            �           0    0    institution_institution_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.institution_institution_id_seq', 3, true);
            public       postgres    false    217            �           0    0 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.list_question_per_kd_list_question_per_kd_id_seq', 241, true);
            public       postgres    false    219            �           0    0 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.list_question_per_tema_list_question_per_tema_id_seq', 321, true);
            public       postgres    false    221            �           0    0    m_building_building_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_building_building_id_seq', 1, false);
            public       postgres    false    223            �           0    0     m_class_grade_class_grade_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.m_class_grade_class_grade_id_seq', 6, true);
            public       postgres    false    225            �           0    0    m_class_room_class_room_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.m_class_room_class_room_id_seq', 5, true);
            public       postgres    false    227            �           0    0    m_course_course_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.m_course_course_id_seq', 26, true);
            public       postgres    false    229            �           0    0    m_department_department_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.m_department_department_id_seq', 1, false);
            public       postgres    false    231            �           0    0 (   m_education_level_education_level_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.m_education_level_education_level_id_seq', 1, false);
            public       postgres    false    233            �           0    0    m_employee_employee_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_employee_employee_id_seq', 34, true);
            public       postgres    false    235            �           0    0    m_floor_floor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.m_floor_floor_id_seq', 1, false);
            public       postgres    false    237            �           0    0    m_kd_detail_kd_detail_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.m_kd_detail_kd_detail_id_seq', 41, true);
            public       postgres    false    240            �           0    0    m_kd_kd_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.m_kd_kd_id_seq', 51, true);
            public       postgres    false    241            �           0    0    m_kkm_kkm_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.m_kkm_kkm_id_seq', 21, true);
            public       postgres    false    243            �           0    0     m_lesson_hour_lesson_hour_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.m_lesson_hour_lesson_hour_id_seq', 2, true);
            public       postgres    false    245            �           0    0    m_parent_parent_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.m_parent_parent_id_seq', 1, true);
            public       postgres    false    247            �           0    0    m_position_position_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_position_position_id_seq', 1, false);
            public       postgres    false    249            �           0    0    m_step_study_step_study_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.m_step_study_step_study_id_seq', 1, true);
            public       postgres    false    251            �           0    0    m_student_student_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.m_student_student_id_seq', 25, true);
            public       postgres    false    253            �           0    0     m_study_group_study_group_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.m_study_group_study_group_id_seq', 2, true);
            public       postgres    false    255            �           0    0    m_unit_unit_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.m_unit_unit_id_seq', 2, true);
            public       postgres    false    257            �           0    0    m_unit_year_unit_year_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.m_unit_year_unit_year_id_seq', 1, true);
            public       postgres    false    259            �           0    0    menu_menu_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.menu_menu_id_seq', 105, true);
            public       postgres    false    261            �           0    0    migrations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.migrations_id_seq', 120, true);
            public       postgres    false    263            �           0    0    observasi_observasi_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.observasi_observasi_id_seq', 10294, true);
            public       postgres    false    267            �           0    0    parlookup_parlookup_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.parlookup_parlookup_id_seq', 74, true);
            public       postgres    false    269            �           0    0    pd_pd_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.pd_pd_id_seq', 60, true);
            public       postgres    false    272            �           0    0    permissions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.permissions_id_seq', 329, true);
            public       postgres    false    274            �           0    0    personality_personality_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.personality_personality_id_seq', 354, true);
            public       postgres    false    276            �           0    0 (   physical_student_physical_student_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.physical_student_physical_student_id_seq', 878, true);
            public       postgres    false    278            �           0    0    prestation_prestation_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.prestation_prestation_id_seq', 364, true);
            public       postgres    false    280            �           0    0    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.quiz_per_kd_quiz_per_kd_id_seq', 46, true);
            public       postgres    false    282            �           0    0    raport_pts_raport_pts_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.raport_pts_raport_pts_id_seq', 1010, true);
            public       postgres    false    285            �           0    0    raport_raport_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.raport_raport_id_seq', 3474, true);
            public       postgres    false    286            �           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
            public       postgres    false    289            �           0    0 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.setting_daily_exercise_setting_daily_exercise_id_seq', 296, true);
            public       postgres    false    291            �           0    0 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.structure_tematic_detail_structure_tematic_detail_id_seq', 81, true);
            public       postgres    false    294            �           0    0 *   structure_tematic_structure_tematic_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.structure_tematic_structure_tematic_id_seq', 12, true);
            public       postgres    false    295            �           0    0 .   study_group_setting_study_group_setting_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.study_group_setting_study_group_setting_id_seq', 19, true);
            public       postgres    false    297            �           0    0    summary_kd_summary_kd_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.summary_kd_summary_kd_id_seq', 302, true);
            public       postgres    false    299            �           0    0 "   summary_skill_summary_skill_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.summary_skill_summary_skill_id_seq', 307, true);
            public       postgres    false    301            �           0    0 &   summary_tematic_summary_tematic_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.summary_tematic_summary_tematic_id_seq', 1167, true);
            public       postgres    false    303            �           0    0    tahfizh_tahfizh_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tahfizh_tahfizh_id_seq', 225, true);
            public       postgres    false    305            �           0    0    tahsin_tahsin_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tahsin_tahsin_id_seq', 335, true);
            public       postgres    false    307            �           0    0     teacher_note_teacher_note_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.teacher_note_teacher_note_id_seq', 8, true);
            public       postgres    false    309            �           0    0 &   teacher_setting_teacher_setting_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.teacher_setting_teacher_setting_id_seq', 9, true);
            public       postgres    false    311            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 78, true);
            public       postgres    false    313            j           2606    32587    absensi absensi_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_pkey PRIMARY KEY (absensi_id);
 >   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_pkey;
       public         postgres    false    196            l           2606    32589     class_advisor class_advisor_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_pkey PRIMARY KEY (class_advisor_id);
 J   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_pkey;
       public         postgres    false    198            n           2606    32591 "   course_setting course_setting_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_pkey PRIMARY KEY (course_setting_id);
 L   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_pkey;
       public         postgres    false    200            p           2606    32593 "   daily_exercise dialy_exercise_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT dialy_exercise_pkey PRIMARY KEY (daily_exercise_id);
 L   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT dialy_exercise_pkey;
       public         postgres    false    202            r           2606    32595 .   daily_exercise_skill dialy_exercise_skill_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT dialy_exercise_skill_pkey PRIMARY KEY (daily_exercise_skill_id);
 X   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT dialy_exercise_skill_pkey;
       public         postgres    false    203            t           2606    32597     employee_unit employee_unit_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_pkey PRIMARY KEY (employee_unit_id);
 J   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_pkey;
       public         postgres    false    206            v           2606    32599 $   extracurricular extracurricular_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_pkey PRIMARY KEY (extracurricular_id);
 N   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_pkey;
       public         postgres    false    208            x           2606    32601 "   friendly_value friendly_value_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_pkey PRIMARY KEY (friendly_value_id);
 L   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_pkey;
       public         postgres    false    210            z           2606    32603 "   input_analysis input_analysis_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_pkey PRIMARY KEY (input_analysis_id);
 L   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_pkey;
       public         postgres    false    212            |           2606    32605 ,   input_analysis_tema input_analysis_tema_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_pkey PRIMARY KEY (input_analysis_tema_id);
 V   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_pkey;
       public         postgres    false    214            ~           2606    32607    institution institution_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (institution_id);
 F   ALTER TABLE ONLY public.institution DROP CONSTRAINT institution_pkey;
       public         postgres    false    216            �           2606    32609 .   list_question_per_kd list_question_per_kd_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_kd
    ADD CONSTRAINT list_question_per_kd_pkey PRIMARY KEY (list_question_per_kd_id);
 X   ALTER TABLE ONLY public.list_question_per_kd DROP CONSTRAINT list_question_per_kd_pkey;
       public         postgres    false    218            �           2606    32611 2   list_question_per_tema list_question_per_tema_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_tema
    ADD CONSTRAINT list_question_per_tema_pkey PRIMARY KEY (list_question_per_tema_id);
 \   ALTER TABLE ONLY public.list_question_per_tema DROP CONSTRAINT list_question_per_tema_pkey;
       public         postgres    false    220            �           2606    32613    m_building m_building_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_building
    ADD CONSTRAINT m_building_pkey PRIMARY KEY (building_id);
 D   ALTER TABLE ONLY public.m_building DROP CONSTRAINT m_building_pkey;
       public         postgres    false    222            �           2606    32615     m_class_grade m_class_grade_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_class_grade
    ADD CONSTRAINT m_class_grade_pkey PRIMARY KEY (class_grade_id);
 J   ALTER TABLE ONLY public.m_class_grade DROP CONSTRAINT m_class_grade_pkey;
       public         postgres    false    224            �           2606    32617    m_class_room m_class_room_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_pkey PRIMARY KEY (class_room_id);
 H   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_pkey;
       public         postgres    false    226            �           2606    32619    m_course m_course_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.m_course
    ADD CONSTRAINT m_course_pkey PRIMARY KEY (course_id);
 @   ALTER TABLE ONLY public.m_course DROP CONSTRAINT m_course_pkey;
       public         postgres    false    228            �           2606    32621    m_department m_department_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_department
    ADD CONSTRAINT m_department_pkey PRIMARY KEY (department_id);
 H   ALTER TABLE ONLY public.m_department DROP CONSTRAINT m_department_pkey;
       public         postgres    false    230            �           2606    32623 (   m_education_level m_education_level_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.m_education_level
    ADD CONSTRAINT m_education_level_pkey PRIMARY KEY (education_level_id);
 R   ALTER TABLE ONLY public.m_education_level DROP CONSTRAINT m_education_level_pkey;
       public         postgres    false    232            �           2606    32625    m_employee m_employee_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_pkey PRIMARY KEY (employee_id);
 D   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_pkey;
       public         postgres    false    234            �           2606    32627    m_floor m_floor_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.m_floor
    ADD CONSTRAINT m_floor_pkey PRIMARY KEY (floor_id);
 >   ALTER TABLE ONLY public.m_floor DROP CONSTRAINT m_floor_pkey;
       public         postgres    false    236            �           2606    32629    m_kd_detail m_kd_detail_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_pkey PRIMARY KEY (kd_detail_id);
 F   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_pkey;
       public         postgres    false    239            �           2606    32631    m_kd m_kd_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_pkey PRIMARY KEY (kd_id);
 8   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_pkey;
       public         postgres    false    238            �           2606    32633    m_kkm m_kkm_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_pkey PRIMARY KEY (kkm_id);
 :   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_pkey;
       public         postgres    false    242            �           2606    32635     m_lesson_hour m_lesson_hour_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_lesson_hour
    ADD CONSTRAINT m_lesson_hour_pkey PRIMARY KEY (lesson_hour_id);
 J   ALTER TABLE ONLY public.m_lesson_hour DROP CONSTRAINT m_lesson_hour_pkey;
       public         postgres    false    244            �           2606    32637    m_parent m_parent_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_pkey PRIMARY KEY (parent_id);
 @   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_pkey;
       public         postgres    false    246            �           2606    32639    m_position m_position_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_position
    ADD CONSTRAINT m_position_pkey PRIMARY KEY (position_id);
 D   ALTER TABLE ONLY public.m_position DROP CONSTRAINT m_position_pkey;
       public         postgres    false    248            �           2606    32641    m_step_study m_step_study_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_step_study
    ADD CONSTRAINT m_step_study_pkey PRIMARY KEY (step_study_id);
 H   ALTER TABLE ONLY public.m_step_study DROP CONSTRAINT m_step_study_pkey;
       public         postgres    false    250            �           2606    32643    m_student m_student_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_pkey PRIMARY KEY (student_id);
 B   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_pkey;
       public         postgres    false    252            �           2606    32645     m_study_group m_study_group_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_pkey PRIMARY KEY (study_group_id);
 J   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_pkey;
       public         postgres    false    254            �           2606    32647    m_unit m_unit_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.m_unit
    ADD CONSTRAINT m_unit_pkey PRIMARY KEY (unit_id);
 <   ALTER TABLE ONLY public.m_unit DROP CONSTRAINT m_unit_pkey;
       public         postgres    false    256            �           2606    32649    m_unit_year m_unit_year_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_unit_year
    ADD CONSTRAINT m_unit_year_pkey PRIMARY KEY (unit_year_id);
 F   ALTER TABLE ONLY public.m_unit_year DROP CONSTRAINT m_unit_year_pkey;
       public         postgres    false    258            �           2606    32651    menu menu_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public         postgres    false    260            �           2606    32653    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public         postgres    false    262            �           2606    32655 0   model_has_permissions model_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);
 Z   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_pkey;
       public         postgres    false    264    264    264            �           2606    32657 $   model_has_roles model_has_roles_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);
 N   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_pkey;
       public         postgres    false    265    265    265            �           2606    32659    observasi observasi_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_pkey PRIMARY KEY (observasi_id);
 B   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_pkey;
       public         postgres    false    266            �           2606    32661    parlookup parlookup_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.parlookup
    ADD CONSTRAINT parlookup_pkey PRIMARY KEY (parlookup_id);
 B   ALTER TABLE ONLY public.parlookup DROP CONSTRAINT parlookup_pkey;
       public         postgres    false    268            �           2606    32663 
   pd pd_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_pkey PRIMARY KEY (pd_id);
 4   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_pkey;
       public         postgres    false    271            �           2606    32665    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public         postgres    false    273            �           2606    32667    personality personality_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_pkey PRIMARY KEY (personality_id);
 F   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_pkey;
       public         postgres    false    275            �           2606    32669 &   physical_student physical_student_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_pkey PRIMARY KEY (physical_student_id);
 P   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_pkey;
       public         postgres    false    277            �           2606    32671    prestation prestation_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_pkey PRIMARY KEY (prestation_id);
 D   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_pkey;
       public         postgres    false    279            �           2606    32673    quiz_per_kd quiz_per_kd_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_pkey PRIMARY KEY (quiz_per_kd_id);
 F   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_pkey;
       public         postgres    false    281            �           2606    32675    raport raport_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_pkey PRIMARY KEY (raport_id);
 <   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_pkey;
       public         postgres    false    283            �           2606    32677    raport_pts raport_pts_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_pkey PRIMARY KEY (raport_pts_id);
 D   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_pkey;
       public         postgres    false    284            �           2606    32679 .   role_has_permissions role_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);
 X   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_pkey;
       public         postgres    false    287    287            �           2606    32681    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    288            �           2606    32683 2   setting_daily_exercise setting_daily_exercise_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_pkey PRIMARY KEY (setting_daily_exercise_id);
 \   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_pkey;
       public         postgres    false    290            �           2606    32685 6   structure_tematic_detail structure_tematic_detail_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_pkey PRIMARY KEY (structure_tematic_detail_id);
 `   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_pkey;
       public         postgres    false    293            �           2606    32687 (   structure_tematic structure_tematic_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_pkey PRIMARY KEY (structure_tematic_id);
 R   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_pkey;
       public         postgres    false    292            �           2606    32689 ,   study_group_setting study_group_setting_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_pkey PRIMARY KEY (study_group_setting_id);
 V   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_pkey;
       public         postgres    false    296            �           2606    32691    summary_kd summary_kd_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_pkey PRIMARY KEY (summary_kd_id);
 D   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_pkey;
       public         postgres    false    298            �           2606    32693     summary_skill summary_skill_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_pkey PRIMARY KEY (summary_skill_id);
 J   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_pkey;
       public         postgres    false    300            �           2606    32695 $   summary_tematic summary_tematic_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_pkey PRIMARY KEY (summary_tematic_id);
 N   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_pkey;
       public         postgres    false    302            �           2606    32697    tahfizh tahfizh_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_pkey PRIMARY KEY (tahfizh_id);
 >   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_pkey;
       public         postgres    false    304            �           2606    32699    tahsin tahsin_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_pkey PRIMARY KEY (tahsin_id);
 <   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_pkey;
       public         postgres    false    306            �           2606    32701    teacher_note teacher_note_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_pkey PRIMARY KEY (teacher_note_id);
 H   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_pkey;
       public         postgres    false    308            �           2606    32703 $   teacher_setting teacher_setting_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_pkey PRIMARY KEY (teacher_setting_id);
 N   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_pkey;
       public         postgres    false    310            �           2606    32705    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    312            �           1259    32706 /   model_has_permissions_model_id_model_type_index    INDEX     �   CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);
 C   DROP INDEX public.model_has_permissions_model_id_model_type_index;
       public         postgres    false    264    264            �           1259    32707 )   model_has_roles_model_id_model_type_index    INDEX     u   CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);
 =   DROP INDEX public.model_has_roles_model_id_model_type_index;
       public         postgres    false    265    265            �           1259    32708    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public         postgres    false    270            �           1259    32709    permissions_menu_id_index    INDEX     T   CREATE INDEX permissions_menu_id_index ON public.permissions USING btree (menu_id);
 -   DROP INDEX public.permissions_menu_id_index;
       public         postgres    false    273            �           2606    32710 %   absensi absensi_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_step_study_id_foreign;
       public       postgres    false    196    3488    250            �           2606    32715 "   absensi absensi_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_student_id_foreign;
       public       postgres    false    196    3490    252            �           2606    32720 /   class_advisor class_advisor_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_employee_id_foreign;
       public       postgres    false    234    198    3472            �           2606    32725 2   class_advisor class_advisor_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_study_group_id_foreign;
       public       postgres    false    198    254    3492            �           2606    32730 0   class_advisor class_advisor_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_unit_year_id_foreign;
       public       postgres    false    198    258    3496            �           2606    32735 /   course_setting course_setting_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_course_id_foreign;
       public       postgres    false    228    200    3466            �           2606    32740 4   course_setting course_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_study_group_id_foreign;
       public       postgres    false    254    200    3492            �           2606    32745 2   course_setting course_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_unit_year_id_foreign;
       public       postgres    false    258    3496    200            �           2606    32750 ?   daily_exercise_skill daily_exercise_skill_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_step_study_id_foreign;
       public       postgres    false    203    3488    250            �           2606    32755 3   daily_exercise daily_exercise_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_step_study_id_foreign;
       public       postgres    false    3488    250    202            �           2606    32760 2   daily_exercise dialy_exercise_kd_detail_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT dialy_exercise_kd_detail_id_foreign FOREIGN KEY (kd_detail_id) REFERENCES public.m_kd_detail(kd_detail_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT dialy_exercise_kd_detail_id_foreign;
       public       postgres    false    239    3478    202            �           2606    32765 7   daily_exercise_skill dialy_exercise_skill_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT dialy_exercise_skill_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT dialy_exercise_skill_kd_id_foreign;
       public       postgres    false    3476    238    203            �           2606    32770 <   daily_exercise_skill dialy_exercise_skill_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT dialy_exercise_skill_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT dialy_exercise_skill_student_id_foreign;
       public       postgres    false    203    252    3490            �           2606    32775 :   daily_exercise dialy_exercise_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT dialy_exercise_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT dialy_exercise_structure_tematic_id_foreign;
       public       postgres    false    3536    202    292            �           2606    32780 0   daily_exercise dialy_exercise_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT dialy_exercise_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT dialy_exercise_student_id_foreign;
       public       postgres    false    3490    252    202            �           2606    32785 /   employee_unit employee_unit_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_employee_id_foreign;
       public       postgres    false    3472    234    206            �           2606    32790 +   employee_unit employee_unit_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_unit_id_foreign;
       public       postgres    false    256    206    3494            �           2606    32795 5   extracurricular extracurricular_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_step_study_id_foreign;
       public       postgres    false    208    3488    250            �           2606    32800 2   extracurricular extracurricular_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_student_id_foreign;
       public       postgres    false    252    3490    208            �           2606    32805 3   friendly_value friendly_value_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_step_study_id_foreign;
       public       postgres    false    250    3488    210            �           2606    32810 0   friendly_value friendly_value_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_student_id_foreign;
       public       postgres    false    3490    252    210            �           2606    32815 +   input_analysis input_analysis_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_kd_id_foreign;
       public       postgres    false    212    238    3476            �           2606    32820 3   input_analysis input_analysis_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_step_study_id_foreign;
       public       postgres    false    250    3488    212            �           2606    32825 0   input_analysis input_analysis_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_student_id_foreign;
       public       postgres    false    3490    212    252            �           2606    32830 5   input_analysis_tema input_analysis_tema_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_kd_id_foreign;
       public       postgres    false    214    3476    238            �           2606    32835 D   input_analysis_tema input_analysis_tema_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_structure_tematic_id_foreign;
       public       postgres    false    214    292    3536            �           2606    32840 :   input_analysis_tema input_analysis_tema_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_student_id_foreign;
       public       postgres    false    214    3490    252                        2606    32845 @   list_question_per_kd list_question_per_kd_quiz_per_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_kd
    ADD CONSTRAINT list_question_per_kd_quiz_per_kd_id_foreign FOREIGN KEY (quiz_per_kd_id) REFERENCES public.quiz_per_kd(quiz_per_kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.list_question_per_kd DROP CONSTRAINT list_question_per_kd_quiz_per_kd_id_foreign;
       public       postgres    false    281    218    3524                       2606    32850 Q   list_question_per_tema list_question_per_tema_structure_tematic_detail_id_foreign    FK CONSTRAINT       ALTER TABLE ONLY public.list_question_per_tema
    ADD CONSTRAINT list_question_per_tema_structure_tematic_detail_id_foreign FOREIGN KEY (structure_tematic_detail_id) REFERENCES public.structure_tematic_detail(structure_tematic_detail_id) ON UPDATE CASCADE ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.list_question_per_tema DROP CONSTRAINT list_question_per_tema_structure_tematic_detail_id_foreign;
       public       postgres    false    293    3538    220                       2606    32855 +   m_class_grade m_class_grade_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_grade
    ADD CONSTRAINT m_class_grade_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_class_grade DROP CONSTRAINT m_class_grade_unit_id_foreign;
       public       postgres    false    256    224    3494                       2606    32860 *   m_class_room m_class_room_floor_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_floor_id_foreign FOREIGN KEY (floor_id) REFERENCES public.m_floor(floor_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_floor_id_foreign;
       public       postgres    false    236    226    3474                       2606    32865 )   m_class_room m_class_room_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_unit_id_foreign;
       public       postgres    false    226    256    3494                       2606    32870 )   m_employee m_employee_position_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_position_id_foreign FOREIGN KEY (position_id) REFERENCES public.m_position(position_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_position_id_foreign;
       public       postgres    false    248    3486    234                       2606    32875 %   m_employee m_employee_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_user_id_foreign;
       public       postgres    false    312    234    3556                       2606    32880 #   m_floor m_floor_building_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_floor
    ADD CONSTRAINT m_floor_building_id_foreign FOREIGN KEY (building_id) REFERENCES public.m_building(building_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_floor DROP CONSTRAINT m_floor_building_id_foreign;
       public       postgres    false    222    236    3460                       2606    32885    m_kd m_kd_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_course_id_foreign;
       public       postgres    false    228    3466    238                       2606    32890 %   m_kd_detail m_kd_detail_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_kd_id_foreign;
       public       postgres    false    238    3476    239                       2606    32895 -   m_kd_detail m_kd_detail_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_step_study_id_foreign;
       public       postgres    false    250    3488    239            	           2606    32900    m_kd m_kd_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_unit_id_foreign;
       public       postgres    false    238    3494    256            
           2606    32905    m_kd m_kd_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_unit_year_id_foreign;
       public       postgres    false    258    3496    238                       2606    33247 "   m_kkm m_kkm_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_class_grade_id_foreign;
       public       postgres    false    3462    224    242                       2606    32910    m_kkm m_kkm_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_course_id_foreign;
       public       postgres    false    228    3466    242                       2606    32915 !   m_kkm m_kkm_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_step_study_id_foreign;
       public       postgres    false    250    242    3488                       2606    32920 $   m_parent m_parent_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_student_id_foreign;
       public       postgres    false    252    246    3490                       2606    32925 !   m_parent m_parent_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_user_id_foreign;
       public       postgres    false    3556    246    312                       2606    32930 +   m_position m_position_department_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_position
    ADD CONSTRAINT m_position_department_id_foreign FOREIGN KEY (department_id) REFERENCES public.m_department(department_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_position DROP CONSTRAINT m_position_department_id_foreign;
       public       postgres    false    248    230    3468                       2606    32935 .   m_step_study m_step_study_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_step_study
    ADD CONSTRAINT m_step_study_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.m_step_study DROP CONSTRAINT m_step_study_unit_year_id_foreign;
       public       postgres    false    250    3496    258                       2606    32940 *   m_student m_student_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_class_grade_id_foreign;
       public       postgres    false    224    3462    252                       2606    32945 #   m_student m_student_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_unit_id_foreign;
       public       postgres    false    3494    252    256                       2606    32950 #   m_student m_student_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_user_id_foreign;
       public       postgres    false    3556    252    312                       2606    32955 2   m_study_group m_study_group_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_class_grade_id_foreign;
       public       postgres    false    3462    254    224                       2606    32960 1   m_study_group m_study_group_class_room_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_class_room_id_foreign FOREIGN KEY (class_room_id) REFERENCES public.m_class_room(class_room_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_class_room_id_foreign;
       public       postgres    false    3464    254    226                       2606    32965 +   m_study_group m_study_group_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_unit_id_foreign;
       public       postgres    false    3494    256    254                       2606    32970 (   m_unit m_unit_education_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_unit
    ADD CONSTRAINT m_unit_education_level_id_foreign FOREIGN KEY (education_level_id) REFERENCES public.m_education_level(education_level_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.m_unit DROP CONSTRAINT m_unit_education_level_id_foreign;
       public       postgres    false    3470    232    256                       2606    32975 '   m_unit_year m_unit_year_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_unit_year
    ADD CONSTRAINT m_unit_year_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.m_unit_year DROP CONSTRAINT m_unit_year_unit_id_foreign;
       public       postgres    false    3494    256    258                       2606    32980 A   model_has_permissions model_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_permission_id_foreign;
       public       postgres    false    3516    264    273                       2606    32985 /   model_has_roles model_has_roles_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_role_id_foreign;
       public       postgres    false    288    265    3532                       2606    32990 )   observasi observasi_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_step_study_id_foreign;
       public       postgres    false    250    266    3488                       2606    32995 &   observasi observasi_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_student_id_foreign;
       public       postgres    false    252    3490    266                        2606    33000 #   parlookup parlookup_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.parlookup
    ADD CONSTRAINT parlookup_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.parlookup DROP CONSTRAINT parlookup_unit_id_foreign;
       public       postgres    false    268    3494    256            !           2606    33005    pd pd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_step_study_id_foreign;
       public       postgres    false    250    3488    271            "           2606    33010    pd pd_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_student_id_foreign;
       public       postgres    false    252    271    3490            #           2606    33015 '   permissions permissions_menu_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menu(menu_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_menu_id_foreign;
       public       postgres    false    3498    273    260            $           2606    33020 -   personality personality_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_step_study_id_foreign;
       public       postgres    false    250    3488    275            %           2606    33025 *   personality personality_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_student_id_foreign;
       public       postgres    false    275    3490    252            &           2606    33030 7   physical_student physical_student_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_step_study_id_foreign;
       public       postgres    false    277    3488    250            '           2606    33035 4   physical_student physical_student_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_student_id_foreign;
       public       postgres    false    3490    277    252            (           2606    33040 +   prestation prestation_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_step_study_id_foreign;
       public       postgres    false    279    3488    250            )           2606    33045 (   prestation prestation_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_student_id_foreign;
       public       postgres    false    279    3490    252            *           2606    33050 %   quiz_per_kd quiz_per_kd_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_kd_id_foreign;
       public       postgres    false    281    3476    238            +           2606    33055 -   quiz_per_kd quiz_per_kd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_step_study_id_foreign;
       public       postgres    false    281    3488    250            ,           2606    33060    raport raport_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_course_id_foreign;
       public       postgres    false    3466    283    228            /           2606    33065 '   raport_pts raport_pts_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_course_id_foreign;
       public       postgres    false    3466    284    228            0           2606    33070 +   raport_pts raport_pts_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_step_study_id_foreign;
       public       postgres    false    250    3488    284            1           2606    33075 (   raport_pts raport_pts_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_student_id_foreign;
       public       postgres    false    3490    252    284            -           2606    33080 #   raport raport_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_step_study_id_foreign;
       public       postgres    false    250    283    3488            .           2606    33085     raport raport_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_student_id_foreign;
       public       postgres    false    3490    252    283            2           2606    33090 ?   role_has_permissions role_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_permission_id_foreign;
       public       postgres    false    287    3516    273            3           2606    33095 9   role_has_permissions role_has_permissions_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_role_id_foreign;
       public       postgres    false    288    287    3532            4           2606    33100 ;   setting_daily_exercise setting_daily_exercise_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_kd_id_foreign;
       public       postgres    false    238    290    3476            5           2606    33105 C   setting_daily_exercise setting_daily_exercise_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 m   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_step_study_id_foreign;
       public       postgres    false    3488    290    250            8           2606    33110 ?   structure_tematic_detail structure_tematic_detail_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_kd_id_foreign;
       public       postgres    false    238    3476    293            9           2606    33115 N   structure_tematic_detail structure_tematic_detail_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 x   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_structure_tematic_id_foreign;
       public       postgres    false    292    3536    293            6           2606    33120 9   structure_tematic structure_tematic_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_step_study_id_foreign;
       public       postgres    false    292    250    3488            7           2606    33125 :   structure_tematic structure_tematic_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_study_group_id_foreign;
       public       postgres    false    254    292    3492            :           2606    33130 :   study_group_setting study_group_setting_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_student_id_foreign;
       public       postgres    false    252    296    3490            ;           2606    33135 >   study_group_setting study_group_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_study_group_id_foreign;
       public       postgres    false    254    296    3492            <           2606    33140 <   study_group_setting study_group_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_unit_year_id_foreign;
       public       postgres    false    3496    258    296            =           2606    33145 #   summary_kd summary_kd_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_kd_id_foreign;
       public       postgres    false    298    3476    238            >           2606    33150 +   summary_kd summary_kd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_step_study_id_foreign;
       public       postgres    false    3488    298    250            ?           2606    33155 (   summary_kd summary_kd_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_student_id_foreign;
       public       postgres    false    298    252    3490            @           2606    33160 )   summary_skill summary_skill_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_kd_id_foreign;
       public       postgres    false    300    3476    238            A           2606    33165 1   summary_skill summary_skill_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_step_study_id_foreign;
       public       postgres    false    250    3488    300            B           2606    33170 .   summary_skill summary_skill_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_student_id_foreign;
       public       postgres    false    3490    300    252            C           2606    33175 -   summary_tematic summary_tematic_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_kd_id_foreign;
       public       postgres    false    302    238    3476            D           2606    33180 5   summary_tematic summary_tematic_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_step_study_id_foreign;
       public       postgres    false    302    3488    250            E           2606    33185 <   summary_tematic summary_tematic_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_structure_tematic_id_foreign;
       public       postgres    false    3536    292    302            F           2606    33190 2   summary_tematic summary_tematic_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_student_id_foreign;
       public       postgres    false    302    3490    252            G           2606    33195 %   tahfizh tahfizh_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_step_study_id_foreign;
       public       postgres    false    3488    250    304            H           2606    33200 "   tahfizh tahfizh_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_student_id_foreign;
       public       postgres    false    3490    252    304            I           2606    33205 #   tahsin tahsin_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_step_study_id_foreign;
       public       postgres    false    250    3488    306            J           2606    33210     tahsin tahsin_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_student_id_foreign;
       public       postgres    false    306    3490    252            K           2606    33215 /   teacher_note teacher_note_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_step_study_id_foreign;
       public       postgres    false    3488    250    308            L           2606    33220 ,   teacher_note teacher_note_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_student_id_foreign;
       public       postgres    false    3490    252    308            M           2606    33225 1   teacher_setting teacher_setting_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_course_id_foreign;
       public       postgres    false    228    3466    310            N           2606    33230 3   teacher_setting teacher_setting_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_employee_id_foreign;
       public       postgres    false    310    234    3472            O           2606    33235 6   teacher_setting teacher_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_study_group_id_foreign;
       public       postgres    false    310    3492    254            P           2606    33240 4   teacher_setting teacher_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_unit_year_id_foreign;
       public       postgres    false    258    310    3496            �   �   x���;� �ٜ"H���e̒%k���,i#	�?�B8C���cF�e&��T�Uc��V.V�����:��t�uXF [���SR�^�=%�x���L�rO����C'P�����X��M�%�z��ڎn�_B?�<��D�Q�>r�BӍ��      �   D   x�3�46�As3N##]c]Cc+cS+Cs�?8��46�4BQk�`hiedhe`��6F��� A�      �   l   x�����0����4��nH�E\�_���8���a�
!��#m*��X�:�to� q"��Mh}�:��w�?�gx8�?���7ȼpx��{F��k�|[RJ_!�6      �   |   x��ұ�@��?Ep J�ֿ�02�FR�J�O\e ��*��DC%�x��x��~���nn�����4.���X�G�,
)	a�.
��� E�^�����"���̰J��/d-�h      �      x������ � �      �      x������ � �      �   �   x����
�0���S�,�3�V�ҥg�������߳�7�!C���]B.��@ݴ����t�տl�~��A}�q��>u��kG�����4>�6�V�q�_.�H5ZQ�Ckj��D5O�SM4���&*x���x��F<�D�]	�(<,a��%l��Mޖpcw��L�oˆ��۲!p<����gQU~� �ڟ�s_!D�      �   �   x���;
�PD�y�p��y/1)� �4-�u���+��pOs8>��1���c�������q���֙w1,���o�_	C/ЎA�'�N�]�&�T�N�!���N�U��](.�]H.�]h.�]�.�]�.+_�!��G�-�R��*>      �   !  x���=�SAE�س
60���ߋ`��D�D��=�UWL@�G~�e�K������h����y��������ŋ��2_}|q{���~~���K�};���NdG9v1k�nf�X+���p������1�e�F\���q^��k�};�f��f\��k��}N����OY_�~��,�i���#���Md;�sL7�5BGP't���������n��)�%�[2rL�d�,���5Y\��k�����{�4�\�r w��^zɕiZ9���Z�r@�Vh��Z9�S+ti�n���֢�jZ9���Zs��^�\9�=W�ȕ9s�@.�Э���V�r@M+Եr@�Vh���Z9�C+tj�.�Э���^r��^Z�HϕYs�@�\9�]+th�N�Х����{:�V�i债Vh��mZ9�]+th�~\S����R�#���	�,G."��M���r@kP#�uB{�J���C2rI3.��)�8%#��▌ӊc2rM+���5��&'״⚜\���q/Gș� re ���{���)��hU  m
�]� t(�NХ@ ��k�KQ  5PW  ��y/[Ȟ� rd �� ��V �PS  uЪ@ �@��P  �
�K� t+�ԋ�e ֽ��5d�@ �3@Щ@ �@�qOkQ  5PW  �
�M� �+�Щ@ �@wb_�V2@ZH�@ Y3@6Ю@ :@��R  �
�=�E� �@]� �*�6Ю@ :�[������/|��4      �   �   x���;�0��99(�#����K%$6`��4)Br�b+"���&t\t�������n�	�D�DP��j[��&j817��84\�86<qj��s�hԥk2�k��]��fF&L;ff�k}i�5�D�*E�*�D�*�E�*Zd�*;˨5��LZeQ��$sV�!��be���!)���!)�;%-;e-]�����R�      �   _   x�3�,I-��S�F� �!=713G/9?$DFF�ƺ�F
��VƖV�F@a.c����\�&�d�!�E�c+c1+S�W� :b#�      �   �   x��ѻ�0��Z�"8����"x�9�s�¤ A*��'�,��A ���2�&z�~���I�=�B����&��Z�\���9�'q��	q��B\73���F���J��a#^��p%^��p#t������t�      �   d   x��λ�0��:����s�C0A��D�"l)�+��W� ����5�����Z����I%��t3�n��jf8���^F�)�˰�x<O"�� Ky      �      x������ � �      �   v   x�m�;� �N�4첋JG���Xh����'۰�L2ͼb��)Ǜ�����l˞�������0:?$��,�/�E�ز�+�bC�2U��%�����XYV��r˪�Q�(6���[zk���I�      �   Z   x�}˻�0E�ڞ����:~-d�9�	Ʌ��]��ԯ/�
Z��A�婔��:����=D�G��"U�&Ck�r����|5�5i      �   �   x�}��
�P��s��0�׿�k!A�
!nfxɟH]�ӧ֢��Y���|g��-l��ҵ����u�8q�[&Z�� i��{��jU�/�*��:��s���qЪQ���y	��A�M��Iە���,�>Vy�+�W�4\(��%}�>`�0'}�{��'G���<�Va~kt�
#8v�ju]AL�����$�%&����g�      �      x������ � �      �      x������ � �      �   �   x���K
�0����@�<b+Y�q����X�[
�z~�������"�Ol3���힑���>@5����X`�k9JN>�vz�5cs�o���f3"�hD�}%���G�<��>;�"�pm����"�Mē��y�E���hzߗ�Xm�ǥ�Y�W](��Xk�      �      x������ � �      �   �  x�}��N� �볧��p�hwh����q�����Ӫ-��O/�ۢ��.(���ᤜC�#��{�/�%k��5<Π,�QF���,4��U|r�]k�>�W� ��J�.����35�	��Ri�W�sͳ�v��1����������J�72\�sb$����]��0=̎QA(Ӕk,�_\F���C;f�"Ouk7M�E�C�rn]�"�7���xo�_u��c��(���Tĭ��� �;�.mg�z��̥t��}ڦ�ߵ��<ɲ�����d�2+m\��:����}'����21+�nZ�
l����5�uq'�,1da!�
#ӊr[�"tv�u$tM�a2^�iF��ᰪ?�w_wIu(��Zˆ�p���R�.f�fB��Y����`�c+c&��h0� ��
�      �   �   x����	1�ge�[ Ŷ�?�	n�9�B)䮅�?����E�01�¬<�������M�������P
X�P+U�^�b!�Y�P�/��2�p�Q�p��:\6i�&�`ߤ~}���R��J�{�~�g����EΓ|�I��-y>RJ/�7h�      �   f   x��ι�0�Z�"8���Cd�?G�*��`��Pu�x�)	=�\*K� �|��Pc�4�H��8��D���_:f�Ũ�ڿ@�S9��Fڌ_�>m      �   k   x�3�v����4��J�U(H�I�J,J��40�26�20�4��2b�@Ȑ����R��P��L������*F\FP��&fg�%f$� 2��xL��21B11F��� I%�      �   4   x�3�42�4������12020064300�LL.�,K��#q��qqq ���      �      x������ � �          K   x�3�4�,N�M-.I-R0���420��50�50�0�t�9�K2�R9ab��Ff
V&&V� ]0����� c��         �  x���˒�8�׮��@�n���	l@�-������E�\z�����ȴ����H)m�����U�"�VF������%���[Q�$W��c���qJ͒�Kj�}�F
[�]JlN�m��*�7B%��w�IY�!ɱ*��@V�X�r�ֶ��-I���$�=�fA�{����	��6C��Lp�}!�Є+���/,�3!5K>?xW7�b[6.�����w�0=�?�%KƖ\F�Q�M�W���9,����ᒅMw�t�����2�K*:��9���ĝ:�<���mG}�.�p��G��3�b!�Ƥ1x��"�+�H�����m����Yۺ�{T�;[`�w~��)�m�ڲ��%G.웝�Ak67�Y�j�xt�'�Y�@�!K��Ꙧ�w��ܰX�I��"e��A�L	�&�d�%d�q�wO�Η��9;���*��k�y!���LC�������ܔg\z�y'M Y�������L]'SF4�J]����KQU� CbTBcAE��3.�L���K<�4���T��lVv����Xm��j�/��{{+Nq����&��۴9�f�����C��e��Xz�Bi�l�sJ��P�UVC��cvg��P#��d2�q,�;�^15CNK)��'��p>N��%�q�F�KK�vwiSW����wl�C᰹ې��@C� �L̐��y�>z�^�7X�2X1�hw!��L�Aa��O&
�.+]�%��c���EE��W��O�o�	)۷�ja�6�t��� ۺge�O�=F������&9���ƝCo]/<�ƨ�fiF���R�D�Qt fp�JF��*�h��d]�۠s���X|�%G�E�~��n��Yޥ�!�q�r if�<)��%����:����3��Ś��4hբ�E�/��n.����Ҍ3�	e�Z��� �3Ʃ��OD5��]-		0�G��v�vY^n{}��I��%��֖�C���,��ǜ���Q��
睽;��gvƑ�c[���of�d*?�8<���R��I�v_�@�k>+W�4����(2���F�����˞�;�����ӓ3�p�NP>5��E���%�c����w9`<���H�6
|�)�}���'���́$�4*��c��h�՚DpM*�H�ȘÑ>����A��,�.;A�JQ}����{%8m|������,9D�6p�MNA�W���*�o�f���4�{�2%�jTf�h�1�i���q)��b���J/6=��o6Xow=\^�{�nJ�nBi��6ٯ�,��r>5������|y�(�A�)�-��S�*�믃�\)>dӯ����Tj$
�̚Q���?F6�f�R<�f�|���w)�Z�2�Q;�j�/#��6U���bwH�בp21�I��cC��E[��L<K�d7Q�Tp3�B/���!*t,g�8,E�	\��xpr�N����]�˿N���x��SW ,=��z�$��������H��ψ�*�c�'pŨ۰�7���ȉs���DO��]��J���G� u� E�wU�����[߂�����Uπ+�|��'FN��x���ؐ!EW�����A���Ůd����$IB��1L�I���v�������{�C���&�����M��3'\ų������P,I]^\��'f�CƁ:�Pak�v5��u�.����]��q����J�9��X�kS#�	�'�}��`X��&x��`���Y����@yk}�ȩe6�p���z�e�׃��/�=�5	7����i�����=m��bE֭o�0??U���OX�x��LiTq>�M�މ��}x��T����Wz�c�������^�/�˛�D�6�	n��
��O��x��604�RQޮ\��1�����X�� $� X��{|���m��\����r�Q�R'�O�P�By���X+3�m�̒8��wU�{�5����46d�~��j8�e�z�ǿ���S�(������3��o�����?�0�4���?��1w����?��kv��]K�1�-�l���}���� {~         o   x�-��
�0D��+�����I'���Nu`)���hH�������MY�o��L�ݽ]� �X�V#$I�L�0$�$�e񵡭����I�\WU���bU}C;�k�x��*         �   x�m��
�@F�w�b^�eg˟ݫ�$T�H��fK��4Ѽ���,��������)��n�C
;�����`��ݚ�;�A���{h�M=t��m�#��McU����C��a���L��!��h	��l����P1�<��'?��)R
9�va�%p�p�P��F)}'�;         V   x�3�4�LL.�,K�420��7202�4�1~ ��Q�����X��� R��� V�quu��̭LM����B������ ��
      
   w  x���Y��6���_!��[��������.v��l˒�#���;CJ�D�ȓ�����3\�ɻ�����d���qʲ;��X2�s�Gl%��r��O��<����Uԗ���Z;�$��\n0"�)b�Rt�*<���IW�&Q��\���\��Y�����UuV���P�T_���$	��ye�Ⱦ�^Ϫt�:<~����ڪ�&,u���,�y��S�<��UU.��닟���ʐ����6ğ��Y��箠d=4.4�@�$�W�P�d}it�������y>c�sOrW&r� *��o�s?��^_ 
g�^;A����x�ɅɌ<�J�����t?t��!z~�:������z>Y�ڄ:�C����#>��h��uh�����Z?��{l)�2d��/Un��ӗ��[?9ˡt|2$'����𗢳Ql>]����T�&'���2�˴2d�#s���d��j��A�p3�����7�y0��_�V��-�C	I�E���� )���j�(�a=�����@��E�
Ϯ�-ۧ�BW��z���A��2��Z�2ds�F�}����ӄ����PP^������1U�IZ��5�?��oe��G�n��:��F�]]A��W?4�v>��X��Z����O�3���#�(��w����['�,B4T�}6�EJ�US�}��3���:4PC���@yD�<)�q���2��]?fOc��q4����Mq��I�ze ����E]хs�S���/;(�(L0�:���[fO�!&��"��o�t��q��d�O��pREy%2Z^Ʃ�;��`�E �L)ؐ	�w����s�B�	s��2�4�-����'�-��G����֮.���k�t:��=Ԑ��2D	2���@E��*-��z�"Ωtd�-�DK�ZwŌ��=<	���ʰ�Me�Æ�{�)�i�A31:诺=�&���9[&,jP���:NW��Zui����EYΗ���B�!�v�s.�ݖKrk�z���r�}�%!�&�M�J���Y5�]����w��K��r�d�t �F;��%y��:|xx4K������B؅W��3#��+(8����2='�+��HE�����g�~�װ莚Ur�!,���~��o�p<�`���}����b[𓕶I�u��I#H�6i���l�}}jTq��X���D����n""�qr�y��W-	6�I�eo��T���4���:�c�X�o�U�K�y�����Lq�������2�fXX[���m,����0���`n9�{�1�'d�֤�Z�Yz�j��b��_�h�G�0�Xbw�B���H��?��p4�J���f`�*�ݜ� f�8�u5T�af�0��BP��,
�1��Y��g�t9����7ʒ#(Z$�>[������#0I���͑�����D[���|�I]�i��7CR���6	������D��8	I�-��MUp��-T���%��NawH�8#��wmO�����F.�æ�X���Lcfה�y�$W$s

*��9�����ϲ �x��5�~2ʝ���$\�������@x/E��k��闟�9�!-C}� ���R�ɂ�~B��� UX�^����l�FJ|��`�R���7����-�	i�u9����j��F��u����j����� �����         �  x�uXَܸ}�>�BԮ���.��=�k�dR��C�e-N4� �H$7�A��[-�����-����ݺ�14�D	�
�����y��%�a�I�rׂmAq��Iy���o�6�S;�a�,uei�Y�4��r#��ھBW�`2^!��������!3lf��,��Ft��Z��`���B/c��{a�/�W�������Z�Vm�y~�D��y~*�Ԑ�Xr�������"� �v}��y���=���TY��`Q��0�*�έ~v�8��ÆSP�!A�p��a[�n�r���
���ᑵ	6�)�����0���U��/1	�Q(���JQB?ѳ����xyn_ �Fj�U�Ġl�� *�V�[��1��b�e�B&8���N��f=�T�3�l�I��Q�Z�C����T��\�J��s�_��aK<�DG��e~|����Uz��'��q�Bfo��{��������*	��E��~T���_�Yc�&��>�E-�:R���
���Y�������uH�E
�ю��ǰ�Y'�ZS�a�D�ϰ<�u�.|t«���<y1��N0}�	L�T�<��bEl���u[�۶/���­p�U4��u�P��3������Q	�� zBa��n|���-,�a��	2��D���a;����q"�\˕Ru��>�@�P��i��6�݈�B@Uqjq����<.��?a�g�� ��vdʻ?�u��d��1%d�"�ܖ�/�p��r|*�I�	 �:��Z~t�P�]�c�Iaxjb϶�v�W@�8�j�s�ԣq��W+,����dd�0�8m3��}�C�J�iQb�t��K� �s�������nqC��N�d� �d�T�Z���x�wS�T���bZ_��Ce��L��C�)]$�ѯ�$cb���6L�D��ذ���-���o�|ٶ3�I��gTi�8�[��6�Q[(/��2l��� g&���\q]U�0=���Zya�5�K�MI�	�Y���D�w�J�|l���_2C�<.pts�����ޭ=���O�	ǰ�"��~a0�'�O{��!�C��Z���Ĩ����J���;n.+���R�*Q2T�(��x�~#Sg&ք��b�b�NkfM	�R%�Q��$�L�����D�$�a�e 
m4u�\k,�����\� sY�8Zq���u�l���^�����r��#���9Q�j?�<&���H��n�қ�N�W<K0�j�0���eai��\��ǥ�b��X�������Wg\����'6\t�KW��<����˜��@��+�1���v��qCnߔ�]��SHqT�pҕG	��y��*���r��7���R`�u#�����̫��2����v����7��̛��ej�=�=��.��T��Lč�
�;~q��=�e���4�b������������[,��|l�E^�h|�(/l)��O��	���!*���b����C	1�V����eNq��br���	L����W�>��u"ѧ	���f��9Ɯ�0C����3BI$�LP�H^�z�!C��%V���{�r6J�ƃ�[�i>�(��!��yP����G�S�1,�w߽�E�(�
T�hz>x�Kފ��n�P6Й�{ ����=m1㶵�(����H8}]�1�p�a�5}(�V�w�����5�WV���&������`���(�t	=���e.?'���_�H
�҉S:u|��t����ˎ&i���1���LL            x������ � �         /   x�3�t,(����OI�)��	-N-�4�2�"jn�]���W� �?�         �  x��ֽJ�A��zrހ���ki��Z�|�`T�$����oXY��*漅�C�"*O���"���~�y\���Z���i���O���q�c����^lt~�J�M�ҹ��A4���B��1�$�c
Y���)qפ�s�yL�=�&���]T�\Ae>�%r7��r�u|=�]�l��b��j��f��\���QP�B"p!
	��\�B.D��ЀQ���(��/� \��.�����
DÅ$ÅdÅÅT�B�@�BODa�'��D<���BOD!�'�P�Q���O���_
<����0��voO��������O����D��D��D2x"
<�
��BOD��'�0����x"

��BOD!�'���Q(��(T�D��tu|Y}�y|�q7���a,��=IαG�qE�uC�uA�u?�u=�u;�u9�� 7���ƹV0�\G�\'��\g��Xߟm6�o��Q�         �  x�}��n�0��'O�d�@�]��m��VU��JhҰ�B5XU��;`�M@�<3�����Jxk�&wP��+x�;�V�s�[���	B��j<�[�ע��"�p��>�z��N�Yi��7������,�K}(�c{V�����؞�lඑ�w�������R?�3�`K3A���P�'�6�����̜? E-̧��?pE�B143x���13��>�X#T���b�@K?�m�6W]#���WqBb�/B�j���7������xs�8�6<�3��u�<�<���S��c�.?��8I���YD[���ɚ.&"�|��1�`	9V8�D��NȂ�̚ߢ�m���Mʒ���^Ҍ���\͜�E�����l�e'�)�ihK�t4_z�h�x��e�a"�D�O��2�a�a��\?�a��p��nc���%&t��0f�Y��p��a�4ǥw!%�����'>���O�\a<%�A+�2�h)sc�\�=v�F�X�;���}�՛P.I��3��R�Юn���X:ӵB�^c}�E,�h�>��J+g�0ڳv�h8��Y�h��K�Îk��:�7�Oaf®���T�����A5�dl��h!Cd�*f����ҙ%��S�3��w�J]���,�M}ק���hk�ԓ�Ĺ����B�b��s��ƒ���-����?����=8JT�2Wl@��I��Y�ѕO��o��ӏ�j�qa<            x������ � �         �   x��ԱJD1���ܧ�V23In��>��n��Ţ�\��oo� X�H5���N��������__�x���4���I:�|,�������b���ז )�"�p�X�gH�1���l�-09�l�����1���r_\���e�V�m�������}���34�.34��34�^ghX�<4,����a�xhX�������C���ay�а|�а�yhX�=4$��CC����,ߤ�&�         `	  x����n�@��_�p��(��O.p��^������Z���}���"���Yzlax�*���U����������>�#����9�5c5��LԒׂe��D�]N�:��ʺF���-��������u�]���>A�T՜�rE5)�r���� :~{�q2~"@�3��>��c���9T$#5�j.��v�?)ɬL�Η��0k���w��9-jQ֢
�*�����tz�����"RN����w}��]	�&4*� �~���Vo� {m� %f��Ƿ��?��fUTF����p�b��f��0����>��	@���G���U3��j�X%�i�Y�s�Y֐?�O�<���deN�P&j���dRx�5.<ʚE��=��e�_���y�}����b^L�	�&�Ã���Q���(k�_�c���O�R�CUF�>�8�d�h���GY�ã�ZSO����ќð0_��g��ư@��)��"��&�|�.�=]�)�2��B-b`�Z�\���rs���>���;�jp1����00��\:�����Լ��I0�# S9����Ș�U��FR��Fr���q��27�;a}�_��K���=Gc	T�$��2�  ,_盆�?էn�ՔO�(�X�S��i-�	W�s�s��un�[����e��fU]@)����9*vRΉo��¥�	��Kno?M�}u/�?�c~My��*�c%�{�gG�(���ȉ�������>�M���2��<$d�RV�� A���c�ưa?�A���
�����>��\�T��4���鍣9���I��#I*�5��jl3,I���G˝Z;�4N�W��bn2�$uJ�ޞ��Ǻ�Z�Yp8`ST�-PR	Ţ2If,J�T|ii�Z�)ҷ�DJ�{��ogS��8T�q(��?�R��I�T�nR9����r�_b�5/�29��K�$2���D
���H	��?@��u\�&���]� � HAtA�����[����^�-�X���Z�e��uy6�-�&�e�g�gpm�������� '*�2�����ӄ�=<Oz�����GH%�����k4����q����`��G���t�=6����_����G+���{��In�����°x����7��[�C'B->���L�	��d�C���'͡��5Y�?�!���;8�s� ��Pw���M�2H���HS>��؜ M�y�D�\������s������c35]��r(nM˭�$8�y����1�vHk\�!���G�����}̈)aXUK7��Ĕ0Z�e`�'KKs~֧�
��瘑-�+:���<	w9����Ɩts�ЭoP�_�lޛ?�[=	�k�9)M��v�|��R9w��}{|��<
�9TZ�-��L�Tͮ�pnCq.A�~��0.5��5\�I�Hev�ذ����h�	�+� ���2,Ϳv�\�6���Û/�q})+�J��<�頠FO�n�g��^�hi�`�24�Q�(`�y����r��n����"H���a�p�� ���	���_��dC�HH��$ZW�0/���^���2Ɂ��-������J\�N��.|�܅iN�!�4��� PF?5W\��d`�b��[O���}7�5
.C�`2hP��L�W�����"(T��V$R�F�mv Ě���VtU���`���v
���[)��<���}�����_v�8�'�e�s��c�*S�]M��ͱ�K
g�x7�[�ۧ�k�K4��3�0��f�D�����&��o²f�	MDhiEʼ؍ݧ��I��,�m�\�������b���Un��("*S�<7 �溮��d�*ؘ�zik^߀�Su)�>�ֲR�{���_��؜a�F^�~G��8�dTV2�p_#)j$"C��@V]��L�,�ߜ[�J��떂Xu�R �����&9C��zgƗ5��@[��Ŗf�SA97Op�	nr�`P/�Mb�+���U諗�b(�r�k Ya��n|2N\�ŧ�tⓁn��Z�տ:4b��"�2��X�[��7e�M���G����L�!�ќT��Y?�´
��
M�}��$�gj����g�=��K�^(wU΂
\@�C��w2�}f����=��6g��r���)��'$���l:��bGBy�#A]z���.����wd�R-̠9�����ǅ����~Rr+�y�ߗ�|]�8�rc��qՄ4۬,���Ȕ��v��a<R�%�X���j��\�y̳�U�� ��4�� �,n?^���� �
������th��P��:��1=Y1�?(8� ��V�Ԏ���,Ng�Yn����E�qA\բ�+�`�|7O���^�i�LL9��v��� d         *  x��չj�@��z�z�9v��:�Ibv:7����ٕ�\�!3�B��k���H�a��}w����gH3%Qˮe�ǟ"5TV�����:��J	����~7${��W��V�۬��l�~ڲ�VӚm�>�ن�q�V�H�8�匘C��Z�����q�Q�.P��*5���q�H�$�F.��V>'�VUnE���Z�\�Z���]���a�~�e2�:AR�!�Ҕ^y`u">���ٌæ������oMw��?�M�i�|c\s籗������(�wnx˲         J  x����J�`E���H��/��� ��D1()v��q.X�-�@���S͹=e)�����v�~Du�����COE*IVi$٤�d��$'�?j�YITE�&Q#Q�$�E�KY%OeU���5Q�X�E�k�$��V%���*��VN>���<_0�ǜy��=~�+�>�U���g���pB�XFπ��0!v4�΀�3`A�X96$΀�3���	�����-�:��]^���=_��s�(9�G���G�D��c�:ÈJ#�J��J�J��ڈQE%���R�آ�axQ)c�Q�`�Q�b�Q�a�Q��F��n7��ܱ���i�?��s�         ]   x�363�4�4�T�����|$V��������������������H���͌�$%��CI�4�5q�f�$��(���@��hg� �73         ]   x�31�41�4�LI�̩�,I-VH�J�4�4202�50�52S02�26�22��C C.S�NS���b�>lzL,���A�������M_� ��$v      !   h  x�՘Qs�8ǟ�O�/Ќ-��
`R���7妹�һ4���'mۛ�7ZY��I�������忿,+��^.ҋw�E�_��E<��hd5aKQO�b!��v��n����r��>�d�?�8<��������_Vw�	O^%�+>`����k>�����2ˊ����j_-�`B�w�5b&�[UU��F������`ә�KU�R�g��!�*]հ���P]u�R��N�ʚ�,�S,S]ب��Y�4;���'���9��]�¸.,M:*��D�����BuN,�ԔAMigM�������|���� U�P飯ZL�[�6�v�Scb/�Gm<�����Y���8���'�i���o�z�HQ)�����n�n,؛��+��遶�� u��O���r;K5��~m�/2��/a�]S���&BͯZ�5i��W��i�د�v���{�,�_o��:H��0�Ӯ���On���&fMU��?������5W�k��f���AF��=��k�i�`XH�>X�� 5���]���N��kW�i
?F�cu-U��r�@��k���I���U֨��Z���^��*Hy]�a���?\f=|>��>��f9?\t�������~�t�����}m�YrJ^h��2�ёy�����e�U�ƣ�2=%�P�Mr����ǯ��#�?j��#�������,N�ج+Xt�
D	��(m��ه�ؘ-��87�V.lzlu�-ɠ%��Ċ�m���HقZ��-�]%����_ڒ���U,:n�����>ە��rզ�����$>������)�!�-��j��r�|�G��b^ڒ�,��$���oIx6�ˍ��А�xK�Cl�e; ��܇�-�f8��V����<��Bܪ�6�k9fi/�;ިd4U���ŏ�c�5{���<��~���%�+<�p*�B���<n���:P��=�@�OՁ��q�ǜL�=lg��
�9�:?AW�Z���=n}�q#���Д~�ǭ7�j�&�P>n��N�!�]����ΦB��G��<�
B���q�ǝM��Y���������C���#�������1'{��N�!�y@n=p�QC8dA
ȭ�7�j�zS��?}b�y������/Z��0ӄ��|��Z���hʨ���BS�'^|����\�7�3(>�G �$� �% ��a'N���N�B�"��8��<�:1�	pqb�> !��'|�A�9'�� ��BC�9Q�Xe�A�2`�����������'��׭x�D�F+(�SM�,���7jy@A�i�eu����@�R6P��{f�%4"rA>�h���)2��8e� �X���X�2��X�r�"X����W|���9��&@&;9B� �Ŋ����_����?��|�^��C��C�  �I��r�)ݥ2�9e,��K��c�i�I{�iH�a�rM�*<�!I/<gɁ$6���{ޟ#3������a�[ l�aOPZ��ܥ�=d0Qa B&�#* �儁	��]N�C�	b	��YH��� D��1�x0 !��{�@�����E6س��`�C6� ��K����.//��V�      "   �  x�՛]s�8��ɯ�HƲ͇s�*`R݅�wJ�l�d��ٿ��I����#K��t�(�|�c8y�3$	�NH;��|�:�|�v(_
�r��Ȝe�1�1�^匐��t�@���/�S��m�T�^������ŕ� ���u�#4���mԓ����*	bYT���m:�0��0��	�?��TՕU���22��-5��p�2�,j�P�=���,[����da�j���e]IS]�4�7d��wU6�7s�W'ud]4h(l�F#F����3�76wQR%�ƒ2�D13>"��J|$��E�E��1���*_7b>l�|�'<��X�ȥ�
)T5T8by���|���Ųa�Y梲*�*��6CF>�Y���D�y��(F=m��������"�1'�p'��¨�M��ߢFḼLT5�]�U
��6���G�3�72��>�-��
f=m�y��bN|$l����IM0�iӠ��H���Zs2]��w2`ʇMS~�V��3NěJ��$��aӔ��a���er��o ��"s�l�qP_?l�[.~�o��b�g|�eق�7.�����
��P��j�W=쎻j5���/;�X|#_��������u���x(�{5��)M�L��#�ޯCW��xrT��K�A\=�c��E���Oj�4>z��߃)T�U�,9f���fZǬ���1;�E�p�Un�ۄ;�Ŏ$Б���B��Ʈh�Q ��P]��؅�"�k��yj�)���Z䆔Gkb���M��X[d��Gkr�ږ�%����!�њ����c�Qv�"5�;Z��U�i ,�C�kr����bc�5�n,���rL�*�wVa�|x&��l�V�x�;>�=I_N�����_���ު����&���[���� �̰&e���vh�����ȞaM�D�l/4U��N����Kw�}�uė|ʪ��?�yx.��X<���Y�%޿J=$z��Ɏ<�<����I�u�%�P��RLz���-5 �h%�4�>�Rb� ]ͤǎ9�u��E�.7�lK�= 7������B�z҇���Mz�и���-t�^��[���/���qg�!�B�k��Z�+�n�>)�C�ӗNz츳-�C���Nzਣ-qC�k!��ȑ�[b�������1'[���gD��@�2��	Ѐ����E,�B$��W���:>Z=������[�c 0������x�@�y�g@R	鵂1 JH�4��ȼT)�b��0]b��ܞ+<g�8{���0@�O�a����� !D?E{�>$5�66��|�i��	� �\�20�I�R��ޮ�B�������8v:����ϟW�_y�, �%��j��@�z�
,@'�ku`z�7)�S	H)�z�,І@{a��B"���� 7-q������@�O5a����ު
���Th!���2,�B��Um��M s��:,�B�$�a���.E�X���k髑o�?ϧ�K��ϸ�!e�X"��!Fw
�ٕ��
��J{�%ĞDl�=�)���2h_��RP�z�:���zC�ё�(�%@��40|�4�9!� �xuޟ�.*����uh�¢���X��:�L�C��Bҙ�� Bj�&4 ���
&"}!��LBT!i[uBW�A��zPGt�*��t}�:�#�P��dD2������)d#fA۽M8��|suu�{P�f      %   �  x�%Ա��@ A�̗Kry�\�q|��hh�Wk�Y�5�g�k�������ۼ��<�e�i���3���mn�2O�0�9f�����[{ko��������ڭ�ڭ�ڭ�ڭ�ڭ���������������Ԟ�C{h��=�����C{h�vi�vi�vi�vi�vi�o�o�o�o�w�w�w�w�?�ӦM�6mZ���ax���ax��x��x��x��x��x��x��x��x��x��x��x��.���m�e�e�e�e�e�����������������hG;��r'q'q'q'q'q'q'q'q'q'q'q'q'�P	#���ꬮ�{㞸�{ߞ����n��.���뼮�n�.��ꬮ�n�.��޿�?����3��g�o�O������g���      &   3   x�3�t
Upr�sv�L,��4202�50�54P02�2"Clb\1z\\\ �[�      (      x������ � �      *   5   x�34�q�uT0��?2�4202�50�5�T00�25�26�ʁW� P�;      +   Y   x�3��44���4�4202�50�52S04�2��2� I���	������S�ea�C�����)�^c(�������NSc,���J��b���� �d$�      .   �   x���K
1�u�^ ���&9Ĝ`6nA���D�l�A%���ۓ�&Q$j�H�R�
���$(�+��]��͕��<�O.���x�� d8�`s���̥W��֫`	s�U����*C>ѡ��ؠ���
��~ި)��dLi��_r\CoFV��      0   x   x��ѹ�@Dј[��c/6�
�pb@�{�:��/����%CL>��yŇ\�_��.5��R���R�)+�Ly)S���`�� �&Xg�H0� ��ȃP<02!�\�'����D(��      2   u   x�uй�@B�x�_ۄ+p�uXCj!�}�WC5���>��Z�~�^ݯ����}�r?��p��|�|�|�}P>,�t�Ȩ(X��Q0#��`GFH�����%+J
��()X����9?l[w      4   �   x���1
�0��Y>L�,�I.�d	t)tk;����H����~�*�R'nt;�q��_�ǅY���T�L�KF.&׌\Mn��䚠�N�ʓ�m�J�ʤ��^�}<��L�y$�<v����`�`�`�`���Q�Q�Q~������A=��      6   �   x���;�0���>�/`��y9� �iL� �O(�@�4H[m�ɖ~�[	��ROi{K9��q^�B�]psˆ�%���k���6� �
8Fh��MZ&@:&�*�LhTa`B�
,G�=��5HgAB-�Y�P�t�$�&A���=�:����V��jW��O��z���yc|vv       8   �   x���=
�P�z�)r����_gi�	Ҥ�!Q�/�%�Y�i�j��ﯭ�02�H#���g�6�I�� 5J�AZ��Ậ�@��?�N�+�2Agl�㌜�1�3v��4��Y6��L�m��8�py,�u~��Q7�RJ_��t�      :   $  x��RKn�0\�S��A�]��*E=@6cp�c� ��}.�7h%˟y���b/!qI��2X�8XO��ɤ��F�4�Q`�`���I�TRy��U-���U�������5��Y宸C�M�8�M�.�'
i�%�L�Tt�MnG�Mb��&�����<}we�eU�=��
����vSm�QT>EXl�&�:f����f������k����[�&u,P��I�u[�u[�=5�C�m��Qt��ly�%t�����wc�E�������7�K�t��C�M��q������C      <   U   x�m���0�o��j��;�t�9$JL4&��Ψ)AiNH����F�<Q��#�|�� G�~��6�+�+3�v�-      >   S  x���ɚ�0 �>����I����"�l.__P�D@TP����g�̭��T�����w����7ޤX����H\�.���3��ܭ���u���^��%����Z������ �t��C�4���g8� Џp��;n�V��T6ϧ�=�s~N��⬤u��'�G2�W�0���]S�*�M�C�~�-�Ѣ����Z��Ԡ�%?x��C����ő��$��r���zv@������J�_�[<Um���_���mS��}�KꛁU;��(;���c����2<.��٭w��0C��S�:p0�n�2|����[d��z� _�����QW*�!�Z�8R�)m��+#�%l�]��$���	�y���o)��
��.��>�����G�4m���v��S�y�!J/,@~�?����/kNzJ!h�{��F��?��"�Ln�i�t�	�FR�ǩ-9�ԅ�Ca�d���Kұ��a.�D��24��"���ǨY��J��z,�⒭�>A���63'p�5�	���`�%��`[����xs�v=:w ׬t�-�J�������.�8`+Y:�Ai�����?�m"�[�D����<V�N���_�_     