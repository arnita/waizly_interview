PGDMP         5            	    x            postgres %   10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)    10.9    }           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ~           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    13053    postgres    DATABASE     z   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE postgres;
             postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    3712                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13039    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1                       1259    17007    absensi    TABLE     �  CREATE TABLE public.absensi (
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
       public         postgres    false    3            
           1259    17005    absensi_absensi_id_seq    SEQUENCE        CREATE SEQUENCE public.absensi_absensi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.absensi_absensi_id_seq;
       public       postgres    false    267    3            �           0    0    absensi_absensi_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.absensi_absensi_id_seq OWNED BY public.absensi.absensi_id;
            public       postgres    false    266            �            1259    16821    class_advisor    TABLE     �  CREATE TABLE public.class_advisor (
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
       public         postgres    false    3            �            1259    16819 "   class_advisor_class_advisor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.class_advisor_class_advisor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.class_advisor_class_advisor_id_seq;
       public       postgres    false    248    3            �           0    0 "   class_advisor_class_advisor_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.class_advisor_class_advisor_id_seq OWNED BY public.class_advisor.class_advisor_id;
            public       postgres    false    247            �            1259    16775    course_setting    TABLE       CREATE TABLE public.course_setting (
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
    unit_year_id bigint,
    class_grade_id bigint
);
 "   DROP TABLE public.course_setting;
       public         postgres    false    3            �           0    0 $   COLUMN course_setting.study_group_id    COMMENT     ^   COMMENT ON COLUMN public.course_setting.study_group_id IS 'relasi ini sudah tidak digunakan';
            public       postgres    false    244            �            1259    16773 $   course_setting_course_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_setting_course_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.course_setting_course_setting_id_seq;
       public       postgres    false    244    3            �           0    0 $   course_setting_course_setting_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.course_setting_course_setting_id_seq OWNED BY public.course_setting.course_setting_id;
            public       postgres    false    243            	           1259    16976    daily_exercise    TABLE     D  CREATE TABLE public.daily_exercise (
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
       public         postgres    false    3                       1259    16974 $   daily_exercise_daily_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.daily_exercise_daily_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.daily_exercise_daily_exercise_id_seq;
       public       postgres    false    3    265            �           0    0 $   daily_exercise_daily_exercise_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.daily_exercise_daily_exercise_id_seq OWNED BY public.daily_exercise.daily_exercise_id;
            public       postgres    false    264                       1259    17200    daily_exercise_skill    TABLE     4  CREATE TABLE public.daily_exercise_skill (
    daily_exercise_skill_id bigint NOT NULL,
    student_id bigint,
    kd_id bigint,
    skill_value double precision,
    skill_type character varying,
    daily_exercise_skill_insert_by integer,
    daily_exercise_skill_insert_time timestamp(0) without time zone,
    daily_exercise_skill_update_time timestamp(0) without time zone,
    daily_exercise_skill_update_by integer,
    daily_exercise_skill_delete_time timestamp(0) without time zone,
    daily_exercise_skill_delete_by integer,
    step_study_id bigint
);
 (   DROP TABLE public.daily_exercise_skill;
       public         postgres    false    3                       1259    17198 *   daily_exercise_skill_daily_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.daily_exercise_skill_daily_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.daily_exercise_skill_daily_exercise_id_seq;
       public       postgres    false    3    287            �           0    0 *   daily_exercise_skill_daily_exercise_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.daily_exercise_skill_daily_exercise_id_seq OWNED BY public.daily_exercise_skill.daily_exercise_skill_id;
            public       postgres    false    286                       1259    16914    employee_unit    TABLE     �  CREATE TABLE public.employee_unit (
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
       public         postgres    false    3                       1259    16912 "   employee_unit_employee_unit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_unit_employee_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.employee_unit_employee_unit_id_seq;
       public       postgres    false    259    3            �           0    0 "   employee_unit_employee_unit_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.employee_unit_employee_unit_id_seq OWNED BY public.employee_unit.employee_unit_id;
            public       postgres    false    258                       1259    17059    extracurricular    TABLE       CREATE TABLE public.extracurricular (
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
       public         postgres    false    3                       1259    17057 &   extracurricular_extracurricular_id_seq    SEQUENCE     �   CREATE SEQUENCE public.extracurricular_extracurricular_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.extracurricular_extracurricular_id_seq;
       public       postgres    false    273    3            �           0    0 &   extracurricular_extracurricular_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.extracurricular_extracurricular_id_seq OWNED BY public.extracurricular.extracurricular_id;
            public       postgres    false    272                       1259    17124    friendly_value    TABLE     �  CREATE TABLE public.friendly_value (
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
    CONSTRAINT friendly_value_friendly_value_value_check CHECK (((friendly_value_value)::text = ANY ((ARRAY['SB'::character varying, 'PB'::character varying])::text[])))
);
 "   DROP TABLE public.friendly_value;
       public         postgres    false    3                       1259    17122 $   friendly_value_friendly_value_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendly_value_friendly_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.friendly_value_friendly_value_id_seq;
       public       postgres    false    279    3            �           0    0 $   friendly_value_friendly_value_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.friendly_value_friendly_value_id_seq OWNED BY public.friendly_value.friendly_value_id;
            public       postgres    false    278            !           1259    17247    input_analysis    TABLE     _  CREATE TABLE public.input_analysis (
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
       public         postgres    false    3                        1259    17245 $   input_analysis_input_analysis_id_seq    SEQUENCE     �   CREATE SEQUENCE public.input_analysis_input_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.input_analysis_input_analysis_id_seq;
       public       postgres    false    289    3            �           0    0 $   input_analysis_input_analysis_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.input_analysis_input_analysis_id_seq OWNED BY public.input_analysis.input_analysis_id;
            public       postgres    false    288            )           1259    17315    input_analysis_tema    TABLE     �  CREATE TABLE public.input_analysis_tema (
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
       public         postgres    false    3            (           1259    17313 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq;
       public       postgres    false    3    297            �           0    0 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq OWNED BY public.input_analysis_tema.input_analysis_tema_id;
            public       postgres    false    296            -           1259    17389    institution    TABLE       CREATE TABLE public.institution (
    institution_id integer NOT NULL,
    institution_name character varying(191),
    institution_desc text,
    institution_address character varying(191),
    institution_telp character varying(191),
    institution_email character varying(191),
    institution_start_time timestamp(0) without time zone,
    institution_end_time timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    institution_status character varying(191)
);
    DROP TABLE public.institution;
       public         postgres    false    3            ,           1259    17387    institution_institution_id_seq    SEQUENCE     �   CREATE SEQUENCE public.institution_institution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.institution_institution_id_seq;
       public       postgres    false    3    301            �           0    0    institution_institution_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.institution_institution_id_seq OWNED BY public.institution.institution_id;
            public       postgres    false    300            %           1259    17289    list_question_per_kd    TABLE       CREATE TABLE public.list_question_per_kd (
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
       public         postgres    false    3            $           1259    17287 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq;
       public       postgres    false    3    293            �           0    0 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq OWNED BY public.list_question_per_kd.list_question_per_kd_id;
            public       postgres    false    292            '           1259    17302    list_question_per_tema    TABLE     /  CREATE TABLE public.list_question_per_tema (
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
       public         postgres    false    3            &           1259    17300 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq;
       public       postgres    false    295    3            �           0    0 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq OWNED BY public.list_question_per_tema.list_question_per_tema_id;
            public       postgres    false    294            �            1259    16618 
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
       public         postgres    false    3            �            1259    16616    m_building_building_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_building_building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_building_building_id_seq;
       public       postgres    false    226    3            �           0    0    m_building_building_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_building_building_id_seq OWNED BY public.m_building.building_id;
            public       postgres    false    225            �            1259    16470    m_class_grade    TABLE       CREATE TABLE public.m_class_grade (
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
       public         postgres    false    3            �            1259    16468     m_class_grade_class_grade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_class_grade_class_grade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_class_grade_class_grade_id_seq;
       public       postgres    false    210    3            �           0    0     m_class_grade_class_grade_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_class_grade_class_grade_id_seq OWNED BY public.m_class_grade.class_grade_id;
            public       postgres    false    209            �            1259    16518    m_class_room    TABLE       CREATE TABLE public.m_class_room (
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
       public         postgres    false    3            �            1259    16516    m_class_room_class_room_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_class_room_class_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_class_room_class_room_id_seq;
       public       postgres    false    216    3            �           0    0    m_class_room_class_room_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_class_room_class_room_id_seq OWNED BY public.m_class_room.class_room_id;
            public       postgres    false    215            �            1259    16497    m_course    TABLE     X  CREATE TABLE public.m_course (
    course_id bigint NOT NULL,
    unit_id bigint,
    class_grade_id bigint,
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
       public         postgres    false    3            �           0    0    COLUMN m_course.unit_id    COMMENT     Q   COMMENT ON COLUMN public.m_course.unit_id IS 'Relasi ini sudah tidak digunakan';
            public       postgres    false    214            �           0    0    COLUMN m_course.class_grade_id    COMMENT     Y   COMMENT ON COLUMN public.m_course.class_grade_id IS 'Relasi ini sudah tidak di gunakan';
            public       postgres    false    214            �            1259    16495    m_course_course_id_seq    SEQUENCE        CREATE SEQUENCE public.m_course_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.m_course_course_id_seq;
       public       postgres    false    3    214            �           0    0    m_course_course_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.m_course_course_id_seq OWNED BY public.m_course.course_id;
            public       postgres    false    213            �            1259    16704    m_department    TABLE     �  CREATE TABLE public.m_department (
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
       public         postgres    false    3            �            1259    16702    m_department_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_department_department_id_seq;
       public       postgres    false    236    3            �           0    0    m_department_department_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_department_department_id_seq OWNED BY public.m_department.department_id;
            public       postgres    false    235            �            1259    16411    m_education_level    TABLE     9  CREATE TABLE public.m_education_level (
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
       public         postgres    false    3            �            1259    16409 (   m_education_level_education_level_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_education_level_education_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.m_education_level_education_level_id_seq;
       public       postgres    false    3    202            �           0    0 (   m_education_level_education_level_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.m_education_level_education_level_id_seq OWNED BY public.m_education_level.education_level_id;
            public       postgres    false    201            �            1259    16731 
   m_employee    TABLE     
  CREATE TABLE public.m_employee (
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
    employee_delete_by integer,
    employee_role bigint
);
    DROP TABLE public.m_employee;
       public         postgres    false    3            �            1259    16729    m_employee_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_employee_employee_id_seq;
       public       postgres    false    240    3            �           0    0    m_employee_employee_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_employee_employee_id_seq OWNED BY public.m_employee.employee_id;
            public       postgres    false    239            �            1259    16637    m_floor    TABLE     �  CREATE TABLE public.m_floor (
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
       public         postgres    false    3            �            1259    16635    m_floor_floor_id_seq    SEQUENCE     }   CREATE SEQUENCE public.m_floor_floor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.m_floor_floor_id_seq;
       public       postgres    false    230    3            �           0    0    m_floor_floor_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.m_floor_floor_id_seq OWNED BY public.m_floor.floor_id;
            public       postgres    false    229            �            1259    16650    m_kd    TABLE       CREATE TABLE public.m_kd (
    kd_id bigint NOT NULL,
    unit_year_id bigint,
    course_id bigint,
    kd_code character varying(1000),
    kd_name character varying(1000),
    kd_desc character varying(191),
    kd_type character varying(191) NOT NULL,
    kd_insert_by integer,
    kd_insert_time timestamp(0) without time zone,
    kd_update_time timestamp(0) without time zone,
    kd_update_by integer,
    kd_delete_time timestamp(0) without time zone,
    kd_delete_by integer,
    unit_id bigint,
    course_setting_id bigint
);
    DROP TABLE public.m_kd;
       public         postgres    false    3            �            1259    16671    m_kd_detail    TABLE     �  CREATE TABLE public.m_kd_detail (
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
       public         postgres    false    3            �            1259    16669    m_kd_detail_kd_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_kd_detail_kd_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.m_kd_detail_kd_detail_id_seq;
       public       postgres    false    3    234            �           0    0    m_kd_detail_kd_detail_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.m_kd_detail_kd_detail_id_seq OWNED BY public.m_kd_detail.kd_detail_id;
            public       postgres    false    233            �            1259    16648    m_kd_kd_id_seq    SEQUENCE     w   CREATE SEQUENCE public.m_kd_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.m_kd_kd_id_seq;
       public       postgres    false    232    3            �           0    0    m_kd_kd_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.m_kd_kd_id_seq OWNED BY public.m_kd.kd_id;
            public       postgres    false    231            �            1259    16629    m_kkm    TABLE     �  CREATE TABLE public.m_kkm (
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
       public         postgres    false    3            �            1259    16627    m_kkm_kkm_id_seq    SEQUENCE     y   CREATE SEQUENCE public.m_kkm_kkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.m_kkm_kkm_id_seq;
       public       postgres    false    3    228            �           0    0    m_kkm_kkm_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.m_kkm_kkm_id_seq OWNED BY public.m_kkm.kkm_id;
            public       postgres    false    227            �            1259    16486    m_lesson_hour    TABLE     z  CREATE TABLE public.m_lesson_hour (
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
       public         postgres    false    3            �            1259    16484     m_lesson_hour_lesson_hour_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_lesson_hour_lesson_hour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_lesson_hour_lesson_hour_id_seq;
       public       postgres    false    212    3            �           0    0     m_lesson_hour_lesson_hour_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_lesson_hour_lesson_hour_id_seq OWNED BY public.m_lesson_hour.lesson_hour_id;
            public       postgres    false    211            �            1259    16597    m_parent    TABLE     �  CREATE TABLE public.m_parent (
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
       public         postgres    false    3            �            1259    16595    m_parent_parent_id_seq    SEQUENCE        CREATE SEQUENCE public.m_parent_parent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.m_parent_parent_id_seq;
       public       postgres    false    3    224            �           0    0    m_parent_parent_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.m_parent_parent_id_seq OWNED BY public.m_parent.parent_id;
            public       postgres    false    223            �            1259    16715 
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
       public         postgres    false    3            �            1259    16713    m_position_position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_position_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_position_position_id_seq;
       public       postgres    false    3    238            �           0    0    m_position_position_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_position_position_id_seq OWNED BY public.m_position.position_id;
            public       postgres    false    237            �            1259    16454    m_step_study    TABLE        CREATE TABLE public.m_step_study (
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
       public         postgres    false    3            �            1259    16452    m_step_study_step_study_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_step_study_step_study_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_step_study_step_study_id_seq;
       public       postgres    false    208    3            �           0    0    m_step_study_step_study_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_step_study_step_study_id_seq OWNED BY public.m_step_study.step_study_id;
            public       postgres    false    207            �            1259    16560 	   m_student    TABLE     �  CREATE TABLE public.m_student (
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
    student_weight character varying(191),
    student_nis character varying(191)
);
    DROP TABLE public.m_student;
       public         postgres    false    3            �            1259    16558    m_student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.m_student_student_id_seq;
       public       postgres    false    3    220            �           0    0    m_student_student_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.m_student_student_id_seq OWNED BY public.m_student.student_id;
            public       postgres    false    219            �            1259    16534    m_study_group    TABLE     '  CREATE TABLE public.m_study_group (
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
       public         postgres    false    3            �            1259    16532     m_study_group_study_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_study_group_study_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_study_group_study_group_id_seq;
       public       postgres    false    3    218            �           0    0     m_study_group_study_group_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_study_group_study_group_id_seq OWNED BY public.m_study_group.study_group_id;
            public       postgres    false    217            �            1259    16422    m_unit    TABLE     �  CREATE TABLE public.m_unit (
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
       public         postgres    false    3            �            1259    16420    m_unit_unit_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_unit_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_unit_unit_id_seq;
       public       postgres    false    204    3            �           0    0    m_unit_unit_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.m_unit_unit_id_seq OWNED BY public.m_unit.unit_id;
            public       postgres    false    203            �            1259    16438    m_unit_year    TABLE     ;  CREATE TABLE public.m_unit_year (
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
       public         postgres    false    3            �            1259    16436    m_unit_year_unit_year_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_unit_year_unit_year_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.m_unit_year_unit_year_id_seq;
       public       postgres    false    3    206            �           0    0    m_unit_year_unit_year_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.m_unit_year_unit_year_id_seq OWNED BY public.m_unit_year.unit_year_id;
            public       postgres    false    205                       1259    16897    menu    TABLE     g  CREATE TABLE public.menu (
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
       public         postgres    false    3                        1259    16895    menu_menu_id_seq    SEQUENCE     y   CREATE SEQUENCE public.menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.menu_menu_id_seq;
       public       postgres    false    257    3            �           0    0    menu_menu_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu.menu_id;
            public       postgres    false    256            �            1259    16386 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         postgres    false    3            �            1259    16384    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public       postgres    false    3    197            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
            public       postgres    false    196            �            1259    16858    model_has_permissions    TABLE     �   CREATE TABLE public.model_has_permissions (
    permission_id integer NOT NULL,
    model_type character varying(191) NOT NULL,
    model_id bigint NOT NULL
);
 )   DROP TABLE public.model_has_permissions;
       public         postgres    false    3            �            1259    16869    model_has_roles    TABLE     �   CREATE TABLE public.model_has_roles (
    role_id integer NOT NULL,
    model_type character varying(191) NOT NULL,
    model_id bigint NOT NULL
);
 #   DROP TABLE public.model_has_roles;
       public         postgres    false    3                       1259    17080 	   observasi    TABLE       CREATE TABLE public.observasi (
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
       public         postgres    false    3                       1259    17078    observasi_observasi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.observasi_observasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.observasi_observasi_id_seq;
       public       postgres    false    3    275            �           0    0    observasi_observasi_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.observasi_observasi_id_seq OWNED BY public.observasi.observasi_id;
            public       postgres    false    274            �            1259    16586 	   parlookup    TABLE     A  CREATE TABLE public.parlookup (
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
       public         postgres    false    3            �            1259    16584    parlookup_parlookup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.parlookup_parlookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.parlookup_parlookup_id_seq;
       public       postgres    false    222    3            �           0    0    parlookup_parlookup_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.parlookup_parlookup_id_seq OWNED BY public.parlookup.parlookup_id;
            public       postgres    false    221            �            1259    16405    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         postgres    false    3                       1259    17102    pd    TABLE     F  CREATE TABLE public.pd (
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
    CONSTRAINT pd_pd_value_check CHECK (((pd_value)::text = ANY ((ARRAY['SB'::character varying, 'PB'::character varying])::text[])))
);
    DROP TABLE public.pd;
       public         postgres    false    3                       1259    17100    pd_pd_id_seq    SEQUENCE     u   CREATE SEQUENCE public.pd_pd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pd_pd_id_seq;
       public       postgres    false    277    3            �           0    0    pd_pd_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pd_pd_id_seq OWNED BY public.pd.pd_id;
            public       postgres    false    276            �            1259    16844    permissions    TABLE     
  CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying(191) NOT NULL,
    guard_name character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    menu_id integer
);
    DROP TABLE public.permissions;
       public         postgres    false    3            �            1259    16842    permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public       postgres    false    250    3            �           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
            public       postgres    false    249                       1259    17025    personality    TABLE     �  CREATE TABLE public.personality (
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
       public         postgres    false    3                       1259    17023    personality_personality_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personality_personality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.personality_personality_id_seq;
       public       postgres    false    269    3            �           0    0    personality_personality_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.personality_personality_id_seq OWNED BY public.personality.personality_id;
            public       postgres    false    268                       1259    17038    physical_student    TABLE     A  CREATE TABLE public.physical_student (
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
       public         postgres    false    3                       1259    17036 (   physical_student_physical_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.physical_student_physical_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.physical_student_physical_student_id_seq;
       public       postgres    false    3    271            �           0    0 (   physical_student_physical_student_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.physical_student_physical_student_id_seq OWNED BY public.physical_student.physical_student_id;
            public       postgres    false    270            /           1259    17403 
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
       public         postgres    false    3            .           1259    17401    prestation_prestation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prestation_prestation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.prestation_prestation_id_seq;
       public       postgres    false    303    3            �           0    0    prestation_prestation_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.prestation_prestation_id_seq OWNED BY public.prestation.prestation_id;
            public       postgres    false    302            #           1259    17273    quiz_per_kd    TABLE     �  CREATE TABLE public.quiz_per_kd (
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
       public         postgres    false    3            "           1259    17271    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq;
       public       postgres    false    3    291            �           0    0    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq OWNED BY public.quiz_per_kd.quiz_per_kd_id;
            public       postgres    false    290            5           1259    17480    raport    TABLE     i  CREATE TABLE public.raport (
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
       public         postgres    false    3            9           1259    17546 
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
       public         postgres    false    3            8           1259    17544    raport_pts_raport_pts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.raport_pts_raport_pts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.raport_pts_raport_pts_id_seq;
       public       postgres    false    3    313            �           0    0    raport_pts_raport_pts_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.raport_pts_raport_pts_id_seq OWNED BY public.raport_pts.raport_pts_id;
            public       postgres    false    312            4           1259    17478    raport_raport_id_seq    SEQUENCE     }   CREATE SEQUENCE public.raport_raport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.raport_raport_id_seq;
       public       postgres    false    3    309            �           0    0    raport_raport_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.raport_raport_id_seq OWNED BY public.raport.raport_id;
            public       postgres    false    308            �            1259    16880    role_has_permissions    TABLE     o   CREATE TABLE public.role_has_permissions (
    permission_id integer NOT NULL,
    role_id integer NOT NULL
);
 (   DROP TABLE public.role_has_permissions;
       public         postgres    false    3            �            1259    16852    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(191) NOT NULL,
    guard_name character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.roles;
       public         postgres    false    3            �            1259    16850    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false    252    3            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       postgres    false    251            +           1259    17371    setting_daily_exercise    TABLE       CREATE TABLE public.setting_daily_exercise (
    setting_daily_exercise_id integer NOT NULL,
    kd_id bigint,
    skill_type character varying(191),
    step_study_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.setting_daily_exercise;
       public         postgres    false    3            *           1259    17369 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq;
       public       postgres    false    299    3            �           0    0 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq OWNED BY public.setting_daily_exercise.setting_daily_exercise_id;
            public       postgres    false    298                       1259    16932    structure_tematic    TABLE     j  CREATE TABLE public.structure_tematic (
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
    structure_tematic_delete_by integer,
    class_grade_id bigint
);
 %   DROP TABLE public.structure_tematic;
       public         postgres    false    3                       1259    16953    structure_tematic_detail    TABLE     �  CREATE TABLE public.structure_tematic_detail (
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
       public         postgres    false    3                       1259    16951 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq;
       public       postgres    false    3    263            �           0    0 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq OWNED BY public.structure_tematic_detail.structure_tematic_detail_id;
            public       postgres    false    262                       1259    16930 *   structure_tematic_structure_tematic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.structure_tematic_structure_tematic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.structure_tematic_structure_tematic_id_seq;
       public       postgres    false    261    3            �           0    0 *   structure_tematic_structure_tematic_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.structure_tematic_structure_tematic_id_seq OWNED BY public.structure_tematic.structure_tematic_id;
            public       postgres    false    260            �            1259    16752    study_group_setting    TABLE     '  CREATE TABLE public.study_group_setting (
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
       public         postgres    false    3            �            1259    16750 .   study_group_setting_study_group_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.study_group_setting_study_group_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.study_group_setting_study_group_setting_id_seq;
       public       postgres    false    242    3            �           0    0 .   study_group_setting_study_group_setting_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.study_group_setting_study_group_setting_id_seq OWNED BY public.study_group_setting.study_group_setting_id;
            public       postgres    false    241            7           1259    17506 
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
       public         postgres    false    3            6           1259    17504    summary_kd_summary_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_kd_summary_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.summary_kd_summary_kd_id_seq;
       public       postgres    false    3    311            �           0    0    summary_kd_summary_kd_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.summary_kd_summary_kd_id_seq OWNED BY public.summary_kd.summary_kd_id;
            public       postgres    false    310            3           1259    17452    summary_skill    TABLE     �  CREATE TABLE public.summary_skill (
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
       public         postgres    false    3            2           1259    17450 "   summary_skill_summary_skill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_skill_summary_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.summary_skill_summary_skill_id_seq;
       public       postgres    false    307    3            �           0    0 "   summary_skill_summary_skill_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.summary_skill_summary_skill_id_seq OWNED BY public.summary_skill.summary_skill_id;
            public       postgres    false    306            1           1259    17429    summary_tematic    TABLE     /  CREATE TABLE public.summary_tematic (
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
       public         postgres    false    3            0           1259    17427 &   summary_tematic_summary_tematic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_tematic_summary_tematic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.summary_tematic_summary_tematic_id_seq;
       public       postgres    false    3    305            �           0    0 &   summary_tematic_summary_tematic_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.summary_tematic_summary_tematic_id_seq OWNED BY public.summary_tematic.summary_tematic_id;
            public       postgres    false    304                       1259    17182    tahfizh    TABLE     �  CREATE TABLE public.tahfizh (
    tahfizh_id bigint NOT NULL,
    tahfizh_type character varying(191) NOT NULL,
    tahfizh_value character varying(191) NOT NULL,
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
       public         postgres    false    3                       1259    17180    tahfizh_tahfizh_id_seq    SEQUENCE        CREATE SEQUENCE public.tahfizh_tahfizh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tahfizh_tahfizh_id_seq;
       public       postgres    false    3    285            �           0    0    tahfizh_tahfizh_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tahfizh_tahfizh_id_seq OWNED BY public.tahfizh.tahfizh_id;
            public       postgres    false    284                       1259    17164    tahsin    TABLE     �  CREATE TABLE public.tahsin (
    tahsin_id bigint NOT NULL,
    tahsin_type character varying(191) NOT NULL,
    tahsin_value character varying(191) NOT NULL,
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
       public         postgres    false    3                       1259    17162    tahsin_tahsin_id_seq    SEQUENCE     }   CREATE SEQUENCE public.tahsin_tahsin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tahsin_tahsin_id_seq;
       public       postgres    false    3    283            �           0    0    tahsin_tahsin_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tahsin_tahsin_id_seq OWNED BY public.tahsin.tahsin_id;
            public       postgres    false    282                       1259    17146    teacher_note    TABLE     �  CREATE TABLE public.teacher_note (
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
       public         postgres    false    3                       1259    17144     teacher_note_teacher_note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_note_teacher_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.teacher_note_teacher_note_id_seq;
       public       postgres    false    281    3            �           0    0     teacher_note_teacher_note_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.teacher_note_teacher_note_id_seq OWNED BY public.teacher_note.teacher_note_id;
            public       postgres    false    280            �            1259    16798    teacher_setting    TABLE       CREATE TABLE public.teacher_setting (
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
       public         postgres    false    3            �            1259    16796 &   teacher_setting_teacher_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_setting_teacher_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.teacher_setting_teacher_setting_id_seq;
       public       postgres    false    246    3            �           0    0 &   teacher_setting_teacher_setting_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.teacher_setting_teacher_setting_id_seq OWNED BY public.teacher_setting.teacher_setting_id;
            public       postgres    false    245            �            1259    16394    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(191) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    username character varying(191),
    user_status character varying(191),
    api_token character varying
);
    DROP TABLE public.users;
       public         postgres    false    3            �            1259    16392    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    199    3            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    198            �           2604    17010    absensi absensi_id    DEFAULT     x   ALTER TABLE ONLY public.absensi ALTER COLUMN absensi_id SET DEFAULT nextval('public.absensi_absensi_id_seq'::regclass);
 A   ALTER TABLE public.absensi ALTER COLUMN absensi_id DROP DEFAULT;
       public       postgres    false    266    267    267            |           2604    16824    class_advisor class_advisor_id    DEFAULT     �   ALTER TABLE ONLY public.class_advisor ALTER COLUMN class_advisor_id SET DEFAULT nextval('public.class_advisor_class_advisor_id_seq'::regclass);
 M   ALTER TABLE public.class_advisor ALTER COLUMN class_advisor_id DROP DEFAULT;
       public       postgres    false    248    247    248            z           2604    16778     course_setting course_setting_id    DEFAULT     �   ALTER TABLE ONLY public.course_setting ALTER COLUMN course_setting_id SET DEFAULT nextval('public.course_setting_course_setting_id_seq'::regclass);
 O   ALTER TABLE public.course_setting ALTER COLUMN course_setting_id DROP DEFAULT;
       public       postgres    false    243    244    244            �           2604    16979     daily_exercise daily_exercise_id    DEFAULT     �   ALTER TABLE ONLY public.daily_exercise ALTER COLUMN daily_exercise_id SET DEFAULT nextval('public.daily_exercise_daily_exercise_id_seq'::regclass);
 O   ALTER TABLE public.daily_exercise ALTER COLUMN daily_exercise_id DROP DEFAULT;
       public       postgres    false    265    264    265            �           2604    17203 ,   daily_exercise_skill daily_exercise_skill_id    DEFAULT     �   ALTER TABLE ONLY public.daily_exercise_skill ALTER COLUMN daily_exercise_skill_id SET DEFAULT nextval('public.daily_exercise_skill_daily_exercise_id_seq'::regclass);
 [   ALTER TABLE public.daily_exercise_skill ALTER COLUMN daily_exercise_skill_id DROP DEFAULT;
       public       postgres    false    287    286    287            �           2604    16917    employee_unit employee_unit_id    DEFAULT     �   ALTER TABLE ONLY public.employee_unit ALTER COLUMN employee_unit_id SET DEFAULT nextval('public.employee_unit_employee_unit_id_seq'::regclass);
 M   ALTER TABLE public.employee_unit ALTER COLUMN employee_unit_id DROP DEFAULT;
       public       postgres    false    258    259    259            �           2604    17062 "   extracurricular extracurricular_id    DEFAULT     �   ALTER TABLE ONLY public.extracurricular ALTER COLUMN extracurricular_id SET DEFAULT nextval('public.extracurricular_extracurricular_id_seq'::regclass);
 Q   ALTER TABLE public.extracurricular ALTER COLUMN extracurricular_id DROP DEFAULT;
       public       postgres    false    273    272    273            �           2604    17127     friendly_value friendly_value_id    DEFAULT     �   ALTER TABLE ONLY public.friendly_value ALTER COLUMN friendly_value_id SET DEFAULT nextval('public.friendly_value_friendly_value_id_seq'::regclass);
 O   ALTER TABLE public.friendly_value ALTER COLUMN friendly_value_id DROP DEFAULT;
       public       postgres    false    279    278    279            �           2604    17250     input_analysis input_analysis_id    DEFAULT     �   ALTER TABLE ONLY public.input_analysis ALTER COLUMN input_analysis_id SET DEFAULT nextval('public.input_analysis_input_analysis_id_seq'::regclass);
 O   ALTER TABLE public.input_analysis ALTER COLUMN input_analysis_id DROP DEFAULT;
       public       postgres    false    288    289    289            �           2604    17318 *   input_analysis_tema input_analysis_tema_id    DEFAULT     �   ALTER TABLE ONLY public.input_analysis_tema ALTER COLUMN input_analysis_tema_id SET DEFAULT nextval('public.input_analysis_tema_input_analysis_tema_id_seq'::regclass);
 Y   ALTER TABLE public.input_analysis_tema ALTER COLUMN input_analysis_tema_id DROP DEFAULT;
       public       postgres    false    297    296    297            �           2604    17392    institution institution_id    DEFAULT     �   ALTER TABLE ONLY public.institution ALTER COLUMN institution_id SET DEFAULT nextval('public.institution_institution_id_seq'::regclass);
 I   ALTER TABLE public.institution ALTER COLUMN institution_id DROP DEFAULT;
       public       postgres    false    301    300    301            �           2604    17292 ,   list_question_per_kd list_question_per_kd_id    DEFAULT     �   ALTER TABLE ONLY public.list_question_per_kd ALTER COLUMN list_question_per_kd_id SET DEFAULT nextval('public.list_question_per_kd_list_question_per_kd_id_seq'::regclass);
 [   ALTER TABLE public.list_question_per_kd ALTER COLUMN list_question_per_kd_id DROP DEFAULT;
       public       postgres    false    292    293    293            �           2604    17305 0   list_question_per_tema list_question_per_tema_id    DEFAULT     �   ALTER TABLE ONLY public.list_question_per_tema ALTER COLUMN list_question_per_tema_id SET DEFAULT nextval('public.list_question_per_tema_list_question_per_tema_id_seq'::regclass);
 _   ALTER TABLE public.list_question_per_tema ALTER COLUMN list_question_per_tema_id DROP DEFAULT;
       public       postgres    false    294    295    295            q           2604    16621    m_building building_id    DEFAULT     �   ALTER TABLE ONLY public.m_building ALTER COLUMN building_id SET DEFAULT nextval('public.m_building_building_id_seq'::regclass);
 E   ALTER TABLE public.m_building ALTER COLUMN building_id DROP DEFAULT;
       public       postgres    false    226    225    226            i           2604    16473    m_class_grade class_grade_id    DEFAULT     �   ALTER TABLE ONLY public.m_class_grade ALTER COLUMN class_grade_id SET DEFAULT nextval('public.m_class_grade_class_grade_id_seq'::regclass);
 K   ALTER TABLE public.m_class_grade ALTER COLUMN class_grade_id DROP DEFAULT;
       public       postgres    false    210    209    210            l           2604    16521    m_class_room class_room_id    DEFAULT     �   ALTER TABLE ONLY public.m_class_room ALTER COLUMN class_room_id SET DEFAULT nextval('public.m_class_room_class_room_id_seq'::regclass);
 I   ALTER TABLE public.m_class_room ALTER COLUMN class_room_id DROP DEFAULT;
       public       postgres    false    216    215    216            k           2604    16500    m_course course_id    DEFAULT     x   ALTER TABLE ONLY public.m_course ALTER COLUMN course_id SET DEFAULT nextval('public.m_course_course_id_seq'::regclass);
 A   ALTER TABLE public.m_course ALTER COLUMN course_id DROP DEFAULT;
       public       postgres    false    213    214    214            v           2604    16707    m_department department_id    DEFAULT     �   ALTER TABLE ONLY public.m_department ALTER COLUMN department_id SET DEFAULT nextval('public.m_department_department_id_seq'::regclass);
 I   ALTER TABLE public.m_department ALTER COLUMN department_id DROP DEFAULT;
       public       postgres    false    236    235    236            e           2604    16414 $   m_education_level education_level_id    DEFAULT     �   ALTER TABLE ONLY public.m_education_level ALTER COLUMN education_level_id SET DEFAULT nextval('public.m_education_level_education_level_id_seq'::regclass);
 S   ALTER TABLE public.m_education_level ALTER COLUMN education_level_id DROP DEFAULT;
       public       postgres    false    202    201    202            x           2604    16734    m_employee employee_id    DEFAULT     �   ALTER TABLE ONLY public.m_employee ALTER COLUMN employee_id SET DEFAULT nextval('public.m_employee_employee_id_seq'::regclass);
 E   ALTER TABLE public.m_employee ALTER COLUMN employee_id DROP DEFAULT;
       public       postgres    false    240    239    240            s           2604    16640    m_floor floor_id    DEFAULT     t   ALTER TABLE ONLY public.m_floor ALTER COLUMN floor_id SET DEFAULT nextval('public.m_floor_floor_id_seq'::regclass);
 ?   ALTER TABLE public.m_floor ALTER COLUMN floor_id DROP DEFAULT;
       public       postgres    false    229    230    230            t           2604    16653 
   m_kd kd_id    DEFAULT     h   ALTER TABLE ONLY public.m_kd ALTER COLUMN kd_id SET DEFAULT nextval('public.m_kd_kd_id_seq'::regclass);
 9   ALTER TABLE public.m_kd ALTER COLUMN kd_id DROP DEFAULT;
       public       postgres    false    232    231    232            u           2604    16674    m_kd_detail kd_detail_id    DEFAULT     �   ALTER TABLE ONLY public.m_kd_detail ALTER COLUMN kd_detail_id SET DEFAULT nextval('public.m_kd_detail_kd_detail_id_seq'::regclass);
 G   ALTER TABLE public.m_kd_detail ALTER COLUMN kd_detail_id DROP DEFAULT;
       public       postgres    false    233    234    234            r           2604    16632    m_kkm kkm_id    DEFAULT     l   ALTER TABLE ONLY public.m_kkm ALTER COLUMN kkm_id SET DEFAULT nextval('public.m_kkm_kkm_id_seq'::regclass);
 ;   ALTER TABLE public.m_kkm ALTER COLUMN kkm_id DROP DEFAULT;
       public       postgres    false    227    228    228            j           2604    16489    m_lesson_hour lesson_hour_id    DEFAULT     �   ALTER TABLE ONLY public.m_lesson_hour ALTER COLUMN lesson_hour_id SET DEFAULT nextval('public.m_lesson_hour_lesson_hour_id_seq'::regclass);
 K   ALTER TABLE public.m_lesson_hour ALTER COLUMN lesson_hour_id DROP DEFAULT;
       public       postgres    false    211    212    212            p           2604    16600    m_parent parent_id    DEFAULT     x   ALTER TABLE ONLY public.m_parent ALTER COLUMN parent_id SET DEFAULT nextval('public.m_parent_parent_id_seq'::regclass);
 A   ALTER TABLE public.m_parent ALTER COLUMN parent_id DROP DEFAULT;
       public       postgres    false    223    224    224            w           2604    16718    m_position position_id    DEFAULT     �   ALTER TABLE ONLY public.m_position ALTER COLUMN position_id SET DEFAULT nextval('public.m_position_position_id_seq'::regclass);
 E   ALTER TABLE public.m_position ALTER COLUMN position_id DROP DEFAULT;
       public       postgres    false    237    238    238            h           2604    16457    m_step_study step_study_id    DEFAULT     �   ALTER TABLE ONLY public.m_step_study ALTER COLUMN step_study_id SET DEFAULT nextval('public.m_step_study_step_study_id_seq'::regclass);
 I   ALTER TABLE public.m_step_study ALTER COLUMN step_study_id DROP DEFAULT;
       public       postgres    false    208    207    208            n           2604    16563    m_student student_id    DEFAULT     |   ALTER TABLE ONLY public.m_student ALTER COLUMN student_id SET DEFAULT nextval('public.m_student_student_id_seq'::regclass);
 C   ALTER TABLE public.m_student ALTER COLUMN student_id DROP DEFAULT;
       public       postgres    false    219    220    220            m           2604    16537    m_study_group study_group_id    DEFAULT     �   ALTER TABLE ONLY public.m_study_group ALTER COLUMN study_group_id SET DEFAULT nextval('public.m_study_group_study_group_id_seq'::regclass);
 K   ALTER TABLE public.m_study_group ALTER COLUMN study_group_id DROP DEFAULT;
       public       postgres    false    218    217    218            f           2604    16425    m_unit unit_id    DEFAULT     p   ALTER TABLE ONLY public.m_unit ALTER COLUMN unit_id SET DEFAULT nextval('public.m_unit_unit_id_seq'::regclass);
 =   ALTER TABLE public.m_unit ALTER COLUMN unit_id DROP DEFAULT;
       public       postgres    false    204    203    204            g           2604    16441    m_unit_year unit_year_id    DEFAULT     �   ALTER TABLE ONLY public.m_unit_year ALTER COLUMN unit_year_id SET DEFAULT nextval('public.m_unit_year_unit_year_id_seq'::regclass);
 G   ALTER TABLE public.m_unit_year ALTER COLUMN unit_year_id DROP DEFAULT;
       public       postgres    false    206    205    206                       2604    16900    menu menu_id    DEFAULT     l   ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);
 ;   ALTER TABLE public.menu ALTER COLUMN menu_id DROP DEFAULT;
       public       postgres    false    256    257    257            c           2604    16389    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �           2604    17083    observasi observasi_id    DEFAULT     �   ALTER TABLE ONLY public.observasi ALTER COLUMN observasi_id SET DEFAULT nextval('public.observasi_observasi_id_seq'::regclass);
 E   ALTER TABLE public.observasi ALTER COLUMN observasi_id DROP DEFAULT;
       public       postgres    false    275    274    275            o           2604    16589    parlookup parlookup_id    DEFAULT     �   ALTER TABLE ONLY public.parlookup ALTER COLUMN parlookup_id SET DEFAULT nextval('public.parlookup_parlookup_id_seq'::regclass);
 E   ALTER TABLE public.parlookup ALTER COLUMN parlookup_id DROP DEFAULT;
       public       postgres    false    221    222    222            �           2604    17105    pd pd_id    DEFAULT     d   ALTER TABLE ONLY public.pd ALTER COLUMN pd_id SET DEFAULT nextval('public.pd_pd_id_seq'::regclass);
 7   ALTER TABLE public.pd ALTER COLUMN pd_id DROP DEFAULT;
       public       postgres    false    276    277    277            }           2604    16847    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    250    249    250            �           2604    17028    personality personality_id    DEFAULT     �   ALTER TABLE ONLY public.personality ALTER COLUMN personality_id SET DEFAULT nextval('public.personality_personality_id_seq'::regclass);
 I   ALTER TABLE public.personality ALTER COLUMN personality_id DROP DEFAULT;
       public       postgres    false    268    269    269            �           2604    17041 $   physical_student physical_student_id    DEFAULT     �   ALTER TABLE ONLY public.physical_student ALTER COLUMN physical_student_id SET DEFAULT nextval('public.physical_student_physical_student_id_seq'::regclass);
 S   ALTER TABLE public.physical_student ALTER COLUMN physical_student_id DROP DEFAULT;
       public       postgres    false    270    271    271            �           2604    17406    prestation prestation_id    DEFAULT     �   ALTER TABLE ONLY public.prestation ALTER COLUMN prestation_id SET DEFAULT nextval('public.prestation_prestation_id_seq'::regclass);
 G   ALTER TABLE public.prestation ALTER COLUMN prestation_id DROP DEFAULT;
       public       postgres    false    302    303    303            �           2604    17276    quiz_per_kd quiz_per_kd_id    DEFAULT     �   ALTER TABLE ONLY public.quiz_per_kd ALTER COLUMN quiz_per_kd_id SET DEFAULT nextval('public.quiz_per_kd_quiz_per_kd_id_seq'::regclass);
 I   ALTER TABLE public.quiz_per_kd ALTER COLUMN quiz_per_kd_id DROP DEFAULT;
       public       postgres    false    291    290    291            �           2604    17483    raport raport_id    DEFAULT     t   ALTER TABLE ONLY public.raport ALTER COLUMN raport_id SET DEFAULT nextval('public.raport_raport_id_seq'::regclass);
 ?   ALTER TABLE public.raport ALTER COLUMN raport_id DROP DEFAULT;
       public       postgres    false    308    309    309            �           2604    17549    raport_pts raport_pts_id    DEFAULT     �   ALTER TABLE ONLY public.raport_pts ALTER COLUMN raport_pts_id SET DEFAULT nextval('public.raport_pts_raport_pts_id_seq'::regclass);
 G   ALTER TABLE public.raport_pts ALTER COLUMN raport_pts_id DROP DEFAULT;
       public       postgres    false    312    313    313            ~           2604    16855    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    252    251    252            �           2604    17374 0   setting_daily_exercise setting_daily_exercise_id    DEFAULT     �   ALTER TABLE ONLY public.setting_daily_exercise ALTER COLUMN setting_daily_exercise_id SET DEFAULT nextval('public.setting_daily_exercise_setting_daily_exercise_id_seq'::regclass);
 _   ALTER TABLE public.setting_daily_exercise ALTER COLUMN setting_daily_exercise_id DROP DEFAULT;
       public       postgres    false    299    298    299            �           2604    16935 &   structure_tematic structure_tematic_id    DEFAULT     �   ALTER TABLE ONLY public.structure_tematic ALTER COLUMN structure_tematic_id SET DEFAULT nextval('public.structure_tematic_structure_tematic_id_seq'::regclass);
 U   ALTER TABLE public.structure_tematic ALTER COLUMN structure_tematic_id DROP DEFAULT;
       public       postgres    false    260    261    261            �           2604    16956 4   structure_tematic_detail structure_tematic_detail_id    DEFAULT     �   ALTER TABLE ONLY public.structure_tematic_detail ALTER COLUMN structure_tematic_detail_id SET DEFAULT nextval('public.structure_tematic_detail_structure_tematic_detail_id_seq'::regclass);
 c   ALTER TABLE public.structure_tematic_detail ALTER COLUMN structure_tematic_detail_id DROP DEFAULT;
       public       postgres    false    263    262    263            y           2604    16755 *   study_group_setting study_group_setting_id    DEFAULT     �   ALTER TABLE ONLY public.study_group_setting ALTER COLUMN study_group_setting_id SET DEFAULT nextval('public.study_group_setting_study_group_setting_id_seq'::regclass);
 Y   ALTER TABLE public.study_group_setting ALTER COLUMN study_group_setting_id DROP DEFAULT;
       public       postgres    false    241    242    242            �           2604    17509    summary_kd summary_kd_id    DEFAULT     �   ALTER TABLE ONLY public.summary_kd ALTER COLUMN summary_kd_id SET DEFAULT nextval('public.summary_kd_summary_kd_id_seq'::regclass);
 G   ALTER TABLE public.summary_kd ALTER COLUMN summary_kd_id DROP DEFAULT;
       public       postgres    false    311    310    311            �           2604    17455    summary_skill summary_skill_id    DEFAULT     �   ALTER TABLE ONLY public.summary_skill ALTER COLUMN summary_skill_id SET DEFAULT nextval('public.summary_skill_summary_skill_id_seq'::regclass);
 M   ALTER TABLE public.summary_skill ALTER COLUMN summary_skill_id DROP DEFAULT;
       public       postgres    false    306    307    307            �           2604    17432 "   summary_tematic summary_tematic_id    DEFAULT     �   ALTER TABLE ONLY public.summary_tematic ALTER COLUMN summary_tematic_id SET DEFAULT nextval('public.summary_tematic_summary_tematic_id_seq'::regclass);
 Q   ALTER TABLE public.summary_tematic ALTER COLUMN summary_tematic_id DROP DEFAULT;
       public       postgres    false    305    304    305            �           2604    17185    tahfizh tahfizh_id    DEFAULT     x   ALTER TABLE ONLY public.tahfizh ALTER COLUMN tahfizh_id SET DEFAULT nextval('public.tahfizh_tahfizh_id_seq'::regclass);
 A   ALTER TABLE public.tahfizh ALTER COLUMN tahfizh_id DROP DEFAULT;
       public       postgres    false    285    284    285            �           2604    17167    tahsin tahsin_id    DEFAULT     t   ALTER TABLE ONLY public.tahsin ALTER COLUMN tahsin_id SET DEFAULT nextval('public.tahsin_tahsin_id_seq'::regclass);
 ?   ALTER TABLE public.tahsin ALTER COLUMN tahsin_id DROP DEFAULT;
       public       postgres    false    283    282    283            �           2604    17149    teacher_note teacher_note_id    DEFAULT     �   ALTER TABLE ONLY public.teacher_note ALTER COLUMN teacher_note_id SET DEFAULT nextval('public.teacher_note_teacher_note_id_seq'::regclass);
 K   ALTER TABLE public.teacher_note ALTER COLUMN teacher_note_id DROP DEFAULT;
       public       postgres    false    281    280    281            {           2604    16801 "   teacher_setting teacher_setting_id    DEFAULT     �   ALTER TABLE ONLY public.teacher_setting ALTER COLUMN teacher_setting_id SET DEFAULT nextval('public.teacher_setting_teacher_setting_id_seq'::regclass);
 Q   ALTER TABLE public.teacher_setting ALTER COLUMN teacher_setting_id DROP DEFAULT;
       public       postgres    false    245    246    246            d           2604    16397    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198    199            L          0    17007    absensi 
   TABLE DATA               �   COPY public.absensi (absensi_id, student_id, absensi_type, absensi_total, month, step_study_id, absensi_insert_by, absensi_insert_time, absensi_update_time, absensi_update_by, absensi_delete_time, absensi_delete_by) FROM stdin;
    public       postgres    false    267   |G      9          0    16821    class_advisor 
   TABLE DATA                  COPY public.class_advisor (class_advisor_id, employee_id, unit_year_id, study_group_id, class_advisor_insert_by, class_advisor_insert_time, class_advisor_update_time, class_advisor_update_by, class_advisor_delete_time, class_advisor_delete_by) FROM stdin;
    public       postgres    false    248   �I      5          0    16775    course_setting 
   TABLE DATA               -  COPY public.course_setting (course_setting_id, course_id, study_group_id, course_setting_status, course_setting_insert_by, course_setting_insert_time, course_setting_update_time, course_setting_update_by, course_setting_delete_time, course_setting_delete_by, unit_year_id, class_grade_id) FROM stdin;
    public       postgres    false    244   �J      J          0    16976    daily_exercise 
   TABLE DATA               A  COPY public.daily_exercise (daily_exercise_id, student_id, kd_detail_id, structure_tematic_id, kd_type, score, daily_exercise_type, daily_exercise_insert_by, daily_exercise_insert_time, daily_exercise_update_time, daily_exercise_update_by, daily_exercise_delete_time, daily_exercise_delete_by, step_study_id) FROM stdin;
    public       postgres    false    265   �L      `          0    17200    daily_exercise_skill 
   TABLE DATA               H  COPY public.daily_exercise_skill (daily_exercise_skill_id, student_id, kd_id, skill_value, skill_type, daily_exercise_skill_insert_by, daily_exercise_skill_insert_time, daily_exercise_skill_update_time, daily_exercise_skill_update_by, daily_exercise_skill_delete_time, daily_exercise_skill_delete_by, step_study_id) FROM stdin;
    public       postgres    false    287   mS      D          0    16914    employee_unit 
   TABLE DATA               �   COPY public.employee_unit (employee_unit_id, unit_id, employee_id, employee_unit_insert_by, employee_unit_insert_time, employee_unit_update_time, employee_unit_update_by, employee_unit_delete_time, employee_unit_delete_by) FROM stdin;
    public       postgres    false    259   KV      R          0    17059    extracurricular 
   TABLE DATA                 COPY public.extracurricular (extracurricular_id, student_id, step_study_id, type, value, "desc", extracurricular_insert_by, extracurricular_insert_time, extracurricular_update_time, extracurricular_update_by, extracurricular_delete_time, extracurricular_delete_by) FROM stdin;
    public       postgres    false    273   �V      X          0    17124    friendly_value 
   TABLE DATA               <  COPY public.friendly_value (friendly_value_id, student_id, step_study_id, friendly_value_type, friendly_value_category, friendly_value_value, friendly_value_insert_by, friendly_value_insert_time, friendly_value_update_time, friendly_value_update_by, friendly_value_delete_time, friendly_value_delete_by) FROM stdin;
    public       postgres    false    279   �V      b          0    17247    input_analysis 
   TABLE DATA               A  COPY public.input_analysis (input_analysis_id, kd_id, student_id, number_question, value_quality, total_value, input_analysis_type, input_analysis_insert_by, input_analysis_insert_time, input_analysis_update_time, input_analysis_update_by, input_analysis_delete_time, input_analysis_delete_by, step_study_id) FROM stdin;
    public       postgres    false    289   �V      j          0    17315    input_analysis_tema 
   TABLE DATA               u  COPY public.input_analysis_tema (input_analysis_tema_id, kd_id, student_id, number_question, value_quality, total_value, input_analysis_tema_type, input_analysis_tema_insert_by, input_analysis_tema_insert_time, input_analysis_tema_update_time, input_analysis_tema_update_by, input_analysis_tema_delete_time, input_analysis_tema_delete_by, structure_tematic_id) FROM stdin;
    public       postgres    false    297   ik      n          0    17389    institution 
   TABLE DATA               �   COPY public.institution (institution_id, institution_name, institution_desc, institution_address, institution_telp, institution_email, institution_start_time, institution_end_time, created_at, updated_at, institution_status) FROM stdin;
    public       postgres    false    301   �      f          0    17289    list_question_per_kd 
   TABLE DATA               @  COPY public.list_question_per_kd (list_question_per_kd_id, quiz_per_kd_id, number_question, quality_question, list_question_per_kd_insert_by, list_question_per_kd_insert_time, list_question_per_kd_update_time, list_question_per_kd_update_by, list_question_per_kd_delete_time, list_question_per_kd_delete_by) FROM stdin;
    public       postgres    false    293   j�      h          0    17302    list_question_per_tema 
   TABLE DATA               ]  COPY public.list_question_per_tema (list_question_per_tema_id, number_question, quality_question, list_question_per_tema_insert_by, list_question_per_tema_insert_time, list_question_per_tema_update_time, list_question_per_tema_update_by, list_question_per_tema_delete_time, list_question_per_tema_delete_by, structure_tematic_detail_id) FROM stdin;
    public       postgres    false    295   �      #          0    16618 
   m_building 
   TABLE DATA               �   COPY public.m_building (building_id, building_name, building_desc, building_status, building_insert_by, building_insert_time, building_update_time, building_update_by, building_delete_time, building_delete_by) FROM stdin;
    public       postgres    false    226   A�                0    16470    m_class_grade 
   TABLE DATA                 COPY public.m_class_grade (class_grade_id, unit_id, class_grade_order, class_grade_status, class_grade_name, class_grade_desc, class_grade_insert_by, class_grade_insert_time, class_grade_update_time, class_grade_update_by, class_grade_delete_time, class_grade_delete_by) FROM stdin;
    public       postgres    false    210   ^�                0    16518    m_class_room 
   TABLE DATA                 COPY public.m_class_room (class_room_id, unit_id, class_room_name, class_room_text, class_room_status, class_room_desc, class_room_insert_by, class_room_insert_time, class_room_update_time, class_room_update_by, class_room_delete_time, class_room_delete_by, floor_id) FROM stdin;
    public       postgres    false    216   �                0    16497    m_course 
   TABLE DATA                 COPY public.m_course (course_id, unit_id, class_grade_id, course_status, course_name, course_code, course_desc, course_insert_by, course_insert_time, course_update_time, course_update_by, course_delete_time, course_delete_by, kkm_value, course_type) FROM stdin;
    public       postgres    false    214   T�      -          0    16704    m_department 
   TABLE DATA               �   COPY public.m_department (department_id, department_name, department_desc, department_status, department_insert_by, department_insert_time, department_update_time, department_update_by, department_delete_time, department_delete_by) FROM stdin;
    public       postgres    false    236   �                0    16411    m_education_level 
   TABLE DATA               -  COPY public.m_education_level (education_level_id, education_level_name, education_level_status, education_level_resume, education_level_insert_by, education_level_insert_time, education_level_update_time, education_level_update_by, education_level_delete_time, education_level_delete_by) FROM stdin;
    public       postgres    false    202   �      1          0    16731 
   m_employee 
   TABLE DATA               ?  COPY public.m_employee (employee_id, employee_status, employee_id_card, position_id, user_id, employee_type, employee_name, employee_working_status, employee_nik, employee_gender, employee_birth_place, employee_birth_date, employee_religion, employee_identity, employee_last_education, employee_marital_status, employee_hp, employee_website, employee_telp, employee_address, employee_photo, employee_desc, employee_email, employee_insert_by, employee_insert_time, employee_update_time, employee_update_by, employee_delete_time, employee_delete_by, employee_role) FROM stdin;
    public       postgres    false    240   #�      '          0    16637    m_floor 
   TABLE DATA               �   COPY public.m_floor (floor_id, building_id, floor_name, floor_desc, floor_insert_by, floor_insert_time, floor_update_time, floor_update_by, floor_delete_time, floor_delete_by) FROM stdin;
    public       postgres    false    230   Ý      )          0    16650    m_kd 
   TABLE DATA               �   COPY public.m_kd (kd_id, unit_year_id, course_id, kd_code, kd_name, kd_desc, kd_type, kd_insert_by, kd_insert_time, kd_update_time, kd_update_by, kd_delete_time, kd_delete_by, unit_id, course_setting_id) FROM stdin;
    public       postgres    false    232   ��      +          0    16671    m_kd_detail 
   TABLE DATA               �   COPY public.m_kd_detail (kd_detail_id, kd_id, step_study_id, kd_detail_insert_by, kd_detail_insert_time, kd_detail_update_time, kd_detail_update_by, kd_detail_delete_time, kd_detail_delete_by) FROM stdin;
    public       postgres    false    234   ��      %          0    16629    m_kkm 
   TABLE DATA               �   COPY public.m_kkm (kkm_id, kkm_value, kkm_a, kkm_b, kkm_c, kkm_d, kkm_insert_by, kkm_insert_time, kkm_update_time, kkm_update_by, kkm_delete_time, kkm_delete_by, step_study_id, course_id, class_grade_id) FROM stdin;
    public       postgres    false    228   ��                0    16486    m_lesson_hour 
   TABLE DATA               8  COPY public.m_lesson_hour (lesson_hour_id, lesson_day, hour_to, lesson_hour_type, lesson_hour_start, lesson_hour_end, lesson_hour_desc, lesson_hour_status, lesson_hour_insert_by, lesson_hour_insert_time, lesson_hour_update_time, lesson_hour_update_by, lesson_hour_delete_time, lesson_hour_delete_by) FROM stdin;
    public       postgres    false    212   ��      !          0    16597    m_parent 
   TABLE DATA               �  COPY public.m_parent (parent_id, student_id, user_id, parent_name, parent_id_card, parent_status, parent_nickname, parent_gender, parent_birth_place, parent_birth_date, parent_address, parent_hp, parent_telp, parent_email, parent_photo, parent_hobby, parent_religion, parent_insert_by, parent_insert_time, parent_update_time, parent_update_by, parent_delete_time, parent_delete_by) FROM stdin;
    public       postgres    false    224   ��      /          0    16715 
   m_position 
   TABLE DATA               �   COPY public.m_position (position_id, department_id, position_name, position_desc, position_status, position_insert_by, position_insert_time, position_update_time, position_update_by, position_delete_time, position_delete_by) FROM stdin;
    public       postgres    false    238   ު                0    16454    m_step_study 
   TABLE DATA               $  COPY public.m_step_study (step_study_id, unit_year_id, step_study_name, step_study_desc, step_study_start, step_study_end, step_study_status, step_study_insert_by, step_study_insert_time, step_study_update_time, step_study_update_by, step_study_delete_time, step_study_delete_by) FROM stdin;
    public       postgres    false    208   ��                0    16560 	   m_student 
   TABLE DATA               y  COPY public.m_student (student_id, unit_id, class_grade_id, user_id, student_name, student_id_card, student_status, student_nickname, student_gender, student_birth_place, student_birth_date, student_address, student_hp, student_telp, student_email, student_father_hp, student_mother_hp, student_child_to, student_brother, student_child_status, student_photo, student_hobby, student_orphan_status, student_school_origin, student_school_origin_address, student_nisn, student_test_number, student_achievement, student_blood_type, student_religion, student_kk, student_ktp, student_ijazah, student_mother_name, student_father_name, student_mother_job, student_father_job, student_father_income, student_mother_income, student_insert_by, student_insert_time, student_update_time, student_update_by, student_delete_time, student_delete_by, student_tall, student_weight, student_nis) FROM stdin;
    public       postgres    false    220   }�                0    16534    m_study_group 
   TABLE DATA               '  COPY public.m_study_group (study_group_id, unit_id, class_grade_id, class_room_id, study_group_status, study_group_name, study_group_desc, study_group_insert_by, study_group_insert_time, study_group_update_time, study_group_update_by, study_group_delete_time, study_group_delete_by) FROM stdin;
    public       postgres    false    218   c                0    16422    m_unit 
   TABLE DATA                  COPY public.m_unit (unit_id, education_level_id, unit_name, unit_desc, unit_logo, unit_prefix, unit_address, unit_telp, unit_email, unit_website, unit_status, unit_insert_by, unit_insert_time, unit_update_time, unit_update_by, unit_delete_time, unit_delete_by, foundation_id) FROM stdin;
    public       postgres    false    204   �d                0    16438    m_unit_year 
   TABLE DATA               $  COPY public.m_unit_year (unit_year_id, unit_id, unit_year_status, unit_year_name, unit_year_prefix, unit_year_start, unit_year_end, unit_year_desc, unit_year_insert_by, unit_year_insert_time, unit_year_update_time, unit_year_update_by, unit_year_delete_time, unit_year_delete_by) FROM stdin;
    public       postgres    false    206   He      B          0    16897    menu 
   TABLE DATA               {   COPY public.menu (menu_id, menu_name, menu_desc, menu_url, menu_parent, type, created_at, updated_at, no_urut) FROM stdin;
    public       postgres    false    257   �e                0    16386 
   migrations 
   TABLE DATA               :   COPY public.migrations (id, migration, batch) FROM stdin;
    public       postgres    false    197   ^l      >          0    16858    model_has_permissions 
   TABLE DATA               T   COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
    public       postgres    false    253   s      ?          0    16869    model_has_roles 
   TABLE DATA               H   COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
    public       postgres    false    254   0s      T          0    17080 	   observasi 
   TABLE DATA                 COPY public.observasi (observasi_id, student_id, step_study_id, observasi_type, observasi_category, observasi_insert_by, observasi_insert_time, observasi_update_time, observasi_update_by, observasi_delete_time, observasi_delete_by, observasi_value) FROM stdin;
    public       postgres    false    275   +t                0    16586 	   parlookup 
   TABLE DATA               q   COPY public.parlookup (parlookup_id, name, value, category, "desc", created_at, updated_at, unit_id) FROM stdin;
    public       postgres    false    222   �      	          0    16405    password_resets 
   TABLE DATA               C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public       postgres    false    200   х      V          0    17102    pd 
   TABLE DATA               �   COPY public.pd (pd_id, student_id, step_study_id, pd_type, pd_category, pd_value, pd_insert_by, pd_insert_time, pd_update_time, pd_update_by, pd_delete_time, pd_delete_by) FROM stdin;
    public       postgres    false    277   �      ;          0    16844    permissions 
   TABLE DATA               \   COPY public.permissions (id, name, guard_name, created_at, updated_at, menu_id) FROM stdin;
    public       postgres    false    250   �      N          0    17025    personality 
   TABLE DATA                 COPY public.personality (personality_id, student_id, personality_type, personality_value, personality_insert_by, personality_insert_time, personality_update_time, personality_update_by, personality_delete_time, personality_delete_by, step_study_id) FROM stdin;
    public       postgres    false    269   }�      P          0    17038    physical_student 
   TABLE DATA               :  COPY public.physical_student (physical_student_id, student_id, physical_type, physical_category, physical_value, step_study_id, physical_student_insert_by, physical_student_insert_time, physical_student_update_time, physical_student_update_by, physical_student_delete_time, physical_student_delete_by) FROM stdin;
    public       postgres    false    271   D�      p          0    17403 
   prestation 
   TABLE DATA               �   COPY public.prestation (prestation_id, student_id, step_study_id, type, value, "desc", prestation_insert_by, prestation_insert_time, prestation_update_time, prestation_update_by, prestation_delete_time, prestation_delete_by) FROM stdin;
    public       postgres    false    303   �      d          0    17273    quiz_per_kd 
   TABLE DATA                 COPY public.quiz_per_kd (quiz_per_kd_id, kd_id, total_question, type_question, description, quiz_per_kd_insert_by, quiz_per_kd_insert_time, quiz_per_kd_update_time, quiz_per_kd_update_by, quiz_per_kd_delete_time, quiz_per_kd_delete_by, step_study_id) FROM stdin;
    public       postgres    false    291   �      v          0    17480    raport 
   TABLE DATA               H  COPY public.raport (raport_id, course_id, student_id, step_study_id, total_pengetahuan, total_keterampilan, predikat_pengetahuan, predikat_keterampilan, keterangan_pengetahuan, keterangan_keterampilan, raport_insert_by, raport_insert_time, raport_update_time, raport_update_by, raport_delete_time, raport_delete_by) FROM stdin;
    public       postgres    false    309   ��      z          0    17546 
   raport_pts 
   TABLE DATA               h  COPY public.raport_pts (raport_pts_id, course_id, student_id, step_study_id, total_pengetahuan, total_keterampilan, predikat_pengetahuan, predikat_keterampilan, keterangan_pengetahuan, keterangan_keterampilan, raport_pts_insert_by, raport_pts_insert_time, raport_pts_update_time, raport_pts_update_by, raport_pts_delete_time, raport_pts_delete_by) FROM stdin;
    public       postgres    false    313   Ϟ      @          0    16880    role_has_permissions 
   TABLE DATA               F   COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
    public       postgres    false    255   X�      =          0    16852    roles 
   TABLE DATA               M   COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
    public       postgres    false    252   ��      l          0    17371    setting_daily_exercise 
   TABLE DATA               �   COPY public.setting_daily_exercise (setting_daily_exercise_id, kd_id, skill_type, step_study_id, created_at, updated_at) FROM stdin;
    public       postgres    false    299   :�      F          0    16932    structure_tematic 
   TABLE DATA               p  COPY public.structure_tematic (structure_tematic_id, structure_tematic_name, study_group_id, step_study_id, structure_tematic_desc, structure_tematic_question, structure_tematic_insert_by, structure_tematic_insert_time, structure_tematic_update_time, structure_tematic_update_by, structure_tematic_delete_time, structure_tematic_delete_by, class_grade_id) FROM stdin;
    public       postgres    false    261   �      H          0    16953    structure_tematic_detail 
   TABLE DATA               �  COPY public.structure_tematic_detail (structure_tematic_detail_id, structure_tematic_id, total_question, structure_tematic_detail_insert_by, structure_tematic_detail_insert_time, structure_tematic_detail_update_time, structure_tematic_detail_update_by, structure_tematic_detail_delete_time, structure_tematic_detail_delete_by, kd_id, question_uts, question_uas, question_daily, type_question) FROM stdin;
    public       postgres    false    263   o�      3          0    16752    study_group_setting 
   TABLE DATA               K  COPY public.study_group_setting (study_group_setting_id, student_id, study_group_id, study_group_setting_status, study_group_setting_insert_by, study_group_setting_insert_time, study_group_setting_update_time, study_group_setting_update_by, study_group_setting_delete_time, study_group_setting_delete_by, unit_year_id) FROM stdin;
    public       postgres    false    242   �      x          0    17506 
   summary_kd 
   TABLE DATA               �   COPY public.summary_kd (summary_kd_id, kd_id, student_id, step_study_id, type, total, summary_kd_insert_by, summary_kd_insert_time, summary_kd_update_time, summary_kd_update_by, summary_kd_delete_time, summary_kd_delete_by) FROM stdin;
    public       postgres    false    311   _�      t          0    17452    summary_skill 
   TABLE DATA                 COPY public.summary_skill (summary_skill_id, kd_id, student_id, step_study_id, total_skill, summary_skill_insert_by, summary_skill_insert_time, summary_skill_update_time, summary_skill_update_by, summary_skill_delete_time, summary_skill_delete_by) FROM stdin;
    public       postgres    false    307   ��      r          0    17429    summary_tematic 
   TABLE DATA               *  COPY public.summary_tematic (summary_tematic_id, kd_id, student_id, structure_tematic_id, type, total, summary_tematic_insert_by, summary_tematic_insert_time, summary_tematic_update_time, summary_tematic_update_by, summary_tematic_delete_time, summary_tematic_delete_by, step_study_id) FROM stdin;
    public       postgres    false    305   z�      ^          0    17182    tahfizh 
   TABLE DATA               �   COPY public.tahfizh (tahfizh_id, tahfizh_type, tahfizh_value, student_id, step_study_id, tahfizh_insert_by, tahfizh_insert_time, tahfizh_update_time, tahfizh_update_by, tahfizh_delete_time, tahfizh_delete_by) FROM stdin;
    public       postgres    false    285   ��      \          0    17164    tahsin 
   TABLE DATA               �   COPY public.tahsin (tahsin_id, tahsin_type, tahsin_value, student_id, step_study_id, tahsin_insert_by, tahsin_insert_time, tahsin_update_time, tahsin_update_by, tahsin_delete_time, tahsin_delete_by) FROM stdin;
    public       postgres    false    283   ��      Z          0    17146    teacher_note 
   TABLE DATA                  COPY public.teacher_note (teacher_note_id, student_id, step_study_id, raport_pts, raport_pas, teacher_note_insert_by, teacher_note_insert_time, teacher_note_update_time, teacher_note_update_by, teacher_note_delete_time, teacher_note_delete_by) FROM stdin;
    public       postgres    false    281   �      7          0    16798    teacher_setting 
   TABLE DATA               3  COPY public.teacher_setting (teacher_setting_id, employee_id, unit_year_id, course_id, teacher_setting_status, teacher_setting_insert_by, teacher_setting_insert_time, teacher_setting_update_time, teacher_setting_update_by, teacher_setting_delete_time, teacher_setting_delete_by, study_group_id) FROM stdin;
    public       postgres    false    246   n�                0    16394    users 
   TABLE DATA               �   COPY public.users (id, email_verified_at, password, remember_token, created_at, updated_at, username, user_status, api_token) FROM stdin;
    public       postgres    false    199   =�      �           0    0    absensi_absensi_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.absensi_absensi_id_seq', 106, true);
            public       postgres    false    266            �           0    0 "   class_advisor_class_advisor_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.class_advisor_class_advisor_id_seq', 34, true);
            public       postgres    false    247            �           0    0 $   course_setting_course_setting_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.course_setting_course_setting_id_seq', 502, true);
            public       postgres    false    243            �           0    0 $   daily_exercise_daily_exercise_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.daily_exercise_daily_exercise_id_seq', 5458, true);
            public       postgres    false    264            �           0    0 *   daily_exercise_skill_daily_exercise_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.daily_exercise_skill_daily_exercise_id_seq', 460, true);
            public       postgres    false    286            �           0    0 "   employee_unit_employee_unit_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.employee_unit_employee_unit_id_seq', 8, true);
            public       postgres    false    258            �           0    0 &   extracurricular_extracurricular_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.extracurricular_extracurricular_id_seq', 1, false);
            public       postgres    false    272            �           0    0 $   friendly_value_friendly_value_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.friendly_value_friendly_value_id_seq', 4, true);
            public       postgres    false    278            �           0    0 $   input_analysis_input_analysis_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.input_analysis_input_analysis_id_seq', 8336, true);
            public       postgres    false    288            �           0    0 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.input_analysis_tema_input_analysis_tema_id_seq', 1232, true);
            public       postgres    false    296            �           0    0    institution_institution_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.institution_institution_id_seq', 3, true);
            public       postgres    false    300            �           0    0 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.list_question_per_kd_list_question_per_kd_id_seq', 58, true);
            public       postgres    false    292            �           0    0 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.list_question_per_tema_list_question_per_tema_id_seq', 68, true);
            public       postgres    false    294            �           0    0    m_building_building_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_building_building_id_seq', 1, false);
            public       postgres    false    225            �           0    0     m_class_grade_class_grade_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.m_class_grade_class_grade_id_seq', 1, false);
            public       postgres    false    209            �           0    0    m_class_room_class_room_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.m_class_room_class_room_id_seq', 28, true);
            public       postgres    false    215            �           0    0    m_course_course_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.m_course_course_id_seq', 13, true);
            public       postgres    false    213            �           0    0    m_department_department_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.m_department_department_id_seq', 1, false);
            public       postgres    false    235            �           0    0 (   m_education_level_education_level_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.m_education_level_education_level_id_seq', 1, false);
            public       postgres    false    201            �           0    0    m_employee_employee_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.m_employee_employee_id_seq', 238, true);
            public       postgres    false    239            �           0    0    m_floor_floor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.m_floor_floor_id_seq', 1, false);
            public       postgres    false    229            �           0    0    m_kd_detail_kd_detail_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.m_kd_detail_kd_detail_id_seq', 17, true);
            public       postgres    false    233            �           0    0    m_kd_kd_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.m_kd_kd_id_seq', 90, true);
            public       postgres    false    231            �           0    0    m_kkm_kkm_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.m_kkm_kkm_id_seq', 32, true);
            public       postgres    false    227            �           0    0     m_lesson_hour_lesson_hour_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.m_lesson_hour_lesson_hour_id_seq', 1, false);
            public       postgres    false    211            �           0    0    m_parent_parent_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.m_parent_parent_id_seq', 3, true);
            public       postgres    false    223            �           0    0    m_position_position_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_position_position_id_seq', 1, false);
            public       postgres    false    237            �           0    0    m_step_study_step_study_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.m_step_study_step_study_id_seq', 2, true);
            public       postgres    false    207            �           0    0    m_student_student_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_student_student_id_seq', 2141, true);
            public       postgres    false    219            �           0    0     m_study_group_study_group_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.m_study_group_study_group_id_seq', 28, true);
            public       postgres    false    217            �           0    0    m_unit_unit_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_unit_unit_id_seq', 1, false);
            public       postgres    false    203            �           0    0    m_unit_year_unit_year_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.m_unit_year_unit_year_id_seq', 2, true);
            public       postgres    false    205            �           0    0    menu_menu_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.menu_menu_id_seq', 1, false);
            public       postgres    false    256            �           0    0    migrations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.migrations_id_seq', 110, true);
            public       postgres    false    196            �           0    0    observasi_observasi_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.observasi_observasi_id_seq', 3537, true);
            public       postgres    false    274            �           0    0    parlookup_parlookup_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.parlookup_parlookup_id_seq', 92, true);
            public       postgres    false    221            �           0    0    pd_pd_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pd_pd_id_seq', 1, true);
            public       postgres    false    276            �           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);
            public       postgres    false    249            �           0    0    personality_personality_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.personality_personality_id_seq', 639, true);
            public       postgres    false    268            �           0    0 (   physical_student_physical_student_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.physical_student_physical_student_id_seq', 122, true);
            public       postgres    false    270            �           0    0    prestation_prestation_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.prestation_prestation_id_seq', 1, false);
            public       postgres    false    302            �           0    0    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.quiz_per_kd_quiz_per_kd_id_seq', 8, true);
            public       postgres    false    290            �           0    0    raport_pts_raport_pts_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.raport_pts_raport_pts_id_seq', 1435, true);
            public       postgres    false    312            �           0    0    raport_raport_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.raport_raport_id_seq', 1, false);
            public       postgres    false    308            �           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 8, true);
            public       postgres    false    251            �           0    0 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('public.setting_daily_exercise_setting_daily_exercise_id_seq', 59, true);
            public       postgres    false    298            �           0    0 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.structure_tematic_detail_structure_tematic_detail_id_seq', 10, true);
            public       postgres    false    262            �           0    0 *   structure_tematic_structure_tematic_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.structure_tematic_structure_tematic_id_seq', 39, true);
            public       postgres    false    260            �           0    0 .   study_group_setting_study_group_setting_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.study_group_setting_study_group_setting_id_seq', 635, true);
            public       postgres    false    241            �           0    0    summary_kd_summary_kd_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.summary_kd_summary_kd_id_seq', 1571, true);
            public       postgres    false    310            �           0    0 "   summary_skill_summary_skill_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.summary_skill_summary_skill_id_seq', 305, true);
            public       postgres    false    306            �           0    0 &   summary_tematic_summary_tematic_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.summary_tematic_summary_tematic_id_seq', 216, true);
            public       postgres    false    304            �           0    0    tahfizh_tahfizh_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tahfizh_tahfizh_id_seq', 1, false);
            public       postgres    false    284            �           0    0    tahsin_tahsin_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.tahsin_tahsin_id_seq', 1, false);
            public       postgres    false    282            �           0    0     teacher_note_teacher_note_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.teacher_note_teacher_note_id_seq', 358, true);
            public       postgres    false    280            �           0    0 &   teacher_setting_teacher_setting_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.teacher_setting_teacher_setting_id_seq', 152, true);
            public       postgres    false    245            �           0    0    users_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.users_id_seq', 2382, true);
            public       postgres    false    198            �           2606    17012    absensi absensi_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_pkey PRIMARY KEY (absensi_id);
 >   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_pkey;
       public         postgres    false    267            �           2606    16826     class_advisor class_advisor_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_pkey PRIMARY KEY (class_advisor_id);
 J   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_pkey;
       public         postgres    false    248            �           2606    16780 "   course_setting course_setting_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_pkey PRIMARY KEY (course_setting_id);
 L   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_pkey;
       public         postgres    false    244            �           2606    16981 "   daily_exercise daily_exercise_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_pkey PRIMARY KEY (daily_exercise_id);
 L   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_pkey;
       public         postgres    false    265            �           2606    17205 .   daily_exercise_skill daily_exercise_skill_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_pkey PRIMARY KEY (daily_exercise_skill_id);
 X   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_pkey;
       public         postgres    false    287            �           2606    16919     employee_unit employee_unit_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_pkey PRIMARY KEY (employee_unit_id);
 J   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_pkey;
       public         postgres    false    259            �           2606    17067 $   extracurricular extracurricular_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_pkey PRIMARY KEY (extracurricular_id);
 N   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_pkey;
       public         postgres    false    273            �           2606    17133 "   friendly_value friendly_value_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_pkey PRIMARY KEY (friendly_value_id);
 L   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_pkey;
       public         postgres    false    279                       2606    17255 "   input_analysis input_analysis_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_pkey PRIMARY KEY (input_analysis_id);
 L   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_pkey;
       public         postgres    false    289            	           2606    17323 ,   input_analysis_tema input_analysis_tema_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_pkey PRIMARY KEY (input_analysis_tema_id);
 V   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_pkey;
       public         postgres    false    297                       2606    17397    institution institution_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (institution_id);
 F   ALTER TABLE ONLY public.institution DROP CONSTRAINT institution_pkey;
       public         postgres    false    301                       2606    17294 .   list_question_per_kd list_question_per_kd_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_kd
    ADD CONSTRAINT list_question_per_kd_pkey PRIMARY KEY (list_question_per_kd_id);
 X   ALTER TABLE ONLY public.list_question_per_kd DROP CONSTRAINT list_question_per_kd_pkey;
       public         postgres    false    293                       2606    17307 2   list_question_per_tema list_question_per_tema_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_tema
    ADD CONSTRAINT list_question_per_tema_pkey PRIMARY KEY (list_question_per_tema_id);
 \   ALTER TABLE ONLY public.list_question_per_tema DROP CONSTRAINT list_question_per_tema_pkey;
       public         postgres    false    295            �           2606    16626    m_building m_building_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_building
    ADD CONSTRAINT m_building_pkey PRIMARY KEY (building_id);
 D   ALTER TABLE ONLY public.m_building DROP CONSTRAINT m_building_pkey;
       public         postgres    false    226            �           2606    16478     m_class_grade m_class_grade_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_class_grade
    ADD CONSTRAINT m_class_grade_pkey PRIMARY KEY (class_grade_id);
 J   ALTER TABLE ONLY public.m_class_grade DROP CONSTRAINT m_class_grade_pkey;
       public         postgres    false    210            �           2606    16526    m_class_room m_class_room_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_pkey PRIMARY KEY (class_room_id);
 H   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_pkey;
       public         postgres    false    216            �           2606    16505    m_course m_course_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.m_course
    ADD CONSTRAINT m_course_pkey PRIMARY KEY (course_id);
 @   ALTER TABLE ONLY public.m_course DROP CONSTRAINT m_course_pkey;
       public         postgres    false    214            �           2606    16712    m_department m_department_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_department
    ADD CONSTRAINT m_department_pkey PRIMARY KEY (department_id);
 H   ALTER TABLE ONLY public.m_department DROP CONSTRAINT m_department_pkey;
       public         postgres    false    236            �           2606    16419 (   m_education_level m_education_level_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.m_education_level
    ADD CONSTRAINT m_education_level_pkey PRIMARY KEY (education_level_id);
 R   ALTER TABLE ONLY public.m_education_level DROP CONSTRAINT m_education_level_pkey;
       public         postgres    false    202            �           2606    16739    m_employee m_employee_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_pkey PRIMARY KEY (employee_id);
 D   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_pkey;
       public         postgres    false    240            �           2606    16642    m_floor m_floor_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.m_floor
    ADD CONSTRAINT m_floor_pkey PRIMARY KEY (floor_id);
 >   ALTER TABLE ONLY public.m_floor DROP CONSTRAINT m_floor_pkey;
       public         postgres    false    230            �           2606    16676    m_kd_detail m_kd_detail_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_pkey PRIMARY KEY (kd_detail_id);
 F   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_pkey;
       public         postgres    false    234            �           2606    16658    m_kd m_kd_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_pkey PRIMARY KEY (kd_id);
 8   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_pkey;
       public         postgres    false    232            �           2606    16634    m_kkm m_kkm_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_pkey PRIMARY KEY (kkm_id);
 :   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_pkey;
       public         postgres    false    228            �           2606    16494     m_lesson_hour m_lesson_hour_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_lesson_hour
    ADD CONSTRAINT m_lesson_hour_pkey PRIMARY KEY (lesson_hour_id);
 J   ALTER TABLE ONLY public.m_lesson_hour DROP CONSTRAINT m_lesson_hour_pkey;
       public         postgres    false    212            �           2606    16605    m_parent m_parent_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_pkey PRIMARY KEY (parent_id);
 @   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_pkey;
       public         postgres    false    224            �           2606    16723    m_position m_position_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_position
    ADD CONSTRAINT m_position_pkey PRIMARY KEY (position_id);
 D   ALTER TABLE ONLY public.m_position DROP CONSTRAINT m_position_pkey;
       public         postgres    false    238            �           2606    16462    m_step_study m_step_study_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_step_study
    ADD CONSTRAINT m_step_study_pkey PRIMARY KEY (step_study_id);
 H   ALTER TABLE ONLY public.m_step_study DROP CONSTRAINT m_step_study_pkey;
       public         postgres    false    208            �           2606    16568    m_student m_student_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_pkey PRIMARY KEY (student_id);
 B   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_pkey;
       public         postgres    false    220            �           2606    16542     m_study_group m_study_group_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_pkey PRIMARY KEY (study_group_id);
 J   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_pkey;
       public         postgres    false    218            �           2606    16430    m_unit m_unit_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.m_unit
    ADD CONSTRAINT m_unit_pkey PRIMARY KEY (unit_id);
 <   ALTER TABLE ONLY public.m_unit DROP CONSTRAINT m_unit_pkey;
       public         postgres    false    204            �           2606    16446    m_unit_year m_unit_year_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_unit_year
    ADD CONSTRAINT m_unit_year_pkey PRIMARY KEY (unit_year_id);
 F   ALTER TABLE ONLY public.m_unit_year DROP CONSTRAINT m_unit_year_pkey;
       public         postgres    false    206            �           2606    16905    menu menu_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public         postgres    false    257            �           2606    16391    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public         postgres    false    197            �           2606    16868 0   model_has_permissions model_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);
 Z   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_pkey;
       public         postgres    false    253    253    253            �           2606    16879 $   model_has_roles model_has_roles_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);
 N   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_pkey;
       public         postgres    false    254    254    254            �           2606    17089    observasi observasi_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_pkey PRIMARY KEY (observasi_id);
 B   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_pkey;
       public         postgres    false    275            �           2606    16594    parlookup parlookup_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.parlookup
    ADD CONSTRAINT parlookup_pkey PRIMARY KEY (parlookup_id);
 B   ALTER TABLE ONLY public.parlookup DROP CONSTRAINT parlookup_pkey;
       public         postgres    false    222            �           2606    17111 
   pd pd_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_pkey PRIMARY KEY (pd_id);
 4   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_pkey;
       public         postgres    false    277            �           2606    16849    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public         postgres    false    250            �           2606    17030    personality personality_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_pkey PRIMARY KEY (personality_id);
 F   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_pkey;
       public         postgres    false    269            �           2606    17046 &   physical_student physical_student_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_pkey PRIMARY KEY (physical_student_id);
 P   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_pkey;
       public         postgres    false    271                       2606    17411    prestation prestation_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_pkey PRIMARY KEY (prestation_id);
 D   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_pkey;
       public         postgres    false    303                       2606    17281    quiz_per_kd quiz_per_kd_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_pkey PRIMARY KEY (quiz_per_kd_id);
 F   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_pkey;
       public         postgres    false    291                       2606    17488    raport raport_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_pkey PRIMARY KEY (raport_id);
 <   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_pkey;
       public         postgres    false    309                       2606    17554    raport_pts raport_pts_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_pkey PRIMARY KEY (raport_pts_id);
 D   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_pkey;
       public         postgres    false    313            �           2606    16894 .   role_has_permissions role_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);
 X   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_pkey;
       public         postgres    false    255    255            �           2606    16857    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    252                       2606    17376 2   setting_daily_exercise setting_daily_exercise_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_pkey PRIMARY KEY (setting_daily_exercise_id);
 \   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_pkey;
       public         postgres    false    299            �           2606    16958 6   structure_tematic_detail structure_tematic_detail_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_pkey PRIMARY KEY (structure_tematic_detail_id);
 `   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_pkey;
       public         postgres    false    263            �           2606    16940 (   structure_tematic structure_tematic_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_pkey PRIMARY KEY (structure_tematic_id);
 R   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_pkey;
       public         postgres    false    261            �           2606    16757 ,   study_group_setting study_group_setting_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_pkey PRIMARY KEY (study_group_setting_id);
 V   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_pkey;
       public         postgres    false    242                       2606    17511    summary_kd summary_kd_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_pkey PRIMARY KEY (summary_kd_id);
 D   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_pkey;
       public         postgres    false    311                       2606    17457     summary_skill summary_skill_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_pkey PRIMARY KEY (summary_skill_id);
 J   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_pkey;
       public         postgres    false    307                       2606    17434 $   summary_tematic summary_tematic_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_pkey PRIMARY KEY (summary_tematic_id);
 N   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_pkey;
       public         postgres    false    305            �           2606    17187    tahfizh tahfizh_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_pkey PRIMARY KEY (tahfizh_id);
 >   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_pkey;
       public         postgres    false    285            �           2606    17169    tahsin tahsin_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_pkey PRIMARY KEY (tahsin_id);
 <   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_pkey;
       public         postgres    false    283            �           2606    17151    teacher_note teacher_note_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_pkey PRIMARY KEY (teacher_note_id);
 H   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_pkey;
       public         postgres    false    281            �           2606    16803 $   teacher_setting teacher_setting_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_pkey PRIMARY KEY (teacher_setting_id);
 N   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_pkey;
       public         postgres    false    246            �           2606    16402    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    199            �           1259    16861 /   model_has_permissions_model_id_model_type_index    INDEX     �   CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);
 C   DROP INDEX public.model_has_permissions_model_id_model_type_index;
       public         postgres    false    253    253            �           1259    16872 )   model_has_roles_model_id_model_type_index    INDEX     u   CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);
 =   DROP INDEX public.model_has_roles_model_id_model_type_index;
       public         postgres    false    254    254            �           1259    16408    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public         postgres    false    200            �           1259    16911    permissions_menu_id_index    INDEX     T   CREATE INDEX permissions_menu_id_index ON public.permissions USING btree (menu_id);
 -   DROP INDEX public.permissions_menu_id_index;
       public         postgres    false    250            X           2606    17018 %   absensi absensi_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_step_study_id_foreign;
       public       postgres    false    208    267    3242            W           2606    17013 "   absensi absensi_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_student_id_foreign;
       public       postgres    false    3254    220    267            D           2606    16827 /   class_advisor class_advisor_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_employee_id_foreign;
       public       postgres    false    248    3274    240            F           2606    16837 2   class_advisor class_advisor_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_study_group_id_foreign;
       public       postgres    false    218    248    3252            E           2606    16832 0   class_advisor class_advisor_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_unit_year_id_foreign;
       public       postgres    false    3240    248    206            ?           2606    17703 4   course_setting course_setting_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_class_grade_id_foreign;
       public       postgres    false    210    3244    244            <           2606    16781 /   course_setting course_setting_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_course_id_foreign;
       public       postgres    false    214    244    3248            =           2606    16786 4   course_setting course_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_study_group_id_foreign;
       public       postgres    false    244    218    3252            >           2606    16791 2   course_setting course_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_unit_year_id_foreign;
       public       postgres    false    206    3240    244            T           2606    16987 2   daily_exercise daily_exercise_kd_detail_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_kd_detail_id_foreign FOREIGN KEY (kd_detail_id) REFERENCES public.m_kd_detail(kd_detail_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_kd_detail_id_foreign;
       public       postgres    false    234    265    3268            l           2606    17211 7   daily_exercise_skill daily_exercise_skill_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_kd_id_foreign;
       public       postgres    false    3266    287    232            m           2606    17354 ?   daily_exercise_skill daily_exercise_skill_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_step_study_id_foreign;
       public       postgres    false    287    3242    208            k           2606    17206 <   daily_exercise_skill daily_exercise_skill_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_student_id_foreign;
       public       postgres    false    3254    287    220            V           2606    17349 3   daily_exercise daily_exercise_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_step_study_id_foreign;
       public       postgres    false    3242    265    208            U           2606    16992 :   daily_exercise daily_exercise_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_structure_tematic_id_foreign;
       public       postgres    false    265    3301    261            S           2606    16982 0   daily_exercise daily_exercise_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_student_id_foreign;
       public       postgres    false    3254    265    220            M           2606    16925 /   employee_unit employee_unit_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_employee_id_foreign;
       public       postgres    false    240    259    3274            L           2606    16920 +   employee_unit employee_unit_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_unit_id_foreign;
       public       postgres    false    204    259    3238            ^           2606    17073 5   extracurricular extracurricular_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_step_study_id_foreign;
       public       postgres    false    273    3242    208            ]           2606    17068 2   extracurricular extracurricular_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_student_id_foreign;
       public       postgres    false    3254    273    220            d           2606    17139 3   friendly_value friendly_value_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_step_study_id_foreign;
       public       postgres    false    3242    279    208            c           2606    17134 0   friendly_value friendly_value_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_student_id_foreign;
       public       postgres    false    220    3254    279            n           2606    17256 +   input_analysis input_analysis_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_kd_id_foreign;
       public       postgres    false    232    3266    289            p           2606    17527 3   input_analysis input_analysis_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_step_study_id_foreign;
       public       postgres    false    3242    208    289            o           2606    17261 0   input_analysis input_analysis_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_student_id_foreign;
       public       postgres    false    3254    289    220            u           2606    17324 5   input_analysis_tema input_analysis_tema_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_kd_id_foreign;
       public       postgres    false    3266    232    297            w           2606    17334 D   input_analysis_tema input_analysis_tema_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_structure_tematic_id_foreign;
       public       postgres    false    3301    261    297            v           2606    17329 :   input_analysis_tema input_analysis_tema_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_student_id_foreign;
       public       postgres    false    297    220    3254            s           2606    17295 @   list_question_per_kd list_question_per_kd_quiz_per_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_kd
    ADD CONSTRAINT list_question_per_kd_quiz_per_kd_id_foreign FOREIGN KEY (quiz_per_kd_id) REFERENCES public.quiz_per_kd(quiz_per_kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.list_question_per_kd DROP CONSTRAINT list_question_per_kd_quiz_per_kd_id_foreign;
       public       postgres    false    291    293    3331            t           2606    17339 Q   list_question_per_tema list_question_per_tema_structure_tematic_detail_id_foreign    FK CONSTRAINT       ALTER TABLE ONLY public.list_question_per_tema
    ADD CONSTRAINT list_question_per_tema_structure_tematic_detail_id_foreign FOREIGN KEY (structure_tematic_detail_id) REFERENCES public.structure_tematic_detail(structure_tematic_detail_id) ON UPDATE CASCADE ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.list_question_per_tema DROP CONSTRAINT list_question_per_tema_structure_tematic_detail_id_foreign;
       public       postgres    false    263    295    3303                       2606    16479 +   m_class_grade m_class_grade_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_grade
    ADD CONSTRAINT m_class_grade_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_class_grade DROP CONSTRAINT m_class_grade_unit_id_foreign;
       public       postgres    false    3238    204    210            !           2606    16697 *   m_class_room m_class_room_floor_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_floor_id_foreign FOREIGN KEY (floor_id) REFERENCES public.m_floor(floor_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_floor_id_foreign;
       public       postgres    false    230    216    3264                        2606    16527 )   m_class_room m_class_room_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_unit_id_foreign;
       public       postgres    false    216    3238    204                       2606    16511 (   m_course m_course_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_course
    ADD CONSTRAINT m_course_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.m_course DROP CONSTRAINT m_course_class_grade_id_foreign;
       public       postgres    false    210    214    3244                       2606    16506 !   m_course m_course_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_course
    ADD CONSTRAINT m_course_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_course DROP CONSTRAINT m_course_unit_id_foreign;
       public       postgres    false    3238    214    204            8           2606    25905 +   m_employee m_employee_employee_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_employee_role_foreign FOREIGN KEY (employee_role) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_employee_role_foreign;
       public       postgres    false    240    3287    252            6           2606    16740 )   m_employee m_employee_position_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_position_id_foreign FOREIGN KEY (position_id) REFERENCES public.m_position(position_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_position_id_foreign;
       public       postgres    false    240    238    3272            7           2606    16745 %   m_employee m_employee_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_user_id_foreign;
       public       postgres    false    3233    240    199            .           2606    16643 #   m_floor m_floor_building_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_floor
    ADD CONSTRAINT m_floor_building_id_foreign FOREIGN KEY (building_id) REFERENCES public.m_building(building_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_floor DROP CONSTRAINT m_floor_building_id_foreign;
       public       postgres    false    230    3260    226            0           2606    16664    m_kd m_kd_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_course_id_foreign;
       public       postgres    false    214    232    3248            2           2606    25893 #   m_kd m_kd_course_setting_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_course_setting_id_foreign FOREIGN KEY (course_setting_id) REFERENCES public.course_setting(course_setting_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_course_setting_id_foreign;
       public       postgres    false    232    3278    244            3           2606    16677 %   m_kd_detail m_kd_detail_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_kd_id_foreign;
       public       postgres    false    232    3266    234            4           2606    16682 -   m_kd_detail m_kd_detail_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_step_study_id_foreign;
       public       postgres    false    234    3242    208            1           2606    17539    m_kd m_kd_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_unit_id_foreign;
       public       postgres    false    3238    204    232            /           2606    16659    m_kd m_kd_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_unit_year_id_foreign;
       public       postgres    false    206    3240    232            -           2606    17570 "   m_kkm m_kkm_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_class_grade_id_foreign;
       public       postgres    false    228    210    3244            ,           2606    16692    m_kkm m_kkm_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_course_id_foreign;
       public       postgres    false    228    3248    214            +           2606    16687 !   m_kkm m_kkm_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_step_study_id_foreign;
       public       postgres    false    228    3242    208            )           2606    16606 $   m_parent m_parent_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_student_id_foreign;
       public       postgres    false    220    3254    224            *           2606    16611 !   m_parent m_parent_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_user_id_foreign;
       public       postgres    false    199    224    3233            5           2606    16724 +   m_position m_position_department_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_position
    ADD CONSTRAINT m_position_department_id_foreign FOREIGN KEY (department_id) REFERENCES public.m_department(department_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_position DROP CONSTRAINT m_position_department_id_foreign;
       public       postgres    false    236    3270    238                       2606    16463 .   m_step_study m_step_study_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_step_study
    ADD CONSTRAINT m_step_study_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.m_step_study DROP CONSTRAINT m_step_study_unit_year_id_foreign;
       public       postgres    false    206    208    3240            &           2606    16574 *   m_student m_student_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_class_grade_id_foreign;
       public       postgres    false    220    210    3244            %           2606    16569 #   m_student m_student_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_unit_id_foreign;
       public       postgres    false    3238    204    220            '           2606    16579 #   m_student m_student_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_user_id_foreign;
       public       postgres    false    199    220    3233            #           2606    16548 2   m_study_group m_study_group_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_class_grade_id_foreign;
       public       postgres    false    218    210    3244            $           2606    16553 1   m_study_group m_study_group_class_room_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_class_room_id_foreign FOREIGN KEY (class_room_id) REFERENCES public.m_class_room(class_room_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_class_room_id_foreign;
       public       postgres    false    218    3250    216            "           2606    16543 +   m_study_group m_study_group_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_unit_id_foreign;
       public       postgres    false    3238    204    218                       2606    16431 (   m_unit m_unit_education_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_unit
    ADD CONSTRAINT m_unit_education_level_id_foreign FOREIGN KEY (education_level_id) REFERENCES public.m_education_level(education_level_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.m_unit DROP CONSTRAINT m_unit_education_level_id_foreign;
       public       postgres    false    202    204    3236                       2606    16447 '   m_unit_year m_unit_year_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_unit_year
    ADD CONSTRAINT m_unit_year_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.m_unit_year DROP CONSTRAINT m_unit_year_unit_id_foreign;
       public       postgres    false    206    3238    204            H           2606    16862 A   model_has_permissions model_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_permission_id_foreign;
       public       postgres    false    250    253    3285            I           2606    16873 /   model_has_roles model_has_roles_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_role_id_foreign;
       public       postgres    false    254    3287    252            `           2606    17095 )   observasi observasi_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_step_study_id_foreign;
       public       postgres    false    275    3242    208            _           2606    17090 &   observasi observasi_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_student_id_foreign;
       public       postgres    false    3254    275    220            (           2606    17422 #   parlookup parlookup_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.parlookup
    ADD CONSTRAINT parlookup_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.parlookup DROP CONSTRAINT parlookup_unit_id_foreign;
       public       postgres    false    222    204    3238            b           2606    17117    pd pd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_step_study_id_foreign;
       public       postgres    false    277    208    3242            a           2606    17112    pd pd_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_student_id_foreign;
       public       postgres    false    3254    277    220            G           2606    16906 '   permissions permissions_menu_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menu(menu_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_menu_id_foreign;
       public       postgres    false    257    3297    250            Z           2606    17696 -   personality personality_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_step_study_id_foreign;
       public       postgres    false    3242    208    269            Y           2606    17031 *   personality personality_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_student_id_foreign;
       public       postgres    false    269    220    3254            \           2606    17052 7   physical_student physical_student_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_step_study_id_foreign;
       public       postgres    false    208    271    3242            [           2606    17047 4   physical_student physical_student_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_student_id_foreign;
       public       postgres    false    3254    220    271            {           2606    17417 +   prestation prestation_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_step_study_id_foreign;
       public       postgres    false    303    208    3242            z           2606    17412 (   prestation prestation_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_student_id_foreign;
       public       postgres    false    303    220    3254            q           2606    17282 %   quiz_per_kd quiz_per_kd_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_kd_id_foreign;
       public       postgres    false    291    232    3266            r           2606    17344 -   quiz_per_kd quiz_per_kd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_step_study_id_foreign;
       public       postgres    false    208    291    3242            �           2606    17489    raport raport_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_course_id_foreign;
       public       postgres    false    214    309    3248            �           2606    17555 '   raport_pts raport_pts_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_course_id_foreign;
       public       postgres    false    214    3248    313            �           2606    17565 +   raport_pts raport_pts_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_step_study_id_foreign;
       public       postgres    false    3242    313    208            �           2606    17560 (   raport_pts raport_pts_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_student_id_foreign;
       public       postgres    false    3254    220    313            �           2606    17499 #   raport raport_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_step_study_id_foreign;
       public       postgres    false    3242    309    208            �           2606    17494     raport raport_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_student_id_foreign;
       public       postgres    false    309    220    3254            J           2606    16883 ?   role_has_permissions role_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_permission_id_foreign;
       public       postgres    false    250    3285    255            K           2606    16888 9   role_has_permissions role_has_permissions_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_role_id_foreign;
       public       postgres    false    252    3287    255            x           2606    17377 ;   setting_daily_exercise setting_daily_exercise_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_kd_id_foreign;
       public       postgres    false    299    232    3266            y           2606    17382 C   setting_daily_exercise setting_daily_exercise_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 m   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_step_study_id_foreign;
       public       postgres    false    299    208    3242            P           2606    25888 :   structure_tematic structure_tematic_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_class_grade_id_foreign;
       public       postgres    false    261    3244    210            R           2606    17266 ?   structure_tematic_detail structure_tematic_detail_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_kd_id_foreign;
       public       postgres    false    263    232    3266            Q           2606    16959 N   structure_tematic_detail structure_tematic_detail_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 x   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_structure_tematic_id_foreign;
       public       postgres    false    3301    261    263            O           2606    16946 9   structure_tematic structure_tematic_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_step_study_id_foreign;
       public       postgres    false    3242    261    208            N           2606    16941 :   structure_tematic structure_tematic_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_study_group_id_foreign;
       public       postgres    false    261    3252    218            9           2606    16758 :   study_group_setting study_group_setting_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_student_id_foreign;
       public       postgres    false    3254    220    242            :           2606    16763 >   study_group_setting study_group_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_study_group_id_foreign;
       public       postgres    false    218    242    3252            ;           2606    16768 <   study_group_setting study_group_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_unit_year_id_foreign;
       public       postgres    false    242    3240    206            �           2606    17512 #   summary_kd summary_kd_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_kd_id_foreign;
       public       postgres    false    3266    232    311            �           2606    17522 +   summary_kd summary_kd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_step_study_id_foreign;
       public       postgres    false    3242    208    311            �           2606    17517 (   summary_kd summary_kd_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_student_id_foreign;
       public       postgres    false    311    220    3254            �           2606    17458 )   summary_skill summary_skill_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_kd_id_foreign;
       public       postgres    false    307    3266    232            �           2606    17468 1   summary_skill summary_skill_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_step_study_id_foreign;
       public       postgres    false    3242    307    208            �           2606    17463 .   summary_skill summary_skill_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_student_id_foreign;
       public       postgres    false    220    3254    307            |           2606    17435 -   summary_tematic summary_tematic_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_kd_id_foreign;
       public       postgres    false    305    232    3266                       2606    17473 5   summary_tematic summary_tematic_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_step_study_id_foreign;
       public       postgres    false    305    208    3242            ~           2606    17445 <   summary_tematic summary_tematic_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_structure_tematic_id_foreign;
       public       postgres    false    3301    305    261            }           2606    17440 2   summary_tematic summary_tematic_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_student_id_foreign;
       public       postgres    false    3254    305    220            j           2606    17193 %   tahfizh tahfizh_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_step_study_id_foreign;
       public       postgres    false    3242    285    208            i           2606    17188 "   tahfizh tahfizh_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_student_id_foreign;
       public       postgres    false    3254    285    220            h           2606    17175 #   tahsin tahsin_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_step_study_id_foreign;
       public       postgres    false    283    3242    208            g           2606    17170     tahsin tahsin_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_student_id_foreign;
       public       postgres    false    3254    220    283            f           2606    17157 /   teacher_note teacher_note_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_step_study_id_foreign;
       public       postgres    false    3242    281    208            e           2606    17152 ,   teacher_note teacher_note_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_student_id_foreign;
       public       postgres    false    3254    281    220            B           2606    16814 1   teacher_setting teacher_setting_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_course_id_foreign;
       public       postgres    false    246    214    3248            @           2606    16804 3   teacher_setting teacher_setting_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_employee_id_foreign;
       public       postgres    false    246    3274    240            C           2606    16969 6   teacher_setting teacher_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_study_group_id_foreign;
       public       postgres    false    246    3252    218            A           2606    16809 4   teacher_setting teacher_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_unit_year_id_foreign;
       public       postgres    false    3240    206    246            L      x���=n#1��z|
_ Q���-�l�6�?ǒ#����&AH�W�-׃J-��AG;����!�/
_!?)�TFd�����T��*ڎ�sV߸�0��Ch�k��9��$͉�<'�C�ud�T��f%Q%�R�$K���(��%�R�$[��b)QR-%J��D	[J�tK	�,%J�R�$ZJ�$K)f���M����V6�r�'l�EMV6dIa]SMrMQ�]S��5�5EMsMQî)j�k
�\SԐk�L��蚢&���ɮ)j�k��ꚢ����a�5�5M�}�e�Y�>��C��'M��׼|�9Ii#�+�J�9MI���Y���}�t%igJtd���y|�J���.r�%+!!	&e.��M���W��^17�j�˿rL�MӞF�Ao�.iS��X5!4b2�I����i�AG)�!If5��H����,(�:J�"MGY_<��(�yG��!$#P�{��
}�؇<�Ր��< oM�q>��-�-�y���irzߛ$���� l�����r�"�-�=��ȹ�O����x�Ev2�      9   A  x�m��m�0���]��L�{�N��?GE
���>I�N-(��[�7�%c������}��5���-��[��%<"�7��^����`�V�+��f������^�IP!��1�LW�8&i���GW�p�dp�F�b_i���8�~0�D��z�0���n4[/����a�Z�D�Fwq4�Ǽ�i"�X�<��{E0?��]2��.1Џ�Ѱ���)G���t�������e�9�$��:�ik��`�D���&w�NH,�����y����zՠ��I�zo��ZXcY�֋6h�p�J�}�j�<?��A��_���y�?9��      5   �  x���Kj�@��|���I-��9����1�©.h0xa>��
b���.W׷�[��������}��#���=aR6�Kl�"mS��M�b�I����61r�����	C2��p���cz��a�(��xY��3��D�R�HT
�BEC�P�a)�X
#��J�r�2��*�wϗ��:�>��"P[T$*���J���R��*,����J�r����{��PRP)Tĺ�6�"N��R��KY��.e!��R�D�u�a��I�RH��FO@��Ie5B�X��<D�����F$���0V#�j��-*�ޢ�-J�ޢ�?����[�����PVc<���0V#�j����V#�j�n:*ণo:J�#$o�_�
�t��MG���8���      J   �  x���K�7EǯW�8���[D�x⁑�<J���"� -Q&s��8 %�.��_qP}�Wj�?~�����������W��^(|��+�/q�KxSy}����Qb#f䅑�Č�1v��V_F�3
3_F�3*3V_���nF��3�e0c��~��Ƀ��Kvgzd��L�3��3.C�HM�&3d�d�����O�7f������ӛ����� g���f�af����f��̰3�Pmq��{d$�,θ �!�7O�fЛ��j3Vg����j���1�����������7���P�ȿ�b�?afC����n2 �0P
��lRxb{(t�`w3<�h�$���bd�L$�@��h͛$���7ff�o��Q��8�aܱ�79��@C��&vf�aFv��y�x���(�(2y�՜���(1���X��a��X@T�:�0�1z ��M��� W�3�*���`��!�G�C��&=��I��
3�\�Re�������ԙḘ�BC������Pu�6��{��a3�B�a$��u}�ded��u��v��h+�!Mi7u�+�&�!CoY%ZEfHԺ<�� ���2$)-$z4fHQ�+.H�,��h�ވҕވ2���R��ذI�JS�g;����˙th(�!Yi(xNDk��z.HS��aJj��xǉ��i�P��!Q���ҫg3#)��C���ծ�uH9�fHU�V�)�ҕ�s8C�=�<�+�\4C�R� ��zfFR�4#�E���X�Ԩ
,3�)��UN�]��v��q�#(e�'�FTj�~w;�����HJ%�#+I��m��aT%s�0���vCKW=v=�42�:��0�a^d��!53C��V�#5��J�t͐�0�̨Z��h�$����s�� �VH<4X͌�(��A�ڹ�I�T�Y��K�����̏���/��Kz_��B��H��H�5 e��`�g~u7�1����Yd)�U�d֝��y4p��i
���ӁD�������hy���[�?I殘?I&���X02���p�� ��"f�T\�)�E;�!*D��^���8����L��/q�����(Y"�+ds=*D�[1��
V��U��
�C��?�?�6�Y"{�d����$3�n�m�: Q�9�"�XD����-҃�,�,v�U��bYr�,�%�dA2Dz��y�[y��3y�[��*�D���i[������U�=���@�&�A�wD~G �=�zt��rݺAd$�Ad$�Ad=��REw H݁ ��Ad���+��(�AdЅAd҅Ad���REw H;�Y!��;f�8�2�Aw̐��ݝg��$���p'��㰤t����8,i��8 ]�d��c��T�q@��;���$Uw���RT�q@��;HSu���8 C�;$Uw���Χ��	B��8 I՝`���!�;fH=���c���!�;V���!�;f�3$t���1C�Aw̐z�3�t���1C�Aw���.�c��Aw̐t�3$t��km��]�4���@��Kd��C��j	�!s� ��a�@�Ϟ27 S�f�\0�(s� ��<0S�F��C������j�v����`�\�ș��_�DJ���;s� �d�@��^ A�z���?b������/2�~�      `   �  x���Kn�0D��S�2�D�Cf�]���]�mt����]~�)�oy������}my+����>J���g�um����<$��A��@���'T�PIM�R���<S*e��T~��;�[�D�J��RjU�=K�4�=K�<1��Y"dpgK���K�&�=�D�3�B�-�� !!K���K���K�6��%B;#�D��n�Z"�L����� Uv�1���[W�ҳ��T=�G�jg���~�oƩq菨5�ũ�v�䆩|��Uvv��݁��P�Su���8�v2T?<Ht8v�W��	��t�0�a˻�[9dHԒ�Ô�u�*|�e�7/��-�
5萃:l�A2�	RPOP�A7o�(Ä\�r����� UX��$�M�Á\�r�&HA#A�T{#�T�?؏���
�q�kP�A-u��ko@|4������]��4�g��������\@��*	�g���{VI�P����ȿ��ǝ��{����b�{̙4%xoA=ZIS����i*��&���{��3=Mޫ����j�ux��ހ��ALx�DN�X��cB�ޣ�$��[S��w����R��3��)��q��ꏤ|�ǝK}�G���������Z��#)_ Z��4|H�� Y�w�U}	�uX}�ݯ�k@.Q���d��$)���*�����}Hv��@�j���ￏ���ߝ      D   +   x�3�4�426��CC\f`s,2�`,2`3,21z\\\ ��      R      x������ � �      X      x������ � �      b      x���M�c9z��q�*z6.ɏ���'zb�3��ޡL���F$_��B?PD���D^�-����4s��~ď��ۏ�������G~��/�������ȯ��-�g����=O���y��x����~�X<1^��o?yO��z_����+��ר+�z[���Q�֨+lԵ5��d��F]<��ר6��u�o��ïQ��u�F][�.X��u�F]_�.ب�k�k]/�|&<�yī:��]S���<�C�G��T�	�:�xR���<�E�'�#�y��U�G������<z���#>�y���G�G<��gu���:�xU�o�<�]�/�u��7n���Q�O�<��˓�y��E�G��<z���#��y��wu��P�ѫOu��zz�yē:O~���y��E�G<�y��Wu�zS�ѫwu�Σ~������#��� <��~�\�y�C�G���7u��#>�yħ:Oxy�y2lJR�ѫgu��#�<�U���7u�zW��<zߧ:O^=u��z$u�Σ���:������y��|z��������{ڟQ��;��;�u�Ap[x�����x,��g�_35Ϟ���i�r���V�k�2��a���FX��y��}^#���5^#,�[5���[5��V�5���FX��y���qU n
 �]x(� O���Q N
 �Y�(� �pU ^#��?��z<TO���y�ӣz�FI�J/�E�8�^���pSz�Jo��C�x*��8?J/�I�8+� ��Pz�J/�M��+� ������(� V��pQ�u�n��m����P����=�G�8��q���pQ�u�n��m����P����=���pR���6�E�8�m����g+ �l��� x����=�6�I�8�� u�P���v��M���� u�n����� 'u�n\�m�C���� 7u`�V <�^���{�ǣ���^���pQz���ܔ^����Pz�=�J�=�s�_�8)� g���J/�U��)� w���<��k<4��x��	pV=.�'��z\UO���	pW=�'�S���{N����'��z\TO�C���� 7��z<TO���y���~!#Ls�d�iN��=�d��Pz�J/�M���� �`ϸ��=��}~��_�8/<.O������g��O���}�r<�υ��9��+C �V�X�V� �5�X#,� �5¾~���d��aAI��}^#,��\��>�ݰ�c�� \@�Cx7�!��� w��z<U�{���z�UO���	p�� ֚�pWzJ/�S���Qz^#,��Y���� ��pU�_`ouS���*7�C�&z��@�G�&:��Dg��~j0�U&���Dwe��=b����b��ZLtQ��՘���c���L�pS�7<�9]�k=��U:��@gW��*�"лk����T���
��;������Z�]Cc-�����v��hI�kh���54Z��-iw����e�ew��F�K�7�=�1�ޓ��y�A�S�D{��hO��YZ�=MK��i��_o�����D{��hO�]\d��E���@���{�pρ����ދ���^4���@����^��f��'�9��=���@w���=��{��~�����s��{t��@W�����s��{�t���^(xU����s��{t��@W������o�.|�ǜ��=��{���s��{tvρ.�9��]�s��9��9��9���z���A��{�z�GvS�>�<�>�<�>�<�>�<�>�<�>�<�>�<�ٔ�A�c��c��c��c��c��c��c��c��c��c��V��9�<�>�<�>�<�>�<�>�<�>�<�>�<�>�<�>�<�>�<�u:�<�>�<�>�<�>�<��&�Is@s@s��jˁO��g�X�?��?o|o/���y��=o"���I[=��2�E�=ߛ\��ͥ2�7��Q�Åب��B��nowa�N�ب�!Cl��!6�t�Paܛ���=Ľ�qo�Cܛ��6>���C>l�'uqo�C�����>Ľ�qo�C�����>Ľ��pE�F�#b�N��?:H�F�>�(ذѡDl��X��xW�
5�S�%\���]��}Q�5�xQi���"�����k���5�}��:��2��J�}��>|q���`C�G�!�C�J%�u�}n�n�n]��!��!��!�[�0ޕJćR��T*	�G�|�;��!�v��;h�5yǫb�xS�߭+��u�����>�(а�:��w�M�(q_���/˨����}a�2q_����� <=*-�I�Eܗg ��3���
�}��oS��)����W|�Mu{m�T��#*���!�w���;�vP�;��Vy�ߎ���oV^q]�OJ%�>zq���[�xUmo�����?�!��u��J�����"�ﰝp�E��a�wX��q�E��a�wXµ6���UƳj��nu�.�ѹu��u��ֱQ��	6�6Q��uZ�`�N�'�Q��&��:]��F�^�6ꚟt��I'����~҉p�M<��I'����~�	q?鄸�tB�O:!�'�
5�S�&\kl�hm�]�P/
5�P#^jěB�xW�
�=�>���e<{l��؆{��Q?���؆���c.��6\��m�@�p�>��}l��؆{��Q��@�p�>��}l��؆���c.��6�o"���m�@�p��>��5b�>��}l��؆������T���
�pS�>���k�t���}�E��{e��������7�tұtG�.=�nKO�p��o���	�t&�5���@��ځt^����ZA����V���ZA����h��5�����Z�Ѳ����{ݟ��h�k���Nz��@c���h��5�����Z��֛����۟tw��.2��E���q��N.2��E���@����ZE���@w���=��{=�����s��{t��@W�����s��{�tϯuz�5�v���LtV��.*2ѡ"]Ud���|��_���n*���$����<�A�qR��Q9�g�~�C�qZ��q9���~�s��_N�!<y����Cs?N�!�86�����s?N�!|�{�a���6:<��}z��l���}���q_����{CܭCܭCܭ#<�u��u��u��K�}�%��q_c��n|߇j��Tmߋ���G�O��Y�B��"��U�B|��76;�]J%�n��5���u��u��s��\��?�!��!��!�[���T~\݋xR*��7���s��\��?�!��u��s���T"��|	?��E<���g��T"J%�U�D�)�������O��a�wX»��"�ﰈg��ۭ��xQ*��T"ޔJĻR��P*�J%���7v+�I�D<+�����m��U���"�UZćJ��Ti	�ݿl���_6�t�/u����:���F�. f�n� �;{�?��#>�y�}	0����#��y�}0��#^�y�}/�qߌ���&<��\ēB�xV���8��~�}A�!q_�����Aܫ���������O
5�^�Gܫ��{�q��#��Ľ"��W��,1�ųĈ{�q�#�Yb�=K��g���?�^�G�3'���ۂO�<�Y�Gܗ�|�����9����}�ޭ���+#��ʄ�#��yĽeq�YFܛ���eĽmq�[F����e�O�<�޼��w/#��ˈ{�2�����w0O½�q�a&��K��#�m̈{3��ȌxU���7u��#>�yħ:O��&~g�}�I�G<��u�P���<�M�G�Ϝ �gN�3'�O?s�xR��C��c�O�1l�@��;���y�c��C�d~*��g-R��?k����y/S��eｻ�|�\�W����䏓j��Y5���� �  �Q�y��1�e2�NƼʘ�J�^*c�ke�{��y��!�.֤޽ߟ����Kǟ�U��!���?8�����cs��]�|��Y�~{��?�菍���o�	�ݿ}u�����!���ć`>�_������ �~d�y?3��`�O0���?��Yg���i(씈}
:%"�w�))�4�}
�>��}JEz�����OCA�wڧ���{�����}���u>NC:�4���P�>NC�8��4���P��]�w�*��M���qS�Nn*��Mzw��.2��Ezw���]d����t��u<.2��E:���^�p���.2��E���@��"�����@'7��]�T��M���@7W�ݵ��pS��n�n��
trS��n*��M:��r���
tsS��n*��Mz���z�6�j*��M:��@7�pS��n*��Mzw��}�p��2]�{�O~����T�}�5�>ٚh�lM�O��q�}�5�>ٚh�l�>m��T���
tvS����D�dk�}�5�>ٚ��=�T���x��>m8����iï*��F��O��x�ӻ7����T���
��Z��^����'V��ϫ<Hg���'�����D��d��X2�~*�h?�L��IZG~���gS�Xӓ)h��4��TJA�O#퇑�>��ڏ"�'���O�k�9�����>��"�g���!�D��O�}�'�>�h�I�t�﵎�lH'��"�����m��g���c�����5������PO����w�������o�@���]����o�@w{z��;��߿��^7(h��B4ZtK!����AA�e�-{� �hi�������ս�������>�"wS���;�>� ��~h�RL�)&���v���y������5���k@�xb�}:1�>��h�ML��gE��?+�km�EcMgu����:�X�I�h��u��g������}�4ѾU�h�*M��gE�}���.�o�&:��"�ٟ����D�Vi�}�4ѾU�h�*M�o�&z�����^M�X{�X{�X{�X{�X{�k��g�?h����w���t��;�^{'�k�D{��P���*2�ME&�k�D{�h��]��N��މΪ"�EU$:TE���HtS������?��?�ɏ�      j      x���KndɑF�1s�@	�0�"����D�f�ڽ������~�=h4�H��N��7�oy������Ͽ��������^�GI%���e�%��6~������񣥭�y�t�z!]?uMH���uA���Wm��!=�fӲg��i�{�*�~�=k���}Ϛ��w߳f�����YEzϚ5����;�g�Ф�=kƾ��Z��C]#Z]#Z]#Z]#Z]#Z]#Z]#Z]#�t�!���@��U$z�ZE_�Y��DWo*��M%�yS���T�O�Ь�ӵߙ���ˋ�J^d�����E�@W/2��E&�y���^d�����E&zy���)y���dċG��UF�<ˈ7�2��Ì��2#>=͈/o3�9y�?�cS�����uG�<�7�;��o�/<������^�G��G�x���y��;�x��#޽��<��C���P^����F�x��j��S�x�T"�=��Oe#|z*_�J�-y*W�W�W�W�W�W�W�?��_��$�|��>}�gO%��S�x�T"~Z���|�`ll���J�ߟe�g�:�k�xO�/��'o�e��x���!n��n���;�}s�}�cs�߾������:c�������}�{��{�}�Gݼ1����،=u��f�3�}{�ޟ��j�j�S�C��.1^<��WO%��D�y*?�k�/-��K���������:6u�x��j��C�x�P#�=Ԉ5��C���	�����G<{�'��;�x��#n�yěw��G|x���yėw���g�<��;�x��#n�yěw��G|x���yėw���g�<��;�x��#n�yěw~޽�5��C���P^����F�x��j��C�x�P#޽��/-��K����n�K�x��"^���WO%�j�j]N�+v̟�M�ג��D�%�%�ك�|�b2_=�̛7�y�3�c�ub̼���_�]��G��|Vap�·��S@^������y�3�b��9�X�����\v�����/��~0?�������|�W����g�m�}���F���A?�o����p�ƞ�
�o�����7��U8sϟ���{�����gp�f۾B������=�o��3:?{�~�WR��G���_���|U�7����"��_����T�_�/�5%����"_�_�������7����"?�_���������_�����\�o��~��fS��o�7�]�F~���O���~_���|V��/�7�U�F��o���|W���7�S�F~���פ~#�����~#o�7�M�F����w2j�7�S�E~���[R?���'�ȇ�!��|S�����C�B~�_�/���v�gЇ�!��|��~!��/���u��ӿ	}������O���|Q?�?�3�M�D���ȟ�?��?�_����R�?�����ǫ������"o�/�M�E�����w>�08c���?�~w����`~��'�y�}���~"_�7�m�}�~�fߞ~��������/������=�kϟ�����g�����|��=�����w����C�@~�����=��7�-}�����Y�?���U�^?ț����E�k~�]kKC����"�����4��g�?���/�U��M?��o���|��o���_8y��?�K�!����p����篜���+U�D��O�O����������T��?�p�jx��[�?�/�/�U�E��O���|���O����oI�A>���~��z�"o��U��a���c@�������?�z���� ���_�>{?�/����y�~0�G���������O���:A���U��?�O���p����2���̟�?8]r_?�����-�|������ ��A�㡿	��[����H��F`�u�n�'$��$��#���#��~��S�`��G��W��|���G2$S���ʟ���s�n�c��^�u?7����?����Ǯ��X�s��~n�c��~����Z_���]��0�s�M`H�كa`H�قa`H�فa`H�ـ�=7�{=>k?�����n���}n�c��~,�����>7����?������xx=��.����y�}�E#8{z.�^���`���<� wO/�������<����Y�	�md�|��0�dA&��X�	;[,�r�wO/������|� >�+�h�g�6���%;7�z�6�6�ͻp�n<�� ?�����V��;yn�c#�~����m<7�<� 7O/����6S <=��/O�=>�����gO/���p��l�^�ۯ;np���W�u�
��z��U� ?6���Ǟ��زs�;vn�c��~�׹�:qX'� �ĵ_�W�u�
�N\V� V� V� V� >k�a �9���k���M��v��|�Ι��W���W��^r�c��X�%�{I��^����� �$�z/	��K��� �$�z/	��K��� �a�8�$�z/	��K��� �9`=���0����� �{�y���K��� �$�zX�a �9`=���0���7����W}��>��x=�^O���	p�zܽ�  ���� �c�G��6np�z\�� W�'����y=�^O������xy ��9ӯdH��n� ��; �������i�>�a �a���Lky��Ώ�+7�<����X�r���t�F��ʕ�Wn�x�[���l�F�Ǫ�}�KW4kg�tE�vvKW�U;��+�5�,�f�K�Y��h��Z�Z�F��\h��RiC�vvJ���R�Ь��҆f�,�64k����������XntWρ��A��s�h�zi� �Z8H���u�Dk� �Z6HtWρ�9�S=z���z��h2k㬏�VntQρk��K��+����뵀�����q�F��.�l��]ntVρ.�9�U=��s��ztWρ�9�S=z����슮�vVEW4k�)͚/�F��{�Ѭ�5�auˍ��9�C=z��@/��^�цf�f�袞__�g=tX�r�M=���@w�"=Ud���|��^谜�Fg�"]Ud�ME���@w�"=Ud���|��"hC�v�@��VTd������֏_��-,:�:,:���=,:�:,:�:,:�:,:�:,:���#,:�:,���@�ztSρ��9�C=z��@/������� ,���Y=���@�3�Ù����p�t8� :�y �<��
g@�3�Ù����p�t8� :�y �<�g@�3�k=S8� :�y �<�=d�p�t8� :�y }����9����p�q�s8� :�y �<��<��<��<��<��<��<��<�u	�<��<��<��<��<�uc�p��p��p��*}�V�ޟ�E?7:��@U�p�t8�:���r�g�@��\��Y�5�C׀]:t�е��Ș�t�Сk@��k@��k����k@��k@��k@��k@��k@��k@��k@��k@��k@��k����k@��k@��k@��k@��k@��k@��k@��k@O-_�zi���>���b���V袥�@W�ڴP�u�@w-���nHO-"zi���IKȁ�ZAt�r��֏mZ>t��o��=��詥�@/����+y��o�̥�]�LDWo��m!�y��^�������
%z�+�^���UBt�W	��_%DW�(���W2�ƀn��At�+�3k	��7��gh!:'��: }�֐�jЦ� }�ƾj]e��E��C׀]���t�"}��f����Y+�y�Z1�覞��s��z~}����L�����{]�ztVρ�k@W�hSρn�9�]=z��@O�襞�kK�9�Y=���@W�hSρn�9�]=z��@O�襞���s��z~}k���]�s�M=���@w�衞=�s��z~�{Rρ��9�E=���@�ztSρ��9�C=z��@/��^�������Ь�������Ь����h�����u>7x�衞=�s��z~��s��tV� 2  �.�9�U=��s��Y.��,衞=�s��z~����f�|n`h�����]�s�M=���@w��p�q}�~�p�t8��9�p�Ax8� <{�=����������p�Ax8� <������� ��pBx8!<��A� ��c��9�%�NB�������Y��0��pBx8!<��D'"��p$Bx8!����W��pSi	o*-�]�%|���O����n�B��F��J��N���&��p)��p+��p-��p/��p1��p3����.�n����.�n���� ��%��-��5��=��E��M��U��[�����Yx�s����|!>�'���yf�l^��#Ԅ����m��xߜ���Sg�+���~�_~~����o���瞺���=u������:����W��W����w����;�M�w»^���	�z���z|%��	�z�~Z��f����������SgllVW�?��������R*�yNI�$<+�����T~Z���w�T�o^ZĻ���E|zi_^Z�s��"����/-�u�q�P#�<Ԉw5��C���P#�<Ԅ��:6u%{�/jī�q�P#�<Ԉw5�z[��m���T�	_
5�5)Ԅg���P^j�M�&�)Ԅw���P>jB�%���P^j«BM�i]e���wu��P>jBxK
�w���
5�E�&�*Ԅ�BMxS�	�
5�C�&|*Ԅ/��j³JKxQi	�*-���TZ»JK�Pi	�)1�K��|6all�g���|6�*�w����)1�:%F\�Ĉ�q�#�Sb�uJL��)1�:%F\�Ĉ�q�#�Sb�uJ��Pi	�*-�:%&|�1�����D�T~�{_qS*	�#�+V�Ŋ�X��{^�g��B�C��#�*V��bExS����Dq}"�xx�<��:��s�����_��\Gxx�#<����:�C��#<��ZGxh�u���:��s�Ṏ��\Gxx�#<<��� �Ṏ��\Gxx�����Ǐ���H�      n   �   x�M��
�@���W�P�yj��7�eP���+ņ�1L��>#��n�������)�v{U�kV,�`O/��:m�#ۂC:��=�����F�HPj3 � ����([��yhbe�e���u��Ɯ'{�V�ZC��.����A������_�3� ��$��W��T�7�      f   h  x����m�0�o��4��\�*���:2+8�����A�f�Gi��!�'Q�w�3�R9s>c	���s�����P;\��|�U�<�w� e#�Mv�����dIY�"(���}T@Y���}�I?���P	��,UB[(4VB; m�����	�r�T"(���	t����G���囗\������VF��i�����G:B}M�#���*'��;��&`i
�W�R	�W�R]ݴ��jaie-�������n��|�4kTKKkm�ZZkE-����q	������ڪ��ڦ��kl�A�N����&ݕ�ȷk��M��a�n�]mR�Iw��v��j�S�y��vf�E���Lm�H������}M������      h   O  x����m�0E�5UE�@"����
��:Bg�������5%K��i��*���K�.�nS>￧��蔪�)5���J;����j�[^�L��j�v���^�I班c����C9d�)t|����Dk���k� �� ��tb�D���T����o{Rg�Y�Y��Y��za���ۅ�`��Z�pi�(��I �o�Ŷ�@L��C���n�Wpˀ�)�š���X���(��#̗��b�`��}�ݱ�ؒS�`3�`5�`7�`9�`;Ϡň��Ƅ{z��U��G�>�`�wkb��w[łY���]�Qﶋ�����)�y����ꅺ�      #      x������ � �         v   x�m�;� �N�4첋JG���Xh����'۰�L2ͼb��)Ǜ�����l˞�������0:?$��,�/�E�ز�+�bC�2U��%�����XYV��r˪�Q�(6���[zk���I�         `  x�}�1n�0Eg��@
�i����z�,t�P���4h4����l`�u�~�j0`�tJ�	�$�����5bۖ������>e�.�,��hVt����"�Ѣ�٢���Ţ�-|DY�ݢ�G)8�ܶ[S	j"A<�UQ[S	jj�GtQ��T��H�e�����=q��c�G۴��cP���� �,�5jۼ��r�*�6/yg��Xu���Q%�cU*�^�^�}r��R��?�����5���tT(�tߘG�K�w)?MT�p�R�>T��	�������w�Cu{mT�?�-�k�SC��zmT)n^��P��*�~s��P���o�nP��E�;��m��F�         �  x���mO�0�_�O��R��;��!6a��s�
P1��[@�Ⓕ����w�#�G,b)pՉ!5On1�Д�5C��:�H�tm��x�b�64ۼ@��1�@ѥ|���>��2Nc(8"��e��\�D�p!��Q�i� �^k�e�a��j�C-��ު�%A���������^�7��<�5$M[�r��s	�\ə��a!��	b���j�x��#C�Y�?�{�H	)�g@�{O�$�9u�u�d�&x��L[_�����_�"�L_!<1�O�ol�R�e�+@<l�E��ԴD��s	θ�����qtpv�̜nڌ�8��ξ�����6���o�V��|�*��sI	��V4iED^Zcv��7��|uX$4      -      x������ � �            x������ � �      1      x��\]W�Ȳ}&�BO������iDH�C \2gf�ZYVǖ�+Y�8��Vu�l���؜��!c�Qڮ�]��E���?,ŏ���#���Q�yG�\1�(��,ڊ;i�;7_�R;�&�_�$�e��IDc�Rzt�7y��xut��ī)<1"o	�?G�v�K|�֟�r�ˆ�Ü��uމ{>��i��\.\�7�sY/�3^�$9!̹�]F��9<^�?Ϲe��7���<����\�݇�<�Gx�oI�^K�S���P=F��С�)c�~pD���74	lP1���]ە��(*с���D����T�%�*�+�|F]J�dg����%�}�"��V�h�PxL"CO�:�|:�WOSo�^7�FN�������	���gC�(th,с/a���5&��+E�I���$W"���9X;�^�K^�w�y����ht�������̖��MsmZ�@#�F�;%������F�?G-|;��|P�O���0�xP�yS�e�R�x�K(t�������\�|ar�Cr������V^9�$� �,�K�]���.�(1 �6�bP(� ��)D�Wै�Dg��$FB��� i�_
�`1�:�|�o!� �B�߮�x�%����C�v��y �"�F$�������.�4>	)E<0�<����g>o��ľx`���H$�wB"�O�w�Ɍ?>��[=�cŋ��f��8��jT|�J��'���DmL#�JE�z���L�e�װ0V=6�B<Gf�bJ4l�QB����P��
վB����O�wg�/��U��F�#�G��$�@�/;綃lS8gs@#El�h�	d9z���w^'��y�o��/�8ف����4����9T{�F?�R9O�$Cf��Q�ŨүH1��0�ř ��p�����{J����)�����Qx :�W�-�W��]�~V�`�J}�����K��"��+<�Br�L�4d�a�xo'��8V���Y	�p�E*_�3���3���i�S�1ec�L3a*����,H��k>7�)JH�(*��`X]=���Br���J(bp�5펁���T�&�<+����.����ϑ��6��4ѥ�ҝ?A:� �N:��K`B��'1�t��,@Pbx�������o� �W�/X�/��/ ��7�3	�_�}�h[��]( (1\ŷDujI4@Ο�Xu L��e�d'>�����. ����p>,Q�g��=��2G�ɻWP�1���+;�x_|�SbP���0�I���iй��H�F}r���e���/�κ
`$����ӧ�ģ�l�
Hum��%��d�dW��@�~1�� T� D�s�\A ����˭*��a����@�n@���\T]��+,��������ւ<6�������G�=葀�Og@wcH+Du�!�]F�4��brݵ�pMT�S7�u(�1�:i����D�fx O5���j��l�f�{-����D�>�l���PH��ü[��n^oJ���`���>�
�؁��4E���;��)1�d��T�d"����0Ǣ�6�D�[C���i_d%t��0�K@er6Q��+T�J��W�O���jtQ��j��^�K[��p�Nl�c��T�iB:��)��ė-�W4d���+�j?�%�,}�����.�ʾ�U�?�L�$��cE�TZ	$/�P�6�#�T��C��®�.�lH�#���ed���[��U>���~��4�\�=G�1[V���6-QU�zS3Hd��ꫨ��Bf�O9t7��LeTJ N"�&G�2���+��={.�`&<��e=ˋp1S��&+��Ț�����YA4�:����X�s@n]l6 ���]��Yz�~����<�pT4|*�z�$W��p� �E��]ł�g	��+�x�J���� �/�j��O^�Xj�! ����zq6y'�D�SX���	|F&Z���A����:�&Hd�ԛ�>�&�M`��M?P����8�������F@B_ֆ��@�I�ΐ@�>X����������Q�̵�[<(t:N]��₯~Vh��Ͳn�Ů���8��	J�b8@������0�㉩�ӷA��	G2?'��#�\OUf&9�Nɒgy��sE���c�pJub8@@��g8,��w�U) �
*�J!T��@Tү�J"�(bB�K�}i����b?|������4,����hj�
G7m '����n���f4��ړ|:��#뼛u��UU��R��5$R��-�q�vS��2Y��A62��>���.���k��g�)"���Ҵ�L\�궞�۳�\g9ꕓ|�m��ʰo|�u6���mpc��j}2��W��S�|&��@��H$uR�́�A�#�7��9J�e�/�+Z��T[lw�~k��k`\�٠񶡁��a1f��P7E�|�]�ėP�/hҪ��ʷJ���+S8� &���d�5�
������Z�_�ҁ�ŷ�6��`$66�j�ɗ�fҕ|%g!�\HHT�H=To]mhug�x) �l�n�9����0�	��)�`��,y[�o�L���6�<��F� ���@+P~��x�m3�ᶆ�D�Y#I{�w����T��'��'����%���2,���-z��zm0��p	��K�7K�\�G�ݒ��c)�ă��Ō�s�_q���z��e#�Q-��D�AK�;)����[���e��3�m��i����H�Kc*B{������z)Z;�wr�:h��P�Df�� %oV�?���45��/���ˢ���g��X�U�a^�����P�d\������ &��L��sw!��a�]j+I�.I�|⸾P���g�۳h�C�gP��^���$�Ϳ�`����������o����t�����e_L�i���������IQ?
���5�-�JL@t������>�#,���-k20^��Cǥ�:��}R�6�z�w=Lf��6�hӗ�{,*�ܕ�_z�s6I�B�rq�rB7��wW��j�E"s&<U��L���M_�{�ȫo4�ό ��葢'K�8_V��6]�k0r}.�i8bh�tɤ�^%t���|���sU���\����������dW�hAďǰQ�@S9/V�  7*S_��-�s.M#'�u*9�<��^�`<g�l�|iD�q�r Z�@����9 � Ũ�����y���l�|��O�0�ȋb��QC����q8�@�2�;oQ�l�hG�h'��	\�Y��4��t�P1�F�|M�<Y��|�[�U7) ���C�Vg[ ql�;�'X�>�L��-MN�Q�w�/��[�n�nO�1gE��a�Is8OV%�BP�'��D�U�!��L��8�+йp�e5�*&�G�.)�	����4�mX�+4�Ֆ�^,�P����5���62��*� ߢ�%�wմs�H����Z��N����qtH)|��>JT�|��Ȃ#6����g��.����z[!�1�p.?�i����K�bD͎�uDպ��'n����v�?H|�����I��u�q-��\��۫�)1Q�qb_sbO>��!�=rz`nB^���`�!��H��|Z�˛��#gK@zg|ɻ�X���l�^�|ɚP��?��
�ߥذ�Sd�d���������դO��:���Zw��_H��2�ၗ|u.ӯ���s~���H��P�1�$�����tЂ
5j=��A_�Au������hI���I?�K�%�UW�v�S*ZN��O��T%>N���$E&m�j��(�fs�xG|� 2
?��C_�Cu���g+�f��p�9=W~�,�p(���9�:�R�eol����LXc����p�|������
/z���������h#��&��t�U�����C/��K��G��B��p����)�*�bq7ȓ�q~_����ǻT�pC�,Xh���$\u`�3�Tp蠶F������4����G�����Q9�R�Τ���,��b�$�5R���%AD����R `���tz�t�e�5`c�8����� �  [����6���ߚk�E|<j�k����Զ��l����l7�,�h���5,����J��+���ýH'�ۇ�@�r�)��o�a�e���Z*�wF���X'Hlڙ��3��%���]]&�>��v?5�.�����䳗+�س/�Y(��Z����i9T
 J[nRJ�(I��m�f�ࡦ�J��7S܏}R�h���*��T�Gg�L,����bEU��R�P�U���¥�ze~/vi���;F4�s=/��z<�7<4Rdܶ�X$&�T�J�PM:D�=jD�,�7N��g;��꿪L��1�Bq���}���ϮC8����]�1�<���!G��:8�.�y���n�.�}rp
�=�
�@�9$�mU�@�¼�Y��-��q���pp�<o�)T%
������qz~5Rb���en�O�}`�Jj>��>��Bh�Y߇��V�1 �g��g*�θ��-��,��Cwɀb^umQ�!w��)T6���Q(�@�nհ��h���H���+k]~���Ȍ���(}�)��~A3ض�H�$�+�e�]�>]v�\1}ɷ{޵�\��&�C��3��c���牮���B�c�hb��Ƈmb����!Q��̋d��|��9��(���"�F\~�G��c��k1S�ۧۺ�M�7�2���Qf.1�
m1^i^�4�/R�}�O�N/��* �k�7���~�L�6V'��v��\�aul���V�]���`��.�<�~�O4)��S�:7k�����7�\T�3{�ɩg�s�慶k`�d���k�Cz��hh���Zx��y����1��g��/�r[��Sm@c�fb���u/ cW2�Tu��p�Z�p����L���Z��n���cb���Տ:i�R�_ �B߀\��{�ԭs�Q��K�K��}v���$	���I�օ��Uj$��@��n��-�)�&/���jCZ�+���D���Aɮ�J�ƞ������󺞽�'8��VdC�q���_�\�����]+��#�ER����z����A��8#�7BF`L;��'XW�d��M�O.�^y����nA_�4í0Uֶn��~�#��J㐸��VYS:��r����̈́5.3���.��Z�鮅0:^`�cӤC�I��m�7�p��������}B����kn<�UӮ٠�w.q���=���4�am��k`��԰����I�b?�/�9��k��4�	~8@�õ����UB��Z��3"\_u��$X\��Ý�^�n2����[�֟��?S�ֺ���vlc]AZ�%Z�+�-��.?_JU��s�U~N�7x8���~-�h����;|��*l������r��+��#��$6��ߩ�\	���[zk�����VJ�����ұ��x'r�A�����ǿ�{��si�!��2dU<|dD�!���<Rn�|�W�(�t|�o���|�<����D�������/O"��m�lm���܈�8y�܅iwQ�c?��I�ٹ���zL��3���.g�Y:^���bҫ��[ ��F��]:q>����6unGWw��Q�T����?�F��[���)��ę�?�P��|)2yL���R����^rQG|ƀ~)�Ѵ|�9!�Tc)2��q�ۣ��y~��`�����T,{���͛�� '      '      x������ � �      )     x��ZIo�H=ۿ��	`�EI��c���ؗ�U���\����j#)Q[��dz G���޷�o)nnf7�q3��]d|�3�J�'�Ỗ�왫��)��Xy-J�����8��8㍤{���o�Ţ��W
�*0�'2g���y��me%q�˸ڥ�bO�l8�o�ç^R$��f}��E�������yi����U-����Z�"�;�T#pKC�2�9!y�vB�D7��lz�o͢��l�8�J���b=���VW���_D�k�s�,Sn��dׅ6 kK��<�qy_79�_�IM'ө�4r@g�Sʕ�T�,nSR/��Z��(l%�N6-T����*�Z��V(�c�9L�&h#�	Ď���
���O����ͬl+�è����E �E��wm�j�o%�cU�� ����r8]�a֢j�I0J��^
-��۲��Y'	��$؈Rb'�m�x�+yO��,�4'�ٳ�Ǧ��N�=%ȃ�$ .& f�bۖkL\�jp���A��jD^Q�R-��wx��!�a��__�|���ԡ�r�,=����ӗ�_>ۨ��ļ�)�Yl��(��@̷��RK<US4��0p�O�.�L�0�;x��(��o�:X0ʵC�9�PU*{q�M�xf?&7^�M��G)�����Eg]��E"�?"Gr퐐��ޱ�"m3amk3���`yG՚��%Ƙ=xe�e"�f	�6�Y*�r-�ys�?e����h�͉
�%�������J5\Y	�Z��3�M���,͛���9�_�}�R�1E����ha�8�<'MWsZ�ސ�W�&��	1�J��/����_�k�0�k~q�����0L���*	�,��ͧ��J�V�a0#su���:3L53������
�01�N�͵4��a�-�p�IwA����ץ狋�c��^}~��K�ו�a�|R������ǳ����<��U�>=G���Kjq���B��ƆÖDׇ��J���'*�(o�����-�l����0V��Ŵ?��^3��J>�0~��x����b���������悂�E*5$X��%�>n���&|�Y����?sHH�e��t.��)2�Y�P�j��RI,�����P7��=�Q�q*�-�9B��d����k�m�)�zTy�G�p�3��&��i� ���6t����^��,��A'B�-�u��0��mɺ��~i9�/�D�2�5����f�7�{w�����6�OE��G�}���1�x����]�����U�וJVވ�P5Kem�hZ/��?�#%X���s�pd��奎@��nZD�.�b�׵z�8��wmM�B AMW�3���~J��?�F%��P��D	���q&���'��tO�媩�^&�r`Nv�iΩ�4Xfc������Ђ��D�`��≕�(�T�� ��ެo�n9��G�i+����i��nG?�-<�6���n��Eݮ���th�Z-4K�E�c��}阐J�\7�@�F�� E�a�7���,堪4��V\^�+�ĥ)�U�ܾ�5N&�5�~��H�]R����Wo�)��{Wa�ˋ�c2W�=�Qbn�Zڒ�����$mۘ'�>�ߕ��q6��O����n9Z"��HG)w���~xg��˯���/Ƞ�����A=w���>E��J�E��H3�>a+|�x���[����D@MU�B�}���a�EA�,����.nw���y���*B��g<)�ƽ���6\�M���ti�L�l�EC�韛B��ZI�>B��? �'-�1W�g\E���,k'��9�BO�3O� [�d�J8�4Bo���["-y�T���2�����	��l0jv,+s
�Q��<��B<Λ-o\��F�TW�i��j���Y�	w~Y�0����ڽ��e����ɻ���r_9��v����̗� ���;����q����7�aw�/����������j���J[����(q��F�N�梙x�P�|�s,4�M4��hR["�����Z����'K8��*3���V4E31��{SIe�e<Ʌ��T��SK�0�jN��������[�����mT�(�i���ko�e�5:����p)Q1��U= K������EJ k�З��}��0��(F���Ķh��6ñ�U�gWT��lB���*���s�� l�6�6���joL�IK �#T�ƫQ�Vz�W��=c5�:�#XhC���Q0 IR�#�F�{�5��/a�o���/;���&Lꉔ%�^�;�Ѓ3S"�=����햞N�G�^{d��&G�"w咶h�ڢq%�&�=5��,*�q�6���f�除3�o���ȔpZ*�P-�3	��o�b��9�l_��'�P��d�F�"C���h�k)���	�P�Q����鍥����J�ٞ���]�(V]�q�����E�wMV�ϕM`,{�C]wM�Q�#�;H0�6]S����`k�)R�p�������;L
n�� '��s4Q����i}�$�yXhgv���A�h��1է���&�,���;��KSao�����;Y�h�/���hн$�F����*^e^_R䍋8�75�"���M��y�R�߇Mn�?��n%K8L0�{��6���*k�����tF�5{eۈ���]�h�|LZY���ϗ,���zz�ܽ���1�6��f�t4��+0XЇa#u`U��(���3A���nw&I�3��e����ֽ�ɫvG��}Y����(L���-��J� �F+ۑy���a�ظ��~�|J`
d�����t��ۧ�~-ѝ�w�\�̛鉒��� 9�������7�      +   �   x����C!г��/�*1!��'���QNU�8 ��d�* �Kg���������T�`��:�v��,����`���_dj�*���8�����_eE�3i��NO[iC����?�p�ɑ��2й���X��.�| �@m6      %   �   x���͍� ��3T1��?8�1��:�����@�!�GJ�^QS��!5�}0������������PBL��V����~ �8�
�\N�I��>�:YLҁ��d5����f��������DP�(`�:����w����BmR�&E0���0d�H2E�>��Ð�h�Y�?$6M:�⿶��&�咮��&}�t/�Ѣ�,���2�_�f���&�[a���ST�3%?(Z��H)/�b�mFJK_�U��H�x�T�?9�_�s�@            x������ � �      !      x������ � �      /      x������ � �         r   x�3�4�,N�M-.I-R0�,I-�4202�5��54Af��&&�d���#D�L���,9c���ˈӈ3���58�5h&P��\���44�56��4�B����������=... �%C            x�ܽmw�ȳ=���)��Y���`����f#�G�=x�ZY������O��j�1�4����ߜ�{���d��]U�v��i�T����5�X��Ƚ��k��~�6R�*�CU��k��&����k���a���O�t�]'>�1�����>�����wH����i'z���6��d��7����Q��?���j��k��y�q��~Q�_E�Ӳ�z�����g�>����|�*Q�K�\R���_�a�Zc�F�A>�M�����b�p�?�ͰA��4���J�rET Z-'�N4_B)@�r���K�V��_��!�)u��#�a�,�yc�&��� (x���a���(��NϼN���!�o�y\]�B��"5�gq=L��)��Ua�4U��bZNU�t)T��J����u9F~���;�s8Y9���5�8*��K��$w!����>�N�2C�&\�		��U�g��u�)�$eN�nY�nh��Bb)���b}��]F���nZ��9L����{7]�C�<�4F,��x~N#��.�;HDW(��u��H�$Z����j���j0�����L3ݢU#�(U e��p��&����]�{�8�JP�q�Q�4G����$0��������]=	��p�W�z�E��'I�u�R�a Q�]�r�p|��p��A?h�]�aT��ʀJ���c�y����Q�<�7�Fݱx�p��1@\ڄ��>l'�b�
DC3��G�	��Z^2��%=6�t��Y'| L���V�u�/l�[�?��]y7��Hz�؏G:�p��H��xa��00pr4[���/�!FπѕZ�~ x�:����9d�2C�n7��e �~�b���j��xY�i�5��M��ϳU=����s���y�4jkT׫�59b�,�j��<8r}ĊF��w̒����1�/������6�8��(N��SO�Ove��tG���G�F�W��z�7>��}�i���߈'�b��_��_�"�
����<�X�hB�u���04�.�Z��2DXH#鍂��h��0�C���x����X*����CF��|���#1�C �����еܦ��ǯ+�w�� M�b>G�(�CO×�]}�M&��$0G��b|��M�z����c~����[�y�,)-w�D,CX�U�*�~Ļ��:$���a���Z��1+	�7���S�<g�?m���^����5FRdV��8��,�2��C5Y�!c⭛����k�l3҆�`w� �HS[v����	�8kύjV��G�!|ޮ!c���T�,vx,j�Ԯzx̓ߊ	ʭ[5�At"�x���僸�������ܠIZ��������f^�2�"�R�ܶ�E�RV	7o蝥�OF��#�y�r���;�eVMP�h	��۵��'c_\8�;F�FT�R�3�z}�� xuG)#O�!��ċ؀�9c"�y��\
܋������:I��m�[�/�2�`Ϻ�TM���	n�;�<�~F�2�<89��<���w�)y��K8e(|Sv�s�[������`��m��Us9>��J�wo��f4��������F�� ��p�������6��2p��C$`��!d��Y��˰L���A,�PkN�ȴ!�g���	�9ě|��r񷕁��er"����o%C�[���C��~X��e��b�N?��	�n�d�]�o�{�A��NJӑ>l���M
c�o�\�0�4����T<2)ըV5�['��,��j����-4c����C(q��Hk��.��z<�������%\l!����Ļ2�R���8��"G(��l��x�;�=?C�\�Җ�-�s�O�J/]Q���"�$ѯ�JAd���VPr�%0�Z�^�f�|�ƽ���ɑ��_��;ւ�M� ���1��O�I�����u8��eh��؎a*!�����pj�@�@��Qx�w��5�0���Ι�>���F��_�#��:���|��EH��(������R�90�i�O~�LS�K;��,���G�����x�qz� ����?M=�Zi��߸/��D�±)z�ބp�b�˲�u�TM��P	n`����{Wm^�!��l�7��ɝ��8�ʁ�g
�	M�8d<\��~7�!��w!D��zW�o�����r���oR,@,!������9(�m]�p	���~�(~�LV,%�"����i���h�a~�U��^�AZ���dv�>^.9q�;dQ~+=7��<+�!���RS�6�5��rm��
��)s�,E���)h6V�L�F����X��@��1;� N�6�gi�l]��ʂ˨8?YTOV���x>��z��i�`���p�Nqt��
���1���4�ڗ�z�c`z��2DN��!��X5n�'�sՃ+��Sγ�LQ�����j7
���|9�����R,��+�K�/D���y�ڧ�2�.Z�"�����-\��0p^���\D�PHZz���~����!L�e)�ǡ�m;W��~��}�h�rDq��k>�s��mL���6�^3�Η��k�*����������w�Q��W��gV��/!��u<,\���S���厙�뚮(USy��rӨ�.dl���ٸI�mp��̳��	��Q�)bQ%�c�a�Hۻu���C�J�v`�ݾ}�G�6Y� �e�&a���,��/'��*{�4ժ4ޑ g*"���+��܌��W���n4i6���ӭ��P�E�i���X�a?f��تmT��ȑEu��2���+����tp�ϑ.!�������2g�7�
>�	�E�~/J���U�=*�G��&Vч#��`Lo��u y��}�f\ԲS\ ��r�iH���7���2,.\Q����sd9&"G�g��k��+C�X*����&k�o��rD�.��T�'���:0�܌��Ӏ �*{���+%,t,j`�������u�ls6!���:S������x�pOټT��h�U-��鯅jfxY�E_3Lv�w�g��~n�h�r�Q'���W�㒛p�����v�\�?�~��c�kS`M9����H�-Zc��$0c�B�l0�\?�\ޜy�V�T�C�b�xۗq�i�-E��ژ�H"��봇,�|ߟ+LK�g�^e/	�� �KEaD5J��B�BYCh����he.�f���j7�R�s[��uQӃ�F�F�|{<�O芔t_���:U����iB$?�ŗ��o[�����$5��8p��*g�\6l���P��r�p]��Q:���<��N��Cr�l��<k�T��9A�����D�M8�g;�&03�bE�*h��j�q��5� ����"9�����HsQa7���܏9 W�K�۾ּ�[N�u�`�Q��h�f[V�&�H_����T����k�z9]�*��j-{u �| �P�Y<Ř�����fi��t]��Z�ЀqY�����9�S�Y��v�q��wˇ�2�����
%���q/��x7-%f��0��B��� ˖Sk�i`��f��2�M^%���Tި�� ����n|4��\3z��G�)'=��RUQ��G!#H���#o�g�桨�ȡ#���,�6�2	��j�䤯/�7޲-�]S�9Ukg����-#�m����}��Aꪜ3�%���FN�u���BU�����A5����=6x.�'9��}%r��'�So�I}�og�&ut8 ���7P�j��:m�==^̆O�'��6OrhJ�%��b&��/��|��D	�6�5�t����z��N���I��{�:�c%�:� Q�.˥��TUɟJ0k[�a��c��=8��'�&���J�4��V�7%���Â��R>��_Ჾ�O��Jw!�����6C��Z���C����&%�7MQM�Ma.Q�����^V�rF�RϜ�Ԩ���oEl�����$ܵ���qSRW卐nVK�Fe��P��1�c�;�5,b˛F��4R�z�r���N�&�R�� Զ�I��u�T8��,i    Y�H�~�G4�v����vmG���M�����O�,5u�j9<�\ۨ���I���Q/���]0*y�)��5���`?H����w8�s��7�dw\��RzC���b��@�_�v��oW q31|��AUv�N��H��c�kx�b��e�3%Ӫ�3��Gt��a�u����s���n�s����4=<�g�h��Ф�l��~�K5|4��ͪJ�3	��(�A��s!B��ɞ|���GG�k�J��ͨ�'-�� �s�cQ�����w��$��f'���p��\�L�T��S/Ipo�׫��w��Im����7=���� !��w�N��25�nS��e��Ϲ��ް��C�.)fsTG���5�ńI�vD�b�-dmcr�<�D�Mi����E��&��ߐ���	6�b��'�ECYd���Y�+��\7x�fa�	I1v�#J�:���Zn:���Up�[w\��{�N���7�����v�(�6�H;�˽�?����bS�I�k+�cRuծZ��c%ȸ�ט�+Mp5�f;�:��-	q�������u���m�$3L�V&UQ��Ԫt\����Qc��ػ�7�*`��9���m��%�Q�7yq����^Z�S����KZ�k��y�C���܇a�	��56�*.$W^?5�!ݾ{���Qi�{�6�aZDI����/#�t�K'f��SN�e�l֏�8s�Τ��8��Q�v�X8a�G�� �f7G4i��n�2��Û��g�i�Oʌh��h�Z�l"��05����0�25�`|�Ф�ð�=�=#�шKL������O��y<��]
��r3�hNa(pp�9>��;8R��\r�|���9p�pC��t����[b�'Mq��9��R�	�]�eʑɨ��(5�4	�_�5��/��{�)A�C�of#|p��/��o\���Py����C3p���z�a	�t��=69.��EŹ>P�%lw��~�a����`M���Fo���3x��|����ƛp��J�p��?���v	��d%[�i��3���d�:�����6Nn����G���F����rߪn`rR�O=�N�o�h]8�(��(d,����#���i�b8�΀Dc�isq#�F怒�F$ӷ곙u�T����:j�{Β���B�c��^sL�6*��df�8��jn�]_#�-8y�|�D�Τ"77�:
�!o�aۅ���*����0Q�R�Rv���H��#�1j>��ZA���u�G�$���r);��L�v�����*��R��Y�SQ�(�EW,f-H�	�e� Mv�a#�@^ч�+��ܸ�j({��;�h�{��#õK���#8r�Qh�-�6`]�s��u&� �^'�t)�Nl�;�Kn/�/eÀ���O1����x�Xl��[+�^�œ#ER6Z��q\�j�^��nz7�l_�KJ��b���:Rj�Bh3{ ,<q�tPi��$�������R~/8� ���+�	��ZZ���uT�եE�|C�&8&�V]CXT���M����v�*���'^u 7qx���OM����ӫ¢���8򶏻��{�Jm<���w��_� U9��\��#�#������� ha��4z	g�{U ���g@Uj%��0uA�U�Ʈm����}} ����n�.%�W�9?e~��0�S.%og'Z`	��w�[�!�_l8h��?�K���J���p�c8�R��"�Nv�
�2 ׾gM$RX��z���&���4�����Y-b��p͇��LW�?Wu�.�G�v�C���*t���D�2�Vc� ^be�x�)�iL��:${ٯ���! �-���Z5�R��1ݨZP��"ط�÷pո��=��zW���a�r�|�7�}�ܜ��*�|+,n���x&��L��BF��U	�,C0O��|薴�7�5�����rr�N��Z�Қ��Q
6uE%�Ϻb��%��*Z�D�pv�6���a��
������?�����@��OH�K�� ti�V��)�1�QU,���<JU�� �y��Y鍗�V։�?��XM��M��"^�*5#��s,�2��#"����f.�h�Z�9�r�f*i�ѹ��^�S�c�����$���oe(Q.��G?A=U^�͔�c����F�q�<�Wl�?>�%IE��'=��?7r�7fl�����.|*q��U��+J�N�G���}�܏��� ��;�T�_`��ӡ
��H1K�LZz��bq(�M6�R&p*U�*3��$'��/z4����R�.�6���rc'�.#�)B9=|;��r/̀����$��e�������GA$x%�(��"�����Ҿ<u2�9���6٦�fp\����X���1��T>�����M��~��@�`T��Ēj(�M��=�t��͠�!�G���6.L֥�s,ö��cɚ�O�4��e�`4hB6ѽ����G�#t:ˁs��['C�;ꠏDk���J�Pͽ��4z��Y\�m�S;i�C�dVM�䨉�/Œ/h{��4t{��0� ��)D�%X���<$���5O���ͷS��\�����p�M���O�?)�F�_��X�!:4�� ��B+?{RM�ѩ��(@�\���i��-�o�2.�q���s����M�̝���/Ic��[����Ǉe}m
-��l�rn,Mp�Eb�y�.�\䯧)��]�����7Hצ4F���!��?��7�jv�O/~�o��@jm�@>_��}�s-��z�7�����Y��я�J0sj��s�p
Ƽ ��L.���&�q����yǪؘ3Z���K�4C��^y�Y��`�[u���+����%��4�j�q,5h�r&�}��v���4��2��:�$���S4�/�)��Ԁ}�|��3��{l+��g���������(���,ڏ �K��؞��[����8�h�eTe�2�,ޑ��9�]�<M �E�]�+��2��E;`��e/�<~��-m&W?�UlB�����\�}M%K�>���3��H����~���'_XX<4٦�V�HP/U�f��]�S�0��D�ި7d�y��$�`$�+�@�o����٢܈�e[@�+q)�C�Ӱx��P�Z�'�G-�=y]�94�wm~����Fl����i�����(f񖰦r�u>C ������8�揉|�`�$��,������":��Cf������vAX���&�..���'��j�Cg��j�#���4-�Z*s/S�Ek�{/�]y�� 3�䎝 m��6��>�G{�Dϫy��������َU�X�E�(h�kl���z8X�71dʂg�}f�&�bcW �A���4�u��Nf��5t.%��t]�?�f�#����6�D�M�+�gZ)<��&O>no<O���ဧp2/���r��9���Y<��Qk{ݞ']g�R�RM�Ѿd�Z���tU�*]Wh/�﬊S0�h&.���L`�~�Ǭu��2��:��������Q�Ad�����0nƥ�G�	\�����7^t�bQ���,^����R��{�'"�ZKC�,����
�.4D"�$J䕣h�'?���+)�(�OT�or�aV�ע�5?�#7O���D;�M���u{�����ı�y�ǁ'R�(	�Mge���knZ�b��`ɪS�1���]�u9���[�I��
c�r����o��$	����:��bTT���C�d��Y�5�A�k~��nX?U搑��$M	Y���)1	���7���>�|	w�0%?��Ë]jP���fV�mv ���Z�A��\ev瑛7��!�˥O�"\�qYBVZ��&:LU%�r0���.��Ʒ�5�ȟqD�_�$k�����
��\�o���e5��e64������Lb�S���L^�f��[��I� ;[�l.y�f�J������d�[/(k�,�v���Yd�z�'�(��=����Q�$o���ص�p%��5���?��Byx�#\�	'@�ʔ�UC�؝?�`�ԨaC��_ic��F#RЉ�)|�&q=���V�n�V��"`
�K�w*�I3>o�ǪC�����	 ���;tE1C(� ��R�(
ė    H�]j@����.$��cA5�!F'3�A��!Y}�-�n���m.�P��G�7�ʜN��tԩ1H33+�8�փl�z�� �]R�7!L]� Q�����������	n�(
�,�ǳ�z;�]�^���F� 6�r�2�Ӕ��*nx���� ��𒲾YjJ�~�!F�������ES%W<S�D��"��2���M��z�8	֣��qǫ��וH9��i`H3�c���g����+��",Z��p�����#�.6��3������)��UөeU\�|��4��`�1�r�J���1%�pߡ�r5�-�:z�d_?݇��b�jζɒCc�e��ںZm��Y\�t�@x|�j��p�[����'��$Xj����Z$D5 ������_>���*�����U}�d-c�,H3R�60h�K���^4��-�p��Ezو�-��/��n��Ջ���bt�O�ez4X�R��=)2�`G���QtO�u�ퟨ�R�t�[�'�`��\����1q���|�#�6�����)2!�V[+s+A�4��ßܶ��	��!P�|��fm���dQ�p���S���ݠ�D��+��T��<���jv-u��!,��ؗ�&,Ò�_������C���׉�UOŜp����q���Z\��1E���.9V�Ej��$�=���ߖ�,��H�z�$�~/���n~X2�١v��3�:@�7p���9��ٱ�|��_(rE���X}��M��9c)��\�P�[~���p�I�����҇[���>GSk�o�����>��/r��L���\@n�щv�Zƥ3Æ��D[���{��c�YI�Fp҃O�k�������N>�?Dƞk� ��b��R�RU1�jۿ�KE��,����w��L��J���@���3v-���ve"{n��a���R� �4�e���:"�*�K\�LC�V�G�4��G7S�
w�m�Y���`�)7+�t��r�H�
�&:����(L��O ��Pb��T3�9�- �k(��1�r�!?r�H+�b�L�מ��}�(�2Cl�z�������;��p�-7�Rw�Q4
�����rU�6�P�9�(�Ogr��c�g8�|�s�9<��99�)	F���xG�N�֪tZ�H=lH=���q}�5W&uyt3/K�$�ftXw̗}�7�����M�^��9�F@���լf3w"U@d��=�,����3I�a���i^��-�:��4p��77������v?���x^��T[��jQ�rT g�����pyWm��u�U��-9���9�._2��]�^О���w�b�Mb������EG�8����	'�;6�&$�9�uy����-0��#����"�=S<obntQL�x�R��7M����`Y�֕4�g��1�.z\�rt����
ֳ7���Y���O��?�=�[B��b)�����«�/����(@H	VE�^����ZC�^�������z�����XJ��Ac�Q��:/3�P�XVs��Ȋ���\�%U��P��i�kg0�\�5t�D�z�#4��H�tK.������d�J���5��Y�&^�� �pY�׋լ��>�z&#�J�u]���.���Mƨ���.Z�v��{�9Ji��3�Ai�7B��	w�����8���/�-V��x�tŬ(9��`�^�=���V����~�{Z�i�9r���m�x���!\<l��)����ǛM��x).��m��>#��u���\��iﾃ���7�{�ʫ%^)s��`�C������&7�rB2/��%akT�~�C}�i���fi�e�U�@)n� ��Z��v���2���f�Ai�Z;�7�T3�d�������5��6��G��CF���[�.J���~�'��: aX��g�\�%�8u�������j�O^�����4f���{{���I_��A�]���,�e�?"@��7�7wt����;���_�P��U��>���}Aς ����v�����b
{�:�#w![*�()��4�Rl��8p/��J³�l�5���u�p<�G�k .9'[Z��di�q����xr��`����v�����2*z#�c����E� ��4���`��i�}FC�y��Ү={�,�J���>?CZ�Y䨙�M��d��jx�0�G��{�ߜ�a���
����\����<�9+OY��U�c�����r��H]�5��T;�o�-Ȳ���,�o��k<a��Cr϶�*�*Q�e�48`iz��J�����4���wݠ�~髥b��Z�Z5y��!��a�8�zm��^cR��\�����3���A:��s1��O�:�GO��%<����:V�]
�#��a0]t��7]t
@_�~�fm�G��6�����~��ao�_ؕ)���O�d�*��R`��~(A�+��Ż|�.���G�9cN��I�N�Vx�4В�Ӧu�5֤q7x5c���Jl�56F�+�/���s�H��8my4���\�~��hR�3N;]({|z�Z|mV��z�Xe�ҩi�jE7Գ�	m8�l���h�.���e�sf��=��v1�0��w�V��P�����B�*5���a�	Ej��m* O��!���?_s��Z�g �t���>�K����Uqc�Y,[Bz�Z���s�@�Q-��C�P�������s{�}�u!�O�_���y)� H�-�N~*��Z���O�I7?%�o����}�I7^N���C�jG��W��6�@���s4��k��I�y!�6��T}��h	2h���w��d�6]4�B�p)KRy����-(�T�Y��0co5�)p�++5	�麭T�s%AM���H��]�ܽA>+s�3m��0q)>:��֍�	�g��4�ŷ���F�'�;��E8}�ma����Ԣu��SA��mM��
��b_D�4km6��4�$�'9~휝J ���+η0:�<��z�h�3i�!���;�9���¸��رU�U�29,�6�V�˨�����%|�c�����5Ηd���,����f9�!J��c�5q�{өW:.lx�ק>�W��,�I��M/W�v9A*Ki�I�3
�iڵ���H��Ҿ��6�r�����uv���
�]�MsoJ�b��CIPJө��|6"��?��犳���4:`L�s�蟴�|��G!!أ���9��Z�?��S��- ��-(��l��K)�cm����#ʲ�z����>�`4�M���ƹ]����n�ݬ��;o�bĪlH��W��(�R4F=ޛ�{�K���J&.�Z ?�w��/�b��{�~�"���Ы�9"�M[Z����1�c�@����`>�p��C�U`��j��UA�𴁞�����v��7�������5Iq̕�UC�@A�-�ـ��F�/�`�NζA�O,�a����	�	�Q�V�a�f���W�)\=hRSW?��	vm��������f$�ҙ*,|t� %\6쯈���]p�,��1�H��%���R/��p��LW��h��?y�:E7&����9<UA�-��a7��nAg?k�U�!|hWI�[���z���,��R9Ǖ�!x�e��n�6�w�� �ʑDU�$q��jm�j�tA�g�K��@׸�����ML��-6!N��a��c���ț^����ze� �	V���k����ɵQ�ע玑zf:�|d T��#|f�*8Z�`�q�KմjiN�֙��-�x��D �fl���.=k�	u:�b�/����7S��Vu��2�O�j�uь�3�+���U2>|��N�{��T$\�����������,*��k�q��>�C"Ȥ��g��������ϵ�c���M���g�6Mb�/ՠ;|0&L�+�\��t�5܅�2�L�!�*C�bZ��8���o��}��mr�[�2��M���x�����u��8	�l9eZW3�<P�����w1ثt1�$�~��ĭ��>L=5�ꌵr�[F*^|۬5S���?��HPD����ހ��h�=��p� �O/�B��    �h��!!�Ο�a�J��ش���)�l����px���G�3Fhg�k��q�%/W�;�Ӣ�D�©�/�~�����dG�8�īo�5�nD�f��q,�۩�"��3a#�Zs��N�(����WI�T�K=]��:����^�S��t2�
 N����w��W0��� 87� Rd��L�c���=
��A2�?p��t��񷤎aQ��(�9�k�)�vM��=cH2R>����8Fun�H�qlb(�fR/�vz�l�p�f�h��:Y��n���M [T�*�J�� w^���?`�*��m�������3�=���Ϡ"��Cj���X��&�2+\���A:$%�Q�+#F�+���#��/q8��O��$���D��x.D�݆��h̾z<�o�rPi����x.��j�����q�y�p,GCT���qY��������vi4���շER�`k��;������y��Z�e3�m��|-�*R����tHC�Ƨl�4W~���a�w8a���$)��M�тS��?4.5�ʺ :�rtl�W��E��R��1��r@I�7��Ō���W�n�.��>ċ�"��إ�8fu��G�{ i �v������&�y��K��o=t�����S���l���P� N�a�f��׋~N���B��=��"KA��|�Z��j��(��J~Lz �����x��`*��|����n ���j�m�5��V+�#��b06���zh���,C����<�S��[/�~��g�b�l�ggy��^���֩�&�������r��d]�|�,U�e[��N��5�^�}^����T����� r�uq�����'�P��e�'�q���6��Tb�[�m���d�U����W�WM�����)��0�b{r�5�w�w��ٻJ�\�\���>܃[��56<�e��������X
�A4�BE��e�y{�㇂Qcy�T���O��V��?��{)yV-�X�s�_��X�r��6�>nK�o˶�
e��@�(Z��f|>���$I>A'	��I��@8�q�CiE�#nb�6��e"�b��Vڽ�-���K�Ӆ�d�G��q��i���Wލ;t��5�;t���?�E�ַ���Y�H�*����# 1j=6ꢔ�~�5�휛=�Q߸x2p����j�Z�5��c�Ë,�L�O�Q7%rP��Vi�Ev)4�J�Λ���1y��ȥo޸7QE��;���z���W�l�K:ȕ���ʷ[n�=����Kk�2d��mt�����{�dͲ����M��1R�����D	��!M��]��[$��zW��o�|V�?y��Yv��x8���`�o�rE����?4��85B��m1���d.����TSѫ�jr�D�f�
.,��n�s���-\��Gڙ�k�-�ȼ��1)�©�����g<)s��0�
{E߃A�c�­���CT�GMo0�K���B�Yi ��]�1\$��J�Ԃ�����&NBp*�Q�iU�&+�몠Ҷ
(��X��ŝ��Y1��|��4Fox���Ig���YcE2�h���I�x�~Ym6���9��c����CP�i��b���ݧ��{�>>`��+��_<u-`g����~��t	bv���{	jmk�[��u��q�Wm6�	����Ȩz�e�!^0/������]�=�_�M8_�J�k�n9U� ����ض^c���o��yM�{b9X򥑓��t}UV5��z�A��{8-Q�W5�:U&c�E�l{��QA󼿯�� `�b��Q�
ܒ4�@�MzD��o��]>����gI�.���T5��U~*ȷm�x�S�uQ�x�5����a� �Y}K�n����VDMx {�Ѿ *\��_:1f&q�TY%��c8/n5�uؐ�T���D�[���x-X�QU؞�ޗ>g�Y�"R~�w�5y���n�l�Q�P��`fׁ%�[sA-]3��'�Lpnۮ��,G,]d�j��Y7��Y��f��>i����4x[�!�XJ�����+�>R���V5_;��`ܶS������f��xo�6��#ۜ<`�iᮥ1\K�7�3^�N���n �Oq����M���-�
��b��T��;J�$o���|t�����ݨ�JV\9tDh�aA���_L�l#��v�B>�*���J��lۀNՃ$3�թ`�Z�Ȫ��Kg�Q0j�/��3|��z���ӿ�D?c�=�2b!]3L�j���W����pV8`��;��`��9��v X��Ŧ"|�o�t:��O�3��"�'��R&!��kjž���v�Z��T��jG7J�q�n�b�}�#���DR5���X���:d����I�����b]U˜ 4�+@�CGPjG?���`��(2�1'ǯ���*�a�	�R�j��S3��f��S&c=��A$35թ ؎q Q�6/��=6�as��jͷ3�j��m=[$�$\��뿦�RQ��t����w@��v̼ڎ�f��*iב"�:��,[�a�̈��������.��͔��,3S�`��B�D;j��"�`�����Q�_;gy�A�_�.�v��d��'�B���'���\ٱ_�鸸7�T5Ƥ�|s�=�^7���:g6���{�%�E�à����4p��p�5������2J�w�b�nێZa]�{�	��8��x�p�z<��H^�>�Bp�RQ��~���[��n������n�����n�\�S�d�����gSQj>R!,آ�`I������CԵfw��_���{�YĳU�/(�'W-�V��ɑ�a0T �K�C�L�ٛ«��ɇ�Eu�	1; ��O��M	|,�&���Wg�z����w\�p�U��5-5��)`��zR�bR�u�����K^�N�-�A@z���c�M��|�l�d����/�ER���Z�p[D���9.��?M�N�L��%�Ӱ����}��?8>fgJ����òt1��W��M���o��j��������C��1��<Y��Ct�6�^1�����8�O_�OV",��r�OIu�q�+����+Q�K�^�"��Բ�ڄ7���~���7��<? �>�����9���P;�����։���~�=)}�ͣ��h������m\�*��v��"��N�&V	;lĭ���4$�(�W����;�.<?�+��y�x�*�^�yj�c��&@��z0(��m����>b�v�j9��K]��O�+b�@L϶���=8�����yZ���,�X��F y�jэ&��t=W!����e��g\�G+�nR�K����g\r���,U�g�ؘ�������u:= N4�r�"/kudB��}����6����t���;���jl	t֥rJ��[T@g׸i!�8#�Q3`_�$���7w�K1k��X�=&1�ln��p<ﯗ��K\P?�@�kX� ��>l�@̩]�=�}+O���bS�t���!�%�������In�����F2�Lq=�a$�����Y�V��(n�n(��D�7�R9��H~�>�th��f��8��<KX�]Gн.'�����CFd+��&���HU�R�Z�mfU䌷���[�q��Z���޻e�ݠ�+�8�aր�^5;f�<�G��"ͮ�J�Kw��JV��س?�"�O�_�R���������SйT���N���LZ�[į�Q��6�a;�I�������7�������������,���M�R�e\�Ҫ��r�y��'al�L�8���1�a	+����5,@��d�Z��v��x'�n~"���y�]�M�Q�W+��:z�D%v�4����4�T�9	��qp(��l��K��庿��V�	6�gR��u(�k"���+��h9���d�۠��1mۡ�?k\6v
@G ����)�+�#���@>V�@<i&ttM��#�^:�QxY�f�ew��,�L�R5�*b�1b�<�B�o�jr�<!]%��׼	�=_�aa*M_	�(n\R�w�;.K�g��ܡ*�π�H�C��%(�M�ᆉ�kFR??��;�8�d~s䷎Al�`�y�����]y���Ŷ؆�͉�~)�Z�w
a�S;g*�GpT�K���j�$��    �q�k��C΃��9:���f��o%�u�B�>�v�*�#f���ѷy=De���LS��R���t�ojL�Z�u��zn@���u�A�wI���+�I�Iz�=3|8_�ܾĚVBY	��8�-�;U����D�l�i���m����qZp�������p�V�m�i?��h���
%�v�C�o�E����������Z�MM|���7n�<j��;IG���kv�s`^���O-�W!\�o� ���y�9�;�eH05��<�Nr�	���씞d�s��x�}q/(<)x�T+j��~5Iv߄�S� gYh�����$U&Cc�׺��j����q~�05�'��6�"�K0�w�eW; �34[3�?�V�5���`����x~CSǟ<X�{'��qC�� b�.
���m��-q��K����r���3f����`� �Ϯ]� ^�7�3�G�]"��$GD����D��ߐ�/�/C�ʜ	�^5�x��~IO֗LA�)� G�H�O�򛑨�n�u`9� "W�N3q�"���m�����d��,�'�e��)�	����A)��йyd�C�w�.���,�}��mqF�>i�hkwjt�)�Dkϱ��+�i���V.�k��~�+D�hN�Z��ruh�B��l��f4 6�V"��̢�n;��ZB���7���H�'kH��4�u�6���q����1���~l!h�g[���y�����uՁ��A �_=��ף���'ϔ*��	��m��$�cծ�����]\�dU"`��poF��A%<�`R/�R=�a!dZ���M�k���w�o�$>B�m�t7��1�6��ӹ����O�䛢�ᴦ�Q�j.E�J
_�TO�4CX��V�m�]��Pa��;��ۗjס#o �_��S��t���2�����%s�Acl�� Y�4G�ǠbC�t'��p�{
����>9��h�����KǁN�f�o���|�[�H)���ھ2���Ԗ<��8o@B��=J�3^�^R��y;����攫�c�~.�a���.!����5�$��E�	��:m�6^�&�S�.��Χ�{_ǣk�u{4����ByGU/
'���S�Z��ӿ�ɫЁ�ҫ�7:���-�QH�XwY������{7ݧTn��^������7Y��=��� �b$��@|��U��i������f���ӕ��Ѿe�ޒ�!�/M�{GU�v�|z�-y������(�]f.���������(̿~��F��IxHT�0*7p�@�IΦ#�2�_ح7��l�;jx���SDLr�:M�<�n]Pe^�,�L�)�<��%f��14\iU0�-`��v�#�吏fu�`���.�u����sa�9�x��z=�-�v���>�H�k-�Y��*�C����C������	�Y*z�u�w��-]oy�G%{��-s�V� <�g��RfT��?�K�d5��rՀe�, �S�!����M]�s0g�E��t;�4��%�x1�Q[�U��	�N��YL��;�k5����g�V�Ӭ�k���R!k���ǫ#W'�ۄK\�ڥ�oT�����f^*���4j�w}oi��Hf��t�DT^�IKU�W�'Q��=����T0��� �O���Tn�ݒ=T�u<��*\&cǌ����ҁ�'Q���"��:�-WO�S���U��PKVPt�@���V�:��w�Um��7��un�h�'���G<u礛�[�=ƙ��2*Չ�d�4����8J��̦�'^[��ki����>u�sX��)���Q�C�"��|�����_\���r��5�QT9�DT0dK��cor�;�@b;ʁXHm}�д����!ؕ�i޹���|wۗ���n��ÝE�4��۰�����o�c J���-}���gO�N�%���.�HiG/��7q�����*%aW���U5 �5ݸ�OK�y�)���戨 �2�����e��

��m�أ=�B�/��2��ql玪��f��t7,A�u��&J#�q�f��u{�����P]{prӭ-�����}�f5��R�n4���j�8C����\Zׅ�隡����l��|`�KS˥��N�q�=Z>O�R��ۦbTա��N���-��uԡpQq O�5�>y�.�z� �KQ�'�+B��,^�
��͈\�ܘ��Y���Wˬ�p�&�ɫ���JƝl�����^n[�]׽����G~�h�鴧��N�0��C��a����7�I1|��7������Ӳ5˩,L9���g�Ϯ~�T�}m�� ��r��V�'�)|� �"*z{���=9u����8�.~�>�RɈEu�r��Q_;��B��۵���c�#M�3c�g���{w�37{��6��*��q4��vS����&���G�d���RPC`����>��<\K9
����v~W
dՐ�}>ԉw��xy����V�tÅ(!�z��>��q��)K��B{� �'���#*��k��n7!�u�+/p�7	�;�%�h'zpĘUX������"Lʘ�q�~�1�>o��q����"3�Z����I�VՄg�
��Ѧ9�ݬ�O���"��a��F.���/�oI��?��5�bKnR�*��汃DV�`�d�Mì�y�x�@���\�n��KA�U�g�)g(jXԫ:�c��$�Q��T������*Ī��x)y��N~ͼJ�/��%�/d�㍮bgh�;u� ���*D�]T �Vq�Ǩ%�5���#B��M���������̺������ۛ��h��{S�d��{S5*%�꽩�!rD��{S5���7�M=�O�9:f�U�=���ߪ����?�ܪKM��y�w��<
���W]j�����K�F�nh��Z��ުKM��q�w��<��b)�{�.5-�j�/XuyC@�Xu�iR���{��yM�!-��R��nz�W��<��%��
���4)��7��<��-��]u�i�����.��"���(��R���J����<������W]j�Y��v��yU���ΪKM?���_���<DT@d^u��gY��q��Y���t��&�S���j�r�uHޕZ�z�ԥ�~;��;���}r+\D�8�O�Ӓ�
�r4Zu ��țzzF���Mˬ5��Û�މ���_o�C\o������i��R��*�~w%چ؊Z��-h��ț!օ���mv;FG�����4�����i�pǂ�%Sѵb��G՗��1���rq�R�M+v�b�_j��RJ˩����JZؠ�����,1��U�M���99�5l�`�j1z�K����K���My� ��P��ǰ��.�xܴ����񷒛�u�9�
�&37$�~�72��]sbQ|�r/����-�R��6����S �4�1�Nr�V�K��uZ��?��Z��	��8��!ȀlS�:}���Y��F���=v쾎<d���a�D�F}W.�;e���.�G��/��K��1xd�?~{MY�2I[{�r�l�t�|�}�;�P�������p��՟�dR�_��pYՊ�S��t�X\n�:�U����x�a��O�0�h�+8�K�ߎ��G��Un������YX�1�Pa�7���.�ݲ�?�uZ�k�U禍9<$�Iq��"��z���U=v��6�^�c��;C����R*�0mH���-���WC�>�b%Oﯰ���`t��{Ԙ��>\Q8[�NO8�7��W�Оp-�E���ʔ�P�%=��5�6oӶkv����(��-F1b�$p��j1�O9T��n��q��$VJ�ZnW���{�s���}b�i;|7X�a{���ݽ{\t���~3�5�=�ij�*��������I�ū{��d��KY�:�Bͪ��S`��̆��҈Sc������q�!�ԫ����7��Ӌ��.f�=��ڦ�PG3�����"�^S�+-R�Aܿ��� _':�*��Չ�Ԑl�f�I�:lE�mKȰ���u��Yv������|X�H=7��9^h��s]t�<��t���0���疤݆;̜-�����wK.����/e8���`C_�TY%��c8�J�/6-�Ϋ    �y�["�R����],��=n�0�|�_��H�i"cG~�w�5��m?y�N��[�&q=N�<Z�f:f�ʶ3�j�l9b=�>{�2O��v����Cc~]�*�i���Fd��^i7ӱ���4]*d�*��zx����ܽW���h����-T�,���P]5��k�P�f�`_<�ؘ��t�e��G����D\9�4�NW�|"'���'ӕ��f����h����G�TpRm@���!�p�;w�6`�g����F]�>O@%'�IW��;�9y�ד�g�g	z�fj�je���Nr��:ܣe��9�ȏr�PC�Q��"���B��5U�Z�5:�F�'���/�xR�	��lkp�0�N~+b$�i���3p��%!�~�=��I�B�O��P�[
�`�t�-wQ4��C�l�A4@51il'�m��i��j�/D�lH�������t�2|���GFg�99~m�����pɗ�,��qVi�1�5�9�5�^��6k�6�2�X�*���Q	�M��,H5�W�^nA�&ٍ�����Ŷ�/�:di�����Tv ��U����A�}?ހ}1F �:���$1�ᖣgb�t�7o���oz�윀	�;e�����	���$�����r�*�����B(/�����W�����l�p�MֻxR*$���qAGpezP!�8L�i��1&m\p���A�y�ڥ!���n�v�=ܒ�O�%=9��'g#|8	�~��b.?G�(y��A�m;��ƿ��}�[1���~(r���<�c��+4���Q.y�;w�_�&�?�=~�������l厗��ͫ��`	�L������'O��vW�ߏ��5�;~��ߕ3���؊�}��1]�)��<d�䞽�['������lB��:Nb�f���\���V��:^���%�D ��1M'�9��lU���i;�`����������e<&5]�<J�xI�PdW�-�A@zI�+�ͣ�e��q��]
c��t)�!XD��@�WIT���h
u*�dr�ǆo�*���y��M����<�T4�ъ$d ���e�,���.ᆠ��Wו���O�&����1�6�aP�����s�xX-��<$��.�AU���WMT���5�= �" ��Z�E�&��mvb���ұi�Z�p�%�p�ޫ.�L_z�K���<?����x]�-�#+�#�����c>c���l�5�i�"�f��q3��cc@�cI'ےLh38�6�X�w��U}�>s%�$q}�����!Fb؃�������ƙ14����o��&��m�MA�r��gk���z8�_ �2��?՜���	�x��C_��`����אϤ�H���Xf��6��B��=8�GQ�{���"n��������^n�?����P�ģ��4>[�?q���0�e�@�dov�ɺc�4�Zj�)��2Bj��k��c:ÿ�{�d8��5���3�>��BR:!I�r�uE��|6����X�=��xnp!d� T~��87kF:���MȘ���%!�TSC'ȏ���� ���c��n��Qh��k�<����N�y�2��_��xD�X�a��y"/�����*]l7�2� q��N���)��h���q p��$��&�ذ�W/n�!�N�fW���ځ�����iR���ٽ�շ�{G�SH����	F��p�ڔV;#�Q������p�܆ �CMܭ~��7������Qi�G8ۮ����/L�6TW�q�M�]o�z7�&eȍcZ�Y��D�" 2k�ms�I�t
qf������	
ly���_�h������!-!|�O1�?�R�3{�1��v¸s�q�Ӏz�0�p���_����f������ڌxyu�z���:\/J����9V�4!�+�#�%�cj�VeY������ �h8�6[2,igB�&����C�᯷8�Y��愻�:�'���!}�/ɶ��ɂ4���U��/��/U����e������y���l���h�J-�p�
5���"$���I�/��<�;>$N�y~+ȵ��Lw�N��v�qެ�D�"�ʕ����	.��pS�CXP���G��;����\��<�u!<#�9�No9�t|��R|��|h�<b&���b���?��2�/0�(!�G�����ʡIG���57i�m�N�cCo0<�ϒt�i���W�x�=d.Z�ux�;�n�JYD�ߊ[�f�'�+��^q�	tL>
 A��t?[R>�pֹ=��l�a.���\1J�����g()1T۬ʄ��؂	�%�o��	"����`�|հ�"������4��"��X_�쿂�:��"8Rs�x�w�I�	%5$�

��T=�U�x��V��^�;h���E�OV�J�ż���JM��6*Ar8�z	2#��c(���T7T�r�kHˮ�<"�*�<�-���Y�uA�J��{m.�ֱ1�ҰZŴu�V}����1<j��������w�C�]ϡN��z$��:#��\��X/��:Q��<��~Ggl�:�IG�g�U��j�SE(��(Ӓ[|�,��{{�+}��� B��6�<ܡ�Z��C4O�:}���������d8�)�S�E�GB�G��7���OD�
I���C�β��O�>�n�8�a�Z_�v�7��;g�	(��9X�L�Ԗ���'GȪog�sQ������-×-�5ePUC7����l�jT�Z����NK��֟�����Eѩ�X�[p{pX�V�����,��ǀb�w����r��*���\�۞���k/�g\"��m�7�'��9�$�� � T;8�B�����A�����|�K�I��c[��~�9�V�R��,�m�ܩ���v���>/l�ez��R^���IN�����z�I���Z��I��CI�!jU�(U��X��g$��ґ�������H^�i�������9ܾ
y|O��=���D�a���7)�=�z�Y����	���9���P��au��Lro9T i@�]���rN �m�>��8���k�<�׈���T�c��{��b
�	�7��Ƹr�=��T����@��Ϋ�lp�������y�_:`��v����`��+ZN�Y������ɡ�bя;�"�1t&Bv4d����$L;���p�)Z:�7w��	�L�ps�i��_�-��p:������������H�p5`�		�� Y8f�A�0���a��U�k�&�T��2碉�E�׬���W�[��l�R��#S�8 Edҽ��x4]��n�n�����+�����2�U���:��1���Z:h�%���?�s���9��;c�_PA)k��WA�.�"�
f�|.�DZ#Ur|=�~E�R�Z&��N�\[��Z�	�=to��q�r���3j��CAe D���4r拸zu�}��L[D�z�%��KVS��Q*�F�Ta�'U6�a9"k1Q*�j;~�G9H�yK:,x���&DUꬮ�+A����CL+ ���5�ԫm�5�*$�vu	�J[يi�|��D3�Q�����:rP�5��l � Uю���� Ԓ���G�(�X��z4��iT.�b�r�M��H]L��D�5�j����mS9;�*
~Z��,���ƻe��O�1~A/�g���j�=Y�X�OI</M�Mˠ��T���v-]�n87��|��T��nx��>6p�!��̿xk�|��R�F1��q4I���l��=mE�-�S�4��d���{C���2��2���Sݻu��d]���~���yI��<m,|#�M�=�1�`�i�N>���ZU*�2�P�����;!t3U���yy����%�>�S�Pr��ڏ�be��0��Tj���u�m����B�?��<����9>eW�i���"��W�+�i��$��%����,
P-�pl�a�4EӘ��rB�a��Ż>��cܴ(����Y�ԇcEN��-5�F�W�$\/⥷�:G�0!���>�3Y��T5]��K�H������Z� ��9�6/�g�lU�-�ۊ��'9�2�p�XY�    ���>m��F���cJ4ߛ)����F
Z�vlZ,Gt��QJ(�����y�4�(�ݔr4]�iN̊[�E�aIb�r$)F}����K�v�e�M�*?U�q:d�z�Ƃ�����ǘ�9P���y��_��&��6��L3MK���߯�|���W�l�$����s-�l:�^�)K3���F
�w!�^D�����!��¯�?e:����Up]�q�1�$?<)#��;�\��J�}L,�Ī�!�J�ʨ�h�a»�y0����!�))>����X%�g�����sRa�*�+ℯ��W�.�f�%����`Y=γL���W?�{���a��v>�Zk,�t�V�L'0h.Ӄ�Z�HT�B8�n��f��U9c����|> ��w2 ��c[��i�Sc)#�A���7��mM�2��V�<DsC���d��%�O���1�n�6�&�$����q�jJyDcf��G�m���T9ϔ�J�5���9�K���`���|��~ytj�A�15�e����q)��7��:��D@���d:�q�8��]8���Y����XZ�p=b����8{|D�!��� �`~�,r��t� �*���'@zR,�
��U:���D��3�)%Dj�)��Rb��S�P0F9,�LN}�,�q5@�Q�*�(�\��ք��3X*�O�����7�����r�O���6dPK��R�2M�h\���$WT�h�lq��fUfG�`؁L`4g�v\iX3�B+��WҺ�~�	~�|p����:�5�H��dy��ԯ���G�so��Z��xI����u.�|�0^Ŭ��I�=<T���8����<Y����x�vC�M�x���,��B|�z8��	��C�� �r��o����`�L���)�����Rq���A^5����Կ��,i�����_�&�b�#K�9��<����{`�\ɵZp�1�$�7��L8:/pf�_j1Yd>hB=eր�',��2��?o�\�)֎�KOk�)�L:K{\`���D��C���e�=�h|�����.:~PS��7g:�ʱ�X��x�rŦ���T�����s��G�	���^� C�@��)W��@��UU�^������=���*Έ����k{n�=�
hY�㺭˞O��!}3�����8���I���O
�C�;XWw���*]�	�t�}'�q4L�3���1H�����T)�� �3|Nn��\�/KgS��3C����Bh�U1��	�FY[h,YI��=SS5�i�G�)Kp<��@�7�	F������t^���9@�a�Ru�kT�<&����ʓ1M �XO�"p�����	X��Ǻ�
�i�IUS�E�e���O���������I�b���a�a��g{K���J�����X�"^'�׎�>�R;'�4u�i0���O'����X�'ebjG�9\���\p,Y%���
R��O#&�B�|�P���C��,C�-õ�z����R�#"��OT�����X/�*�wG��.$��fX�?���C_~�zI2n���H�ͅ���n�T �R���#���3{Q� Z`'�B�^��~����HO#!T�sx�O��A.��Qu�����B,��cx�����=8Y��Y�bx����(��г�?<��q鉽9u��)v���,n��$�TQ�EkZ�i�T�#�A�H*k��z%�.R�e-]��#��X#�Э��C4 F��zΗ�����Eb���e��=x˥�@�cX�C�p�`��s[��s�5�.���,���|L'^y�d�<��&�Y^C&��m���Yoo�(oo��Z�'Jy���v��vil˨�h��d4m�U M�( �� �ƞ��,�4�I(�̃+�T�G45:ud�)M�բ�֪������L��~��(��R�r�0��Tb|-����.�`� ����W��O��V�n��W�|9�6M���)-�|��R�i����V��mF�O��fx�`�^Rh�G,��ò��>��dV��;|�g����^c��c�|إ����/��3P���pt�Xf�4�N1Ձ��a)�>zYz����㩟�Zt�A�5�2����״�)R�s��DK����� \(��kdچ���H�z���(虻:S�'΢�W3x�f��)T�$���F����=[�ŗ��q@®WS]�u�P᳀��V�	y�xZ��
��I�P
k�'���]fI{�휕r��jx��c��r��2��x6m�15U��MWHg�fO��=_��<��Y�]n��_��i)	��Ny�,Z|������e���;������2l��"�EE`ۛ�Ã�ō��6����Q�ƀu��E����xN��)�c����$FpމhIy���S�5_�14��b�*�T�9��ZM�u+��.-x*8}�j�m
�V�A!�����x���㡃�v9A��o4�X�*�ٔH��~2BZh�]���xT� ?��oeX4���Ƃ|�Ӓ������M����lGմ���Ȕ����J��:��덄
�8��X�P4E�Z��� MmA�	�e���pHk󗸣:���l�!3+ŏ��d6(�Ι~,��g������x�:���-�zE��ϭ.���j��5�OyI��hZ+*�����?Ⱦ�i�nVj���2�A�	�^�Z�E�����F��1����J�1�!���	�\]"����d�{�{v�li�����P��h:��djN~���U�:c��������{BZ�_��,��lK�tG���9d�M�;Ĩ�4H�R<I��@�ω �����F����	�',�|i�	W���n��L���N~,A����Q��$pk/N�uajD�qTڋ�y�?l�g6��;�}�"�G�����.��2�}Y��i��TI�Z����Ll�w�ʴ7#+B��;��>�Q��&�E�!s�����a����>�@�ڙ�1Â���r�&r��nښ�6~�D�Y��r#�n݄���1����0��p�_*X�\~�R�gλ�N�ZGoW�Q_�t06I�L�@��ɏ9��hN��tg�6��H��&�����fZ�4��@�%@��"�` ����c �ˇ'>s �Qm�h:#\�&K}4�|�Xbi�X� D��0m[��I��3��bʋ�v�LS_@6 pzU��\��r.��p󪝥�����fb����Sʒ ]ma#m4�yק"yd�-:I/-q;�����p�3Wj ����$�Y��e
�h���5߃�eC���d�w)k��f[��H?௠���2�I{�d&Ὺ��Jv{�:Q+��Ԣ ���"���k��HG��i�y]��f�O�)��͈(~4��'�Vl�4�kJ��Ozo? m�_�<�����Hi��U��"�h��(�,8V�8��Л�v̢٥B��n�V��B��,��z! ɳ���{�RŖc6�b\Y����g'{�������0��Ii��L���y�k��v��3�}-���G��e��%x�6h9_Ukb���d����l��T���e)�n�Ⱥ9��@u�,d	�J�W;��s��E���{Y-��5���~��N�5�����Bb0m�:�6�~D����� f��z���#����F�Z����ez�k�~B�$�������˔t��������,:?Y181�`S��*��3�q�!
.�����2r��/qҮ�3��U?ܧd�Rr� �%��V��P������!0�C�+�0®$g<mWi�7(Ն������i���jZ¡�e��Gf����Y��G�Y;<��A������nQ��U~����Kȫ�j�M���T�ʹ5�i.)�(�Y.�{�!���<rJ������4��քM�}�%.�@��𘮥���jSe�
@��5���� �^���O����m�]�x;.�*�ޡq�bLqZ��/���8�ӟR�3�T�i%S'K �%F~���+)�b���;g��
�Ŷ@�9�$Mo!�jO؎�6�J� �分~��Ϩ[�t���9�r�O,~�)�+R� \K�L^f�$S�]۬���և��)ͥ� U��U�4�,dY�h-"    E��!����]�#*}�k�DK\��z��K�*�e��M��W��@1,�3�bn�@�q�#�A��5���Q^���fXQ����5g1 �}|���4�)C�g�^������9â�n8Sň�?=U��JK��58$�t��_�|��]�ʮPb�G��@4��ƭ!�����=��Q��O�ԇ�U8)�����uiէ؋z�9&���I���l�\*M��U��~c�,�3����A!����(�s�'�m�pT�� �o9���*0��w�l�0��߶�h[�Y��$�p�������1� @�?�Z������c���t��Q���h߆�Z����"�B�-�
��i�)m�Ԫڸ��xj@�Kc��Ft;������3��	v���S���t����U��r^n�e{��X�@K?L�Ìc2î�/���б1��UX�c
2�;G8��S�ʌ�J�,q��)���'mWх��_Q[�]��ʁm��}�f�	5��c�Z���t�!�N�r�8tp�	�T�~�t�������Z��O�[���'�m��H)&��w?Ġ����[�c�',B�8{���#>
	G�
�Ҳ;�u̳�}ɟ<]��V�����=�i�/���h���(]7ዙ:*���k����O��\�	\��x�'Dd���(4��~�K�_+�jg�Эu ܮ�l���бT�@� �L�*&��pb���t>������'D�!�-��⏈��*�bR=��8[Bz������G�b�e��hS�*D�elմ[Dr{��	A�J/��3é�xə��l�C���S /Ķ��'�a�e�*3�f���v�*�P=�e��Rq'���A�U`pM.�xh<ұ�V��θ��RO���BcC�X
c���=[��=���[�o�	
=��3��CҺ�����F��,�	��.��A'q����̦��
�_�H��)}�W�2��`\��Nny��`Z�����h���+�R��4�;�����C��6���㵌Ȉ��� �"�$�S��D9R���p4Ì�ç������4�\��;6?^�[����d��!%�#�Fc��f6��}f�IZZ+@�}Dr��L�썁��UV����L���<:^m#�<����?�w���NLτĳ�_�#��޺ǨnJ��s�8�X�=>as�BJE�x��r�5���U���룧Q�[G$�E-� �9R^����ݐ[B�QL�h]�!�J�!�C@��K+b���O�l��������
P�>��I�=�����p�u�#m�+�a��2[�b3}��������r݊��S?���;ԶF� �a��װ�[��[�8�		�B]�zG�Y�aQY/�` r���bx���wj>���>no�t)g�۞kMu3�y�M[658�6b�R���������_Oټt�Of#_���H�@<V�`4 ,cm��h���X��l�.ޯbS��O���2�ƔZ��Ԗ��d��(�gFg�9�;�_A
�����s�&d��	���}�ߙ����Iǣ��� F�-��B���S�ʚ�4Y��P��P
2��Ǜ�i��j)�=���N�V��X�U��.�e{E�
Ү����D��C��|T,�&��[�xvP�^2�Y�+]f�R�,ˆ��!�Ȓ��]_�7�^�{~ԙc���H�Eߐ0�Ļ�tI�����MݶZ���u��>��	�N��k�%��s�%xp }b�"�%�����k��~�l�yb�����I�Ãun�i�ҏC�Ի���S�~>���Mӄ�Ք��b$R�&��MwH<��
pZ�'��H~# @�j	�����i۾��y+����f?��0Nh� ��0D*�,|��!���� �N�>F
��Rl�*6E�Z��Z�:�����}�r%[����v�jV���M�.I�v��ObR7� �rx��l�(���=�J� ��u�t��6��K¹��X�$���$�y"�᫆�{��숧2"	$��� y�@=9f��@���j�E���7�u�3"����2�i6�4��)��xx-�3�3t�/|�w$&�%@U8=��]��?	 P�ZJD���x� �f�Pu�m[u�f��7MT����-�-�{ 1oۀd��qyV8�����n�y\�|5�	Y���f��mw4���W=��Z�W�c1x�U��E�;?�.�;��忀V̎�������i:��g�#d �׳ĂG;^����M��hD$+�>z+�A;�f�cwo���d	�6h���"6f�e���v�K3��U�<x��yG�a�� �#�AnN��rU�����4��*6�[1*dp߮���C�E2	��~r���(��D��G�a	D&q��Gk8�Q�-����#���L�#1d��H���~Ǭ���&^��ؾ�S`X���^������O�׍Ԧ��Q���J�<���Xy�w�H����	?�ਕ�G�cD�YC��]��L��)��
Z����Y��=�����t���æ6�G���X����U ��WF�|����,
'S���9̄̈���QM5$�
�F�W��C��e��ê}@#�v|_O	�4\�nT@��Ic09�+��Q���Mf�1
y�(:�p^�51R��3����ȒJ0�Q��>v{I/A�p�l&�Z���Pr��6!5ـ�.�G�\�c��r�h���5���x�O����٭՘#��a\��Z}Lۈ'�(���c8�r��3<��R:�I�1��y$ �L�������S7��o�D)��1������	���B<�#ސ��*�6j"��\��9��?���}{�d�i�
��,���1o �C?,|&�D�=����<��*;��`ɉ��C��z�W�0���ۇd���r�?��6k�Wƨ�[�PR�������rĶ�à"���e;�GI�����w�,6���2���@C��r+�b��5ʵ�*�����[vt��Д� @���c�g^�y�M����9S��+���ާ�ĸ��e�.VO��C~�nx1zG��9�O*J�f?�ϙ�4�qj����q�L~�����p��s�z�e�J�3w��uDJ'���i�����"T��f�,%��R�X�BBo(����f��d&,�e��/aqNg�ܵ�Z�b3������h7���A�t��@��8����!6A���}�;³K�?�+��k��ڬ#W�	��ӊ�x�P#{���.d�,�S������;n��,]��,О���A�y8����ƿ]�a$�_�ф��'���1cR�����$D.����:�\�*����X��4Q-���2J1.�z�^kB�j0��`PJɻ�9�>�E~���%��SY=�+�D�6N�.ӿR��mxz3�J��b�)�0��]�v�u!�~5��k*��S}u�%��U]�K��h��lg�Ƴ=�E	Q���e2뢩
�*)63��'g� �T��s2�U;���1����E�s�ϋ>�Y{z��~��!b�\F'Z/F���s��w���?���J?�I�g,Z�����
��d�1NC�k6_�D*ɞΘ�g�h`�O�p|d�<NU�ݧ��T��,�讵���}�I�E�8�pܯƩ=�E�� ͈����O6��R��H��
�>��6�N�%����'i�&��,�IՔ4��)�OC�Qj�j�ߑQw�w}<HE�+GG'?��bK�F����ao�j�?V(q!��[��5ڃ�B�`$-'a8P�!F�aw�发����v�#��*٠��J�o�����n3M�Jt����Q)�������Nȣ!-�5�����Y'���Q��ͻ��J��sSJ��ġ��Rc֞�?:��R��C���=3�5�=aH6t��.2�Vg��w���!��d���r�{��_��Z��H(�3
򨩸mt��bEQ�ʟ�4������p�B��.���7����+B�3ɤ�ྐ�7�Ebp,����n�h��s�T��u�����{�d�m���M��O���h��4�Q�
:�9���������/_��E3k�?>���6ߦ2���m���L2��AcP/<L܉�0�o�    ���R��C�F-�f����Ӯ �d a�Շ���;L�a�I�d��w�_t��NU�)��$����i���;)��u�f����H�3<���������"�	�W|}(��#�Y�	�ɔ�LO�?8O�� >L$���LOQ3�
w$�P������da�����<^��3�c˕T�VÒ��5TBM�Ah3e\l�a�� �sXCHQ�o�.4���#_���n��������Y�h�_�:c�r��)���T\a0Y������oy��{��*�x���MKhb|t��ۂ�5�
Z�'�~�ǱD�Q$�X~4�!�b1��St^I���F���J��]��bB��Z���Y  �E��xD�Z
�p�����>��~q>�2�l��Y>�Y���? �������m���!��]ڎ��ᚥ}�q� �gA���t�h��@x	'ʂ��u��i�B��z6Q\2�����������9�k7��X6qn��H5���F�d:'�ẻ�9�p��hᄲw�$yp|��a
�{��ƃ�V9�a���$$� �ո � �L�����D/u�����rr�	W�K�m~'��9%�열­��e����4n��)/U��_�M�"�x1���)�dse\OCJ�(�����=���[�!�:��Z�>�j	�@W5ul<��kf�&��qZ�`
Ed��[Nc�����@o0�|��)N����lͯ��!�Y��?�;�%�0����r�A�
����9��:�����|�ש$�vM���+d1���Vhd~�MuT���3�^$�8|�~�*��F��X�����T��e�֧](��n�4����n	РFb#C~��4�@�Vj�~&I�?���O��X���2�lZ=ifz#����I�:�&��D�����%��*��{��n��hm��a��Y�d�'u�\Cw�ieVb�H�ͺQ0g�=Dr$���jC7����z��|ןr���m!��f,��0
��X��8
K���E����18��":Ǐm�w���_�A)KiՀ�ɟc7�A%�.�Xa�HFԒJ�W>�����+Ɗ��=���ܚ'f�����M�Ş'u��h�5K$��Y���d/�l���Wb�%�<�F�o�b���M��j�h��/��RJ6�@���!1L���V����R,Ξ��h> �Ư�h�p��z6_X�jG�D����	
���J�w����.���rL�m<"��f��˂�"�x�w�Y,����`0s��:}��� K��J���?3QX��.��	S4�!�L��_R�M��OI
ٗ�}�l�i\�Ĩ��7g�(I~9���}[8�I�R��[�%q��W�n���󥦩�T�VU���F%J�
��8�,z]lVw�+�(-B>��6�*"��#~	�A��SX�Nmmzd��nu�1kHp��l!^�G[�i��]�g���d��/C�pd�= 
��?ՠŶYE�;�z��RLa;��Q8���mc"3;AɀXVK?�{;~�P4e#������������6n��Ȕ�i��s�7X����0b��W�p��E	��P&��i��eR�5\ÆJ#����k����b���Q�'�2G�|��ǜڏc���:�:���U��f�z>dw�NJA��iE@� �,/14R�&��h�s�T�#8�w�;����f�����ZN'U�&�8�Ld�XE��TT�G�lQ&RtFp�:��Yy�qv{�K=o:P �a��"��@���(xo�(�J&��1�w�IM��� {SIjR{)-[�靌e;�#���f𰜄Xz-z/UixǢ�|�=����6H4R�Y��{��=�5�U�[]���H�՛�
dXb�r�Yo��VW����-L>(y<���d�?3���Ct������+C)Q����Զ����6�PgS!}3��aTx�M���筅��G�Jq��M0�����Z�ׯv��AF�7�Ȧ*6�p��a�	j��L� "~/fGz����;�R�&�!y�:��X���*��ԋ�.A,#���~���^�jP�ͦ�4� ���p��+��os�8�)	�oM{���|u�%�K���n,�!K�M�i�ƨ���j�g��M_��;�v��Q��هf�L���W��x����CeB���
���[쇅gg4!�;�c����@��q{�d�.�B+B���J@�2�:.8�����D�|.��L��p��F�����Ez��H�e���a���R�A,�͆�
��D�b��X��P��4��п ���ȯ6s�s����3��O��4} �W�i�d  	��F(��������"N��x:��#��� X��������)��ݫ8��,֤:(���lS.Ƌ�L�bM�d����~��ʍ��0
�^�sĉ �un�]on��K�c��`��rbt\�#M�l`Y��b]�����A8��=�B(zK��^����h��=z���M�a��6��]�
Hu4���2i�av�����/��b�k��WP�����>u$�*RCE�GD>"FM�U,_L���ͮ�+��E����|������������j��r���)�qt۲� b��4����.�Q��C~������ή�~����j:���2�[�6M �n��#\Ow��ԗ�u4Y!�׳	F�0�|5�,��z�E*<2��ߣ3��iRXfZ~�<�q���q��-?݀<��dUZK+B]�wN ��ky����`(6�Ȓŧo��^�}�7�z�S����қ��T�È��Y�N+�T@T.¨��8�h�R��L�.�22Y��l{�%�'.�3qWMb��4��1b��BǃaH�GH�G(�7��u����~ן�Gw��5˓�$K�O�n?K���I6=>!F�-�ߢ�� 5�|�7��D�Se��s���
vf�/("6��W�"����e�=yފ?�#�X�e����h02mY��]'�Ǆ��q�FWX��Z�T��e����$�Z��؞��Mu��a��c��B0ܬ�B�-�O�u�qfW�![!T�娝}�O�.X��_I/S�<U
ǫ$?�����hvå�
����Vh>A͹~�c�	��QO82B�ҳ)��_�P��>��Ηuw���o�����7��
W]˵L�)q��ص�&��[�E��������"�����;�pY�}��iS9�z)	z�ݢ�q�K���������ܚ�dU����&a�3����$���WI�G��?	�~[!~�'&�Į����Y����>�m4}�� 1�|�/�]�&�|� ��"�bE�R�����������9�@�C�gM��+�a|��Z�zaG~��Y��I[��O���.��r�P��,�\NE' ?-��d�.����,�pR�%�4[ˤ����.M7���ߔ�����8�4�9+��`�^��2���7����$!Z��<�^�:=,(�|1�
����U^��[Wx���~����0|L�y�K֩���^&:6�L��+l�W�^��0�Fs��Ǘ<0'���{�&��q�
������u=Q��)�������לek8Z�i1&m[-b|�ʹ��J�i=1��/�N� ��+d�x�ҩS�~�fY|������z�� �N��햿� �����[y"f�J��eP�B���J\5��=��`j(�7�N�Tf�#��#%��<pMW�����7q%X�vGJ��?0���l�c{���Ⱥ�y����_r1^�B�9%x���1ƍ��8���jS�4��B{�Qy�rsg
Ja�~���'wG	�B�a��w��Zb?_�u�qQ٣D��|�+0�<�(�k�wP�{�K��YϿ��o�����K�M����χg�=��d���6��]�c��ԫ�3F��nc!bd�Q���9�*gz��jF}Ch��}E�+���9�<���R�E�陪�6-���a��Z�8
�������}��-�}�޿)-�b]�hн7N����9k�[�9�T��tSk��C��#P���LI�!�pvv�I(���zf�h��Ey�t����*ׇ}�b0ak(�%��    ����tZ��-g�`�C2#:�����i��zO�Gj��i Wl�[��@;f@pP��Y��	�dqXT�C�
a1��$A��N�'�1���M�bH�؞k6V(����i�j�L	�n�/f���r��sDk�Z�E�d6���$dy.��i�%Ʃ?) �$�4V:��1�ݯbS���X��ۘR$t�y�i�]�	L}|��#&1g�A$����q���&���io'do,Y���t-F&k�`�4=@b��v�Rj��a�7��el41�>qI�燾��y������d��u���9����h����8�A6�H�������,��3*�[>M�QϘ8X�u�����_�2�eب����b��v��z��E�u�;�`��	��P�e`u����s�9��t)�M>/�0���;��MH|ѣ��4�^�绚�
M���K���򋞜�꓃c�����eL:��(&q�5ɒ��^2]���ň1��r�����|���!p+l�N�\4��ܹy��J?�](\׈M��S�~>�����¯	7�)Cc X�?�:nU#qƲ��4����t��G�]+̻j6-��&}ڶ����"��j�J%��e�8��!�U\�~��Pp5�'���pb�1f�.�q�ŦQ��R�m�r����W��z�+�� �=M'�k�C@�m<�)��1i�lM�N��HS}��Ap���x� �'|�&�^*��9{u�`v�?��3��K^:G�,{��_�E��B��{ ��<�+~���7ޠ�@�ql����_����1�p�u|�������_�<#sA�-U�5�l��)ƃ�{-����|�kB����*7�����~����
n)�SZ\���~�ſ��-S�ƳL���,��h�7�*��'0����=݄�p͂r��PO��!�A���k�I����}������f�H�^��2�+j`a2,4�֋ �+�ӡ����&C�7ݠ_������?��k���b1@Д����-�(�P����>��fX 	GW��̀L����p�������/�C�N����(���4��}��������):���
vP;�c(�AC�{���"i��E��!��5;�i�D/·�Y$f��ѹ�89'��D��Q.���R��x:Ʃ�.�Lb�$?l���2"�J������"�'!ڷ�x*�������	o�[���6���Ԥ����e���e��NT��bP'�ئ�?	zp"�����WM#D���Y���P�|+���/�f��ڮo֔��,Nd��5$"���v�F1��v�2�{:���_R�t�í��*j��{�t��)��>�9�c+�jx���p����`�3N�q~{���K���Q5r�� �|<�fD�#kV�2s�a��7�Z�7{D��i*��� ��p1���D3�NR��p)�q;^J��p,�kW5 �dn�?W�`����?)C�	gg���A�9e���)��a��*�O��K�QA/��w��!�/&E\�nʶ� 1Jn{�>nĎI���s�"r�&��D�a`�پ�t�_���n�����	" ��F��E����m��ut�^a�"�c�UL��:<���jWo�Ͳ�[ .;�<-�ώ�~t^�.��;Z��(�E�f�d����N��L6�nAA�.-rV����v�I��|�&2�Ms���� F��z=ͨ���۞�j���Ĵx:�n�E�~�U�����I&û�����@��tǠ�Z��O2����H��S�:��?}l���(�o_az^cLf��؇�'�1�6@���n�M�|�.Y%�3�-�*��aF
�3��j5of���j^áX&Y�\���e^2�m����,Q	�eb�<$w������y�g}t��L�G:v�z��,$~�`�J�E� ~���@4�ĨǠ�JG�O�Z��c�'�o��-$Ȼ���V�1���ν��أ�"0"[�7a7�1iRB23�2k���!'lmG1¤1��H���~ȓ�
�b"C�t˂��$�H���"d�p�PG=T&A��)�u![�ʔ_h���y
����p�:���N!��'D�x�5%O۝��iܴ�㋎�Z`��P��tG�5�PU��KX�%u�{eq�"V7*{�*/b�I��`��4�#���B���L��t��"�#z��Q'��05���J87z2�=W:_mL����ۻ�W�!L.����ß㑮�=�bbr6������ْ.�������57a��(gh�|�~�-�w��2+B �c�G�j������p� �x��}�\d���cM$�]�̗�q t��o/cN���
ǽ!7�@�1H�h�#�oҘ�(�.�s"�����q�ɀ�����������I�i���G����T� V�u�V1���;a'����M�򾢁�r4�M�Gf�o��G�=|��:i6>�<]�'�\��(���9]x��x�Oc���Y�fkM��1��Z�b?��}ϧ��P�є+���2ó�y9�7���7��bL,�]�UX\�]���[�M'q�cr�=>��Cp��v��Wj\�"��O��B�m�u&��'9�x�~�\���ɀ>ƟR�h�������l�6
������G�v�I��dyhǇ��c�����x1��z-���٣vD("��CXQ��>�K��[�������Գ�z��|�eb�S[Ș
�U}��TS���g~x�|����7˫dP�K:H�a�(�.�Y��D�A.�8��6�^�/���@�T!�w�G�x^���zl��oN==��#(�u�-�\�j�f�"N�$�m��m����	��"�X
�`��e؝��s#$��_�Bi�6Y�ax�����Z��M�YVi�	��_�}M�q�O���?�h�C�58��wϏf\��;����\�iHq�9#�u&:�!g�]��&j��i&n�}ޥa��3�?Xm^(��6��>�ܐ2�n3���#�wy����Ǫ38�x����xv�'�w�$����躩iM�j*�c���Bk,�p��=2�+DEh�aX�#�K.8�]������+u�ݵ�σ�S=�p.p���,념�
��� ¯�Q�Ϧ�i}\h,cKG&;0�z���.�|��ڌ	{NaZN�z��_��\V`���ᶜ��/�d�����n��g�f?�ë�䇧�O��{xĖ��Y�������Qm�x0"��ĝE0�Q �O�MqK5*JŬH�9�=�Z���~���w2j( �LS�'���]�C����h���{<�3�l��bn܀diQ� �1j�#�T�;��2�?�qFo:mPSA�Um�M��݅�#v��(+�@���	��w������y�moe^5Ӂ�QY��A!��:�Jvˏ���/�^0�Ex���b��%_+�$KA���1��I��%[p��1͔x���H�>$�f��ۇx�~������z��$�8TJ���4����h�򦳛��&;_�~G��.齣��nqgL�L���+%$�eV�l�.Է�Pi(��������G�j\E�A��&���3���Z6X�ِ��r�x�D�|F�����z���}����̇e[��Q�#2}.@�f����z:}"�٣]Q�)��"U� B[��G1ʶ��k����{\ z�d��m6l�i���0���¿	�g�nP��4��G�L��D9����Tl2��M�<�����c*7�n���6y� �e@Y-��C2�¤D\���]N*��pi��\J��zn/c�@2�0�أ:ZcJ-F�c��{����2�M W'c��pn��������L����d��BMy���`?�R~ݺ��7����QvN�r�>�o�;�c���YY��/�BF�Z�ҧ<ݭ28`w�Nr��r,���BEc��-�ޣp�r���Bdz�u�R�;<Wx���2>5�AA�:�*2�\'U7U��� �}9:�k]�tx���@�7��aU�۝��B����E3�3�}_n(~��$�o葉v���q=���G@pX������f�)?�����p�Ϻ�p2=    ����id�Z��Y�f[�����Iep��)���1lMk]�@z7���z�z�AbTD��`0�G/��_�3T��X��8��:U�I�0���u�%��'���XN�~8�Sk:vz���	���4n2��7�j��(�mgte>���MW�	W"e�^�Yq�Nv{]F�T��R�N�W����f�BHy�[�#^}~�Ǫ��8 �#�)d�;�I��!�]���#�g��8�c֚�
o��N8��i1�n�qp�5�S���ɾ��r�ɿ��o�Y��UZwL���F	u�Ʃ5�K,�Rָ8Qn0�?R�=���g@�@��T�4�ڂ���r��+�2��eڍ��b�����]/�
�2��A��T�o�MV� ��$�w�8��rL%}?	
�1f�amTjˮ��?�0���b�T��&�����OJ�{\�p몞Ѹ�,��e�m���'�ҏ�tGڮ�g��KH-�����}���v��4���`�k���T��x�[��Vq.��(��`\������y^�w��χ�;��	��z�ڔǈ�aX/�����`�t~�\�B4;�^g[���$����!�'��Ja�l$!���,�c�ty���!���n͍g���.#�zIv�����(�z���\��L8��n�]����@��>�5{&㛞1"���s�&`�m&�d1�����������g;:CmK����=���ߒ:ӎ�Q��`2B��6U!L�{��g�6?�2��N׺MӆbX���8�����?�zg����wR�Cͳm�m<� ��d�Ű��ϰ���/,^�
�g�
�c�F��b�����w�e�m��%�C���Ä1b�+��M �������ا�4��294��SM�h$Q7�Z������+c8�'�H�}b��8_���>�S_�`�~4��:�*i.�m��٤y�H������^J5���F�X��cL������|�Ect��Ҳ]�/ѧml�!��ꐗ�f�tS8 �ԳT?��=���fr�u�O���E(��EJ4�����2GXc������t��Yָ�����ʽu�y'0�Ϣ٥�|�'t����{���-���ں��d�8���.�2ρVUkJ=�v���l���(Η��g���I�>=�����ژD�aa$�PX�h�.�]Of�8d�78$����!�2���}�2��2�bB�j�d���دk�mi��y��1MCou��u�?V4{!�,=�6tI�E/�<�z}h���d%ɲTj����m<�'����4l���,���"1ʻ�g��{��y�+��RV���ĥe�R��۝��dkM7���0F	k7���R�?��6��� ���;N�})_!�g���
T�FNUy=�<7Tk�9O7�?����܉�9��:1��V��}��qR�v������Y�����a��R��:���E��t����'����U��/��M�� �����P��BR��i#,�F$��O��RK��QR�4԰�o�=������I���Ʉ ���v|_빴,ǳ���X���)$R]8^����ȿ��/�r5G�� Y�l2��nǮ�e�J��T���i\��h���]�����I�r�:��b���T��եz�:90pn�\#7�|
БV�A[��Jb�Oz��#��Mˆo��K`���5�2S-����d���W�݊N?m�g�/xj�U٦���m�T1�p���+AXX���Z��
��������!:o(�~�=<&��t�N�������Rh�S'}ζ�����GN�I3m�v���1Nj�!�5-��q;mʏD����prT!"1V�@�L�Ny52Y���Y�W�~����%t.4U3��C��1nj���V���wR�t�+}�l4��a͕�4_�ϖ4I����yK�hMXS5͒u)/ЭiH��r�tq���!�c8�!���B��E#�U�!$�g	j@��<K`g8.��v������D����	���X)�&$��Ыrh+���&8[*6���t�k?o�x�<��N�p9�<�\հݦӒ`1�i�-`O]2:۝������
��PEpڅ��v���r|=�� N������>��r����9�է!VRo����G�RއHcd�D���P�<��h6�ӑ7�F9p�d�E��#�;���ت&I�qy9{��d�D�Ҡ��k�)zj�<j��������y��nL��U|����u�\��\�hJ��@0jn�6 Dp�lDG�*$ri��'^
�Q������>���F~�8N!:SO)�_���*��_=�B��.��k�l�D�f����5��oKm��hb��'����O��K�����P�r�M�D*��e�<�l3x�$�<��?ƽ-��ܫ�pY/H�V�<�:[�{:���Bz����\�6m�3vc*�a���[~w���א�M�^E)�K�=�R�*���0��:�/��:����g�T���vX�{	ݪQ��:�V�/ x�>l[@ƾ-�E������Ǘ|����Tf!�ſ�..�?��v���|B9��=o�Kl�r����!F�,�Eksx��$�|
Ng���gz�t%�7��X*R��M�w�樦3rd9�)������y0�=���*���￸:2*��H����2�xl���Y5ϰ5�q]I��E�K�B]�!�"<H��2��,;����� H ߱��}�m����k��[݆���
|D�0Y^��������-A6|��#�K��� ��2ȥ��
|��Ç�5W�d�������c��tm�3F�l�ї�����^@�ʊ%p��V'o�MZ�t���V6 yC�R���v��k�p�3U��{>�;�Z�"$3���S��-�����tٙ�x�o'��*
_�W�xﭺQ!�BXn���R��M���Iyr�*Ƥl�u�(��?��K\�9���]9t8�э�/ʛ���t�^�>���	�K��(I'�5��$1:�&�]f:[#?�0�l.�dNS�j�⠻e�'��Ӑ���5ݾ���)m�5$�� T�e���>�Y�aQ1z	�z4��d{��~����V�$�����4�N�U`Ċ�������7~4V���R�&v
����H"�>�F�2��l݅�j���e,���a�_P�_Ŧ&e�h`G�nʆ��0J���M$!*���9#"�dj����M����㍔��w�k!02�x9�v��ϗa;%�p���yo�O9l*K�eO�zI���Ǜ�i��J�j9��5ո6D��q"֐"Z%�G�ӝaP�}� ��f��Ҳ��H��&~�Wp4�pS��I��Yߪ2j,�i;�����@ҾY�7��
(���ۺ
8T�|�7G糫��w�*7�D�#����!n��naGf5�W���G����QrՆ��M}%fg��rǘ�!��GU$NrK�T��*��,�Pj�)tG��e�>�W���e�f�-�c�p�ļ ��D�8�^�ߕn]�/Ыi��䍇V�Ձ�(�C�&Dr�[�M���z9��8:2���Qg�����(�d���]�)7_N�@�� �* � M�}���$ξ&Y�?>ל�p]Ok*Q�K������Ô�?;�i�*��G.U�;7�4�M>�{� ����|�#90oBL7w�`�t��I7	��[N�>�s@���t�)�
����#?��&}ڶ��y+��﹪�����}9�w51�b�5|���q�hc���R�Q�b��B!?�U���Wg���|!���w/W�EF݆��k
�heW3Xb�t�w� �p��'1�W��%V�+��>hDu�L,3u�n��W+���K�(�?��K���nOr9�6O�ji�,�5N��豔ͱP�7��by����UZQ��E�Zۄy�7�u�32���R%~�{n,3&�C�Ȣ����:�ߝ+T%j2���G	���^sz�ӎ¶G�S"�����F���,�G#2��5HE�(W���40��@+���N�p�!՝Xu��H;��-'n{@�2	FN��8�^ Q  J�˚m� մ��Y�95�J~'���O��Jϱ�-(y�4��d/�Z�5L��qȂ�O��"�
�n�D��h.W��D2���@�e��?��xD��CEG��hz�h+����B�����ʚ+���~����j#��� ��A�\9�Ƚo�k�r��o`c2k4����Y?<}���63+�͗�_�:^�{ ��c%i�j�,�<N:�2N:�߈�	N�ʞX�1˪�|Aʠ�]��eO�H�P��7�M��&�����2��v4܈�B%K���o�[1�"-�k6�	>[G���YxE�����[�����/��������]�J��U��L�����2�m�N����#�q6\?8u~��X��'4��͹	�qx�?h;(�Z�c�L~�]l������P}�Ѩ����w�^n�^�\��lz9u�E�M�o�R���A��z�~q��儨�x*ب'��>n�yC���7��p��Ϩg4�Q	Gճ!�Ҍ�Zv _�Z��F�7��#c�:�EVr����>��&�&/�����Їw$�7�̮�V�_�${�-��B~���ǟMzo���Zo�8���?eBf�(w3�Qnm4���v���E�ļ�`����U�Q.���Q��4Rٙ;���e�|�Kڤy���Ϙ�׿����[�ܫ�l�z�-�l�y �q5��_�Z>5E��Vy��v倫_2<�
�����{�|g����0����d�t�12���Ⱦu��8`j=Gs����P�dʑ`�ݓ5�J4��}���:\����9���Hg�-��,��B����J����j!�Y�fp�!�F�@O�3��^O�m���Ha���N���_��qC͇�
�%���4��c1tI�>Ft�Vw�VRK�Sq�1��yz�h2���U����S���)��7���j�G��1@���~	�b�)91�����I����x���l-��j�τ?n������������s��a�W琸I ~N)�4�_�k�cH?�N8�)�n�-��Awʊ�h
1��^�;l�X�(����شbwz�M�ob�0R�n�d��ݨ��@������'V�
�B�������w�ı�Ty��F�����òr�(s�,��pb���)��7�-rg)G!�����}�Ƴ"�}N��'�j.aH0c��<ϣ� X�/��3��Z�.]�N�M��3��u��xN�Xh��i��Է�S������n��Q��O�˯�.��/CZ�S�bڟD!q ��yf�*�=6Fφ:����9N�%�IA,�Cِ���ٛ�F��_Iv��=2ѼK��ql���^t�h���č\�}�k��}`���:A!���$O�w�mV�!��i�<�!>z�t�F|$,���L�A�B�2'C��Y��㓾�	��*ǚ)Zt�B��--g�A�dHՔMq�t��Jf����K����E�.���)��`f�z����YoqE��U�����Gs�!����^�犠3m\dGC,��侺�~P��壈�Ţ�n?�Iw�A�WQJ3pt��1���iY�e��x�|l�� h�fk�'�Rc8: �}."�}T/Q�7�0�	!#Dbٶ�p��]��xx���N�ěNSM��Kl8ظ.�)���z��6�擂���藳���Wjx�-��!/C'��~}�+��t܆uv�	P֛�Q��b�Mk���?`)t0���(�ؗo�e��c�Θm�����$tw2�f~3�,��;8Y���:� ���\D�l�
�/_����ҏ�q��T�[S�j��Wt2�Vop�g�3�}�s�3G��L�ں�<�].��������������.K7�         �  x�u�=n�0Fg��@
����&A��{�s�ф�ă!�Q�g�����}�\���6.�]��:��a<��v��І/�V�;�鼖��Ʌh"U��-�:���g�8EU���أ%O0+�Ⴉ#0M0)���Z�g���V^��&f��tP'X��`���	6�a��y��:�Y	�*�P:��F ��/�s�!�AQP�_�'��i��U�e��[4
����l�2kTɒ}���h��*Aa����z�PUf����ZUn����ё,�Uv�����	7T6��Ea�SA�M��4Q�򅢠�&tb�(-(	�lB?&�Z4
�lB?&�`�M�5T6%?&�$�U6%?&�+A�Mɏ����*��)�1��������V]I�         �   x�3���vQp�u
�Spt�	@�W��BPbe��wbAf��_������WbvbQI�BHfni����������gbJnf�nj�CjnRi^Abz�^qr�^f
�8CN#CK]CC]#3s+S+#C�m`����� �^&�         z   x�3�4�LL.�,K�4202��� ڐ3��@r����
��VFV�XŠ�����T���� ��Җ@bbHbFi��cVbQb�H���X�6C����Ff
�V�&VFX�`���qqq +V*|      B   |  x����n�6�����k$E�t����S�ޠ(`��2��ZI�!���;CJ�Dq����9���f������K����,�a���!c9�y�V6��(�4Hɽj/ꫪp�>7e}�����%y�r�9M�����pU�G]�'�B�"�E�"d�2D����.��'�X�Q�E]m]��iN�׆�������^�������/�:j�R�i�Ҝg^ 9%O��^T�ۺ>�yYI�y1y��jC���U;��Y�M1�4�y�!"Y���+�;�G�<�q�Y�+�k�HQ�ܷé�p����=^;����1��xu��yԕ�U����q|�龇����/l�����U�h��&ԡ�N�y��G��C;��=~���nĖ�kC�X��Qe��:~)�����J�gCrB����+:��ӥ+��Oujr�Y�A]��!3��:L6\�Ư^��ֆ�l���N��M��o�ah��0���^���> �á�/ʞ��\JPZ��ڢT���-�Sm��cy�Q��l�Gn�Y��e#��h��p�iBu��b((�y����P����$����1A���6��#�^7m�A�~�ۮ� c���nՀO�K�\�2|�=������~�;b�qzC�i�z��D�EhA��Y.R򤚺���[�jͯ}5d$�=�G4o���2h���x�)#[��c�4�iG��������Ĩ�@��-^QWt��?T;^a����&8O��[fO�B$tds�PGk�I�ݛ���&~���Q��h����L�-[dJ��Lؐ�+m?�;���BN�mH̗q�N�L>N�<�����\����xy�~��PC2��%�\��s����n�顊8�ұ��d-�Kj�3�~��$4��ֆ�7��[��������h����Pt���s�L<Ԡ&(�:NW�{�Zun����NEYΛ���B�!�v�s6�j�%��l=�
Ve9�^aIH��e�^	�>��S�?B*l��p>��:Jn��.��9���p��<�N��?�!�t^����QN!��k�������8jNi~�I�
&1R�ز�6���[��5,��f���\zm�f5ܭ԰U�qa��'���ֆ�ۂ���"��"m�Z���i���l�}:5q-��,�f�"pal�7�c;�ü���+I�Ix:�R[�"Ufd<�vU[������h%|)>O w���c�)N�ws���d&Ͱ�����I��^wdwő����Yr��O��Ƥ�Z�Y��h��b��/|��#L�N,Q�[!wX��%�ڟȺ9�G%��y2��oNX �z����г|�����$h�x��4+x�,߀.Ǿ��FYrE�D �g+��)�9��LR"9�vs$���E�7��!!1�@Re������Ѕԥ���M�-��U*�p�M� �+�ߒV�"�p9$�c����R��Yv��o�&��?��ۦ,N��"�UP����-�y������Q���#����/�� �r.�O;nO�����i��� R�.����'��l('���:X�doġ47��dx�P����S�4�<�l��{��������U��n΍�n�9N�sf_Kj(��:�����Kr+����k\��         �  x�}X�N�8���w�wY)*� �鴳iw�ӯ���ӹ,B��9I��;�_��q�p,~�K���ݶ����{��+�[��9�.�ů�"��:�8nW����ܜ�K���F����Rg�f��M�@g���)%����;�)xn ��_V�[?�°�?���2B��#t=a4�
�Ȍ�/D�9o�T-ep%��d���9�hɜ��c��g
�|C,��R�,@�b���0ow�� 0�\���/�8o��n���W�5P(H&�����h��\�:��<_�A����ѯ�ߺa�'�I�(�&9�%�#؂ƒp�~ۆ���oNx	��x���5T

}���b'p��=A���V	IY!� *�V��]��6-�b�0Oפ����^�F���zĩ
g��ܣx�ʵ�'��$���x�	ޜ�%��>�O�_X�������͏<h��EOP�΄,Ѯ��6u�t��ֹ���a��QE�t/���Ec&��m�-	)�V�
��-U�������/: q�ENW����Zur���B�u#�K�}�˂.���[�����{C�>��hN*��~��H1�"4�)�ieY�5fY���$�wY�vY���A7�����&��6�9m��L5�ޢ\Q?Ş���_>\(�������Ҝ�:����~XӺ�~}�c��8�����{[<�Q��~�L7B�!PU@hwL�>����C�k\Sg(��1C�~��8Sp���Y�k�ea�l#�����I�'��
_�2xS�p_�0,����Tm�R�����~|�غ���*����k7�+e����A��}.�3-(��sc����?)��I��9f�SAv�u(*���(S�d�[��8"Eg
� C�8,#��T۲6O���g�u�,ґd3	ng�����}[;�����&�%�Lro�1)����0O�ͼ���E,<�.+�o�>����&�R���cA��s��ǌ�頜�ύ��'�����MЄ��#ZUh������8�%]��@C�C�)Dp�rkIG;���a���G]����J��\R�-8��h��bQ�Xv���u�pE����k�0:�~��l����"7l�#'�d%���Q�(�\m�[u$4�B�bEb�+X�Ɇޑ�hr:��k��?�����C�3��$����A*�q����)��FKJt#L�iq|2�������(��8�7��c�ںM���a��!#OP���]y8�:��^C�,x��00ʒc��>�_�V��H��������FB�ά8��VX���y���J��lL�7��T�� �@�:-tɽ��#GS��J�v�0r�q��n�.<Ȑ�A��-X����`��eOxS)�àڢ1L��G\J>"E£^��t'f+���糠��F��J,PȨ�d� �G�ɽa���X��A�p�2F���o9����ɹ�y���:(�5��$~@�=�T(-���������	�퇏Ϙ�6�QҪ��P��#Ug��*}J���o��ma[#��ZG��<ݺ-/�� ��|����8&�μ�{���|�e�����d
	ꭁ����Q((�R�'��]�/��F/maĹV���x�� �}�e,�Vs���f���_����*��      >      x������ � �      ?   �   x�u���0�h��OR�Xf���T�]���@��gK�J���<�|~����u��{V�Pۖ�����K�pF����k�	$� ����急r'@I��9y���7�̃̃̃̃222�d�p>�iv}#�	P������\d.�\Թ�s���s�)1�J��(+� ��(+�)1��(+�i7�0�08�*�P��
<T0�*�\���\?������!jT�����|@�      T   �  x����j�į��l���[�K $a�{�7��8�k�m��>_�\�#�g�U����ɞ9��>�g�n��~o����ۻ�|������7���&�~��S���ަp������^ŋ�Z�����y���O������_>�����~�����~�QpF����1�dd��q7��-&d���}s���/G�VF�p?q�M`�W�W\�_�=�����뷗ߦ�!.��x<b�҈p!y���yD������??��P�^�p78yƝ��w��W�N�p�9���2����Ǘ�iۥ�b�,���0n/r�p�� 	 ��, ��� M@ y� (p�88 �	��@�  c�JLa�JL6B%�8B%�4B%�<B%�2B%�:B%�Y�&Tb��hB%�Y�&Tb��hB%�Y�&Tb���7_��g��K	��2l��:��u�`�,���Y�����`�,�`�, ��Y@����[g��*l�4�:�u0`�$��:0�:��u�`�, ��Y@������������l�t�:�u�l�l�D��`<$�:ȰuP`�,���Y@����[g�Nz��� ����[g	��2l��:��u�`�,����{��oW(#��%���%J��K���(�/Q
�_�TؿDi� ��e J� Q� Q"�A�$$�DɈ	�R��"0$JCjH���(��P, D$�!I������x|�z��!A�@rD�dĈ)HR"
�!CHG�(�� 1 @�!?HD|(���P �@
�C�TD�iH�
d 7�6"2�b�1�����L��m\dbŦ죂�s��sF]}H���Ou�� �> �9�`�Q�Ou�� �N>`�ه���$�QW0��3 F�} ���w�	�������[k����Z�&?���6�1�ֶ�����|������g���,0ܙg� ��~-0\[`dx��(pp�Q�����F���g�-�����F�����/0
�_`Td��hH�ёc xFȆ���zC.���L �	y@�3�������<{�Wd �o�R����~��9��|Ro�{R���>��I}�Ǔ�'��N�|��wx:��sJ?����7����7�����7B���?g�7#.pnF\aی���q�a3��&�`Ռ��ӌ8¤q�C3�{f��̈+��7�2#�䗋mN�,��#��ns����o~~5��(L�mj�!S�;��	fL�3��R1����_>�{����p�#B�ӄCf	)�Xi��]iB��҄��	��ð��gaXB�s0,������K~��$lϾ�&m�?�f�'Ǥh��\�M���Ͱ<������q�(]��}�e�t!�o56	盍B�����!M���【'�|�q@(�¦�P'�|�q@h7V�IJ�/Y�IL�ǔ����<��7^�'A} �)?I�y��>�_*���<����@^��dux �S~�9�Ϫ;ۃ�7$��"�<��� ]uf�pB>�N81[�mm6�ߥs���&K�~j�%$?�����d	�Oj���4YB��,���L��=�*6�M����BD,I�ߧ��'�X�p�'�X�p�5'�X�p��%�/xyZz��°��K���KQ��KѰ,�K1�<�)`��#��T�	���d�&�#*��G4�=��0|1`�4"?�0�?�� a�y�o!p�~xB� 2B�G� ���<�#x�@Ј-�W�<u�0� ���<"#xDA����!�#:B�G� �H!�#!�#"B�G$� ��Q<�"�:�����!�#B�F����!�#B�Gd� �(Q<�!xDG����% x�!xDD����!�#
B�GT� �h�<b N^7���!�#!�#"B�G$� ���5ĳ<ۛ��� ���<�#x�@Ј<�<""xDB����!�#*B�G4� ��14�� �0� ��>Xx]�'�`@�d�h��#�S}N�q�4N����>6�8#��@�4N�)��I>J�8��	��PA�T�,h�����}Ơq��|.��c>r�8��'��A�d�@h���Yx���"v4LC�h����0�#a, r4�!q4LD�h����0q�a
�F�T���i��5f i$Lc�3&!e4LF�h����0�aF�tq�:�@?|�A韎���t�@o>������>�L��ghp���N_}����18}�!�>���OV�뿝V9}�ց>����'�Zp��#N_|^��+8}�I��>����g�~\��t�@o���P"\\�$x�D�pt�R�����%J��K���))m�\:dRnS�vJ��/�����/�·���/�����0�N���70W>�O�����3C���%L[9�K��4�^��aF�^̚�+'��s���'̚�ʽ�+��-�<a�dT��\M�����Y�K�v	�@��&t�M��0W�}��W��Y��r�e��Q4!��h��JM���	�O*5��'i��$M�|R�ɲ��R����4!«iB�Wӄ�������YY�=Z{u�Ű��(;i�����(�j�R���(;l�Ұϖ(�m�2��V(Oǆ��}:9���vxh�է����D�ؑ/���G���8M�؉ӄ�]8M�؁ӄ��7K����t�a�M"��&$��v����	�@*��&4�G��~��^9̕dTV���}^�'t���γ�vy,�z�&x�&x�&x�&d��hB�.�&T��hB�.�&t��h��.�%��]M0��hB�.�&$��hB�.�&��hB�.�&4��hB�.�&�K�yAyA"�b�0�ƞc,_�d���)0S� �!4L��k�;�0#��5���5L�7k���0�a
lR�Tx��i�;��yf��L�rPj�bX1K��(	*Q2T���D��O�Ұ��(���-X��;�Dq�(�k����%��%J�J[�T��%JC�H��8�(i�P�s"Q����HTkw;/���ΌD�v�uFt�kW~�S��t��_G��:���ס<#O׉<%���)�uOɯ�xJ~��S����_���:|����;%���y���)�u�Nɯ�vJ~�S�뜝�_����ګ���F=%�.��4q�zR�W�@�]�@�c�@�i�@�o�@�u�@�{�@���@���@��/@�w��7��������w��7��������w��7�H�>��V��n�ɔ|�}~�~�}�]}��|�]$�$нw��m��c��W��K���ޟgޙgޓgލgއ'�;�G�c�U{�R{ǝR{��R{��R{g�R{G�R{'�R��Qj7>B]���vˣ��!���������	��������������f��nJ�mJ�mJ�lJ���+���M��M��M��M������i���i�w�i�7�i���i���i�w�i�7�i���i���YB�7M�7M�7M��7M��7M�8M�8M�68G��ܴ.~ ��m~���M������$�!�c5�H�C��j?�����,~ i1��Y�@�b{q�R��#�5Kɳ���,E�>bV�R��#fu.��>bV�R��#fu.��>bV�R��#fu.�>bV�R�"���,E�>bV�R�#fu.��ⷿ�z��y�         �  x����N�0���O�`�c��.�@�vYԖ�X!US�MLBR[�<�Nb��H��3���q<N��%+(L�KySWX2�����o��Ul�ct��;�kZe��!ܤ�6�2�����&�QP���|V2ue�&��1\��A�;1�>n� ��Ny.]�a���N�`,%��I�s⬰xfP��������7�6�E+����҉�tEcv����\=qt<`$k���a]C�����H1�b++&TLheƊ���U�P1C+�AR>ɶ�P��
a��ݢS�`Yۃ�=Q���qמ�+Aϧ)�XyZR��f���H��s���a��.Y�V;7�S��6]�2�SVm%�]�3��*s��9�%���>?B����2I�|�͡\����eK���x�8^<	�	����.\֢���{]�u�7B�Fư�J��H��vPy�v'�q�Ζqf�uW��_�G�5lWR�>�X���C>H�c�#jG����gհ7Y�3���pJ���n���	�Q�����cFz,z=�.nW�dn$-��3�Y!Ku8�3��Ŵ	����,9���p��Ή����|e�+fڸ�<v���3�a�b��Ճ��ur}i�ss4q���q2���3u�淧�Xw�W:tpW�bn��Q�
im���뱗4��~[j��vѶF#���U��o����`      	      x������ � �      V      x������ � �      ;   b	  x����n����O�p��(��Op��^������Z�ż}�:�"���Y�,1��Ub�*jE��6��o�~9�}�Om���(��ENi�Xͩ�&j�k�2�v��.�W��[e]�_��ٿas����ԏ����G� r�j�k�"���Y��l~�T �=u;�?����E��1l����V5�W�v�)�lL��/�a�#�������sZԢ�E�U!S;f="i��I{�G��.������'��NMht�`��ۭ�R��%��-������~|ʚU�5Z�퀃�5p5���\��x��1��O �Mw>�4������Z���x�Q���"�e��������@�Pf'�D�����\
�΅GY7C��u�羻��K��4�o�1TQC΋�q���� �xx�u><�:�������Ӝ��C��k�jr@4�Y�ã���Qlm�'������aZ��/K��g��Ű@��)��"��%�|�.�=]{1RD�8�
����kbp��z������ƒ︵�!X�ָ -������q���?8l��UML����5�YK�(E�䮚�7�bc7�c7�C�����	��z<]��O�9�K@���2�q	`y:�4�%�U��	VS>=��cUNAE�ZB� �N����� ��?'����J]���@��p@`;)��7ao�J݄�����Ğ����1��f<#��%��B	�^��ؑ)�� 6sb0�Fx0����}T��\������� Wʊ�\ �Y~���6��3(~X_��ǷXh!c���P��x7�q4Ǟw4ɞ}$IŢ�U1��6Ò$�9}�ܩu�L��be)&�Hr�S���|n?�m8�:�B���r'�@I%e��XH�T|�i�Z�)���DJ�G��og#�c���q�s�I)}�$s*�6�I|�|9�/1��D�����Eҥm̷L"��vI���`��:n_S�D���]� � HAvA�����[����^�-�X���XZ�����l@[�Mx�~�<�Y��ڮ͟��+��AMTD�_XO���<�Y������H&®Ѹ&8��ЎC��<
�f�#�9u�7���Ϯ?ZY�	���*�䦨��o.�����xS��5=��8��\�33�&Pv��1D�fx�,�&2�dy�Ї�A�����}H��Z����kPT��HS=��ؚ M�u�D�\���P��s�����a3�.SS9�[�r�2	�l�/ndn̸�:�fH7��Cj}��t3b$�j香�	��[V �1{b���9�g}��@��?ǜl!�� 6i-�9>
�r�5��1��-�憡[�A?mh��\`�������Y$L���4�7ہ����ʅ˦���[����Q�Ai>��"k
~P5�JÅIŅH��I��x�i|]ë[ ��̝/6���l�	�O+� ���2��_;HWN���'�p��e^_��J|u��	z:(����M�L��-��_��<�)
�j�! Nn�0ԍ��1T�0�8N#�:�~��8���$2��B$�d�m�_��WM�u�[H8��@���HVпD�h%�<'��.|��Ӝ.C`i�zJ@}�d\q�i��A�	$5��ɶ)�Y�[EW
�v����)<�L�R���}ٟ�N�/]���0m�:���9��c���Z�)${Ф�h�9�g����A�r��Eyj���D�H�Q�u$77$�y7ۄ6�MX��6��-����+�AE��i(>��)W 
�����r0Ol�r�֐�!T]S�<�ڭ�N�nMvxc����y}��֓f�Cp�FP�
��'������Ja�E^�~G�1=l`2�V2�p�")Z$"C��@V�������`뵒$�%� V��Ȫ�t;���Ġ�W��Ĳ���B˘z���gT R�D:��#����J�yh���Çs�\y�td"+0�cNƉ+�t���r2�]���B����܍�2���U@X���m�?�'Q�Z�)T�UC �9���Y��B�A�p��2	�����@��g���%�^(w*gA�.@�����d��x:�3GO����C�]nFO�n$��
��"h:��rGBy�#A]y���\2�@�O�exQX��i&�/��۷�0� ���V #�J+����9K����85!�M�X�Ĭ)󹶈��D�H�D����`��̵M�:;�:hxE ��J�I�\
�۷�X��|�p+��T1O��O�v�J�^9~b�í^�cN�'iu?ؑ\Z؀EÙc2ˍ˞�cp=j���jQ�ەi�R��gdI{m/i�m&��fNH��u�B�Pj��1��5��J(�H�(P�%B��"��v��� �M�      N   �  x���ˎcI��u�S����;�"���h��x�	�)W��O��P�lWE�:'3m�/%�����������_���׿�J���K�r��y+Y����k������s���4̚�L�O���L̆���l��l���gj�l��7����]W���2(�q'�R��<˨����J��,�R�_=˴4�g�2.���.����˼4�w/׼�{�������������;�MK��'��k�(Z3
����ƥE����i�kҪ�G�Y�FaѰQX�l�56M�]�F�иQ8�n.���n�|Ė4p�[���G,�8
�6�>զ���حr���o ����OuZ�\V9�T�U=bOV9�U=�^�rV�{��*�`�ʱ�:�rN���*�^��!8�U=Ց�r���*�`��1حr�:�r�痼��5���o�tK\t��-.�����$.�V���G��E�6�+�{�Uqѵ�㚸��q]\tO�����9N�e���'�2��ˋ�y���[2/��˒y|^�����d^��%�2��,����eɼL>/K�e�yYK��^�9pk� �I�Da�4QX�MV��M�Da�<Q8�ON�KE��DA�S�Ha�5SX�US�e�Xa�5WX�S����ha�-[�u�#s�nA�-\P+���e�vA�-^P�����~A�-`L�d�2[��,V0(��f��[��V0(��e�r[����d���^��t��V_a\��>A=�qt�q�����F����C��k��^��.�� n����[�Z���ރ{��D�.��-u��D�.�ɉ�/\(�-`�P&'Z�p�LN���B��hÃ]&'Z�p�LN���B��hÅ29�:��vջ�teװb9��ަ�+��?�Ҷb�5�T��u��sd�+�E��e����ٴ�XvM,�C���������b�5���Τ��2kh�,ZZ,��˦�Ųkl�Z[,���e���
ؕ�zˤ,:�p֕�ze��BY��P6�-��z���+���i���vYo���[&w��B����7���>f��B٬�Pv�-��z��B���Pn�-�E֣{����l��Rvٷ{�u~K���-��-I��{/@�e��� �.��P�gl�f<�r9�ݛ� �������؛C9�,��OrO��<�9�,�ʽX:�9�,{��#g�e'�C��I�#��e�r�LN�V&����ɑ̲���u09�	����rh��H,�˭���:Ƽ��@f�$�E+�e�Lbٴ�Xv%�CK���Tb���Xn�%�-i-�̚�7��§�%�U��e�bb�5�Xm&�S���j~vK�m�d�:ڼ�S؁�VM(�U�jՄ�Y5��VM(�U�iՄrY5��VM&G�jB���P�&�ժ	e�jB٭�P�&�Ӫ	�jB���L�d�D����|������~�
�(��|"��r"��z"��v"�wv���1ǁ�M��|���e�Ndy�:e�sΓ�2C�d����<�!���d����<�!�蜳�H��y2C��9���F�'� �s�L�lt�u2C��9���Fg�G��ڤ:������-�[o����G��G4��G4|(���?��,o0r�=�>>�?��*�=��&��v� ��� ����{(���	�L��Ǉ��9��=���=����P&�?�@��pO er�w)P&��R ��|c<���`�����,���,���,���H\��~�G}�|��G�l� ,�� �Wi�� ���a�������ԡ�6���!(�:�d~��O��CP>uʧA��!(�:�S��|��Ob�<uʧA��!(�:�S�>_r�S��c>uJ����}������P���7DPv�wD������@�_���e{aF���݅]�zP6ftc�A�[�э�e�|F76�ə�'��m�>�i���W(���O��>�i���W(���O�+��Y�'������
er���y�29���B���~r^�L�:��k�yLΏ]̓����y09מf���@+�UˊeӴbٵ�X�+�S��Ҽb���T^�4�;7Of-,�E�e��b�4�Xv�,�C3����b�4�Xn--�3ij���Z,��˪�Ųin���[�
ؓ�z��B���Pn�-�+Yo���[(���j���Yo���[(���i��rYo���[&w��B���P�-��ze��B٭�P�-��z��B)�@�x��uK���rtx)�AY
/�=(�@;�����&΃����8�[�vp�߅� ���8�b���n�<(��&G�g:�Y���`rd	z��ɑ�&G�g:�Y�)������a�B9�����t09��<��������#+�3Lε�_<{�j�lH,�ˡ��rj#�\I,�V�ʚ4�Xf�$�EC�e�Rb�4�Xvm%�Cc���Zb�4�Xn�%�-i0��ZLw�ٓE���j3�lM,�Uӹ��jB9��P.�&�۪�dOVM(�U�bՄ�Z5�lVM(�U�aՄrZ5�\VM(�U���0t:���0t
o�=Y��PV�&�ͪ	e�jB9��PN�&��i�)����n��n��S ��w�������R�+xʧ��W��K��=(����{?�G����σ�I�9���|P��ѣ���?z4�29�`r����s}�@>������\�0P&�����*(�S&����r09׷�!@��#d(��ߥ����2�29�w^�hW��XOV+�Mˊe״b9��XN�+�K��ּB9�o��ݢ'�ˢ�Ųjb�l�X,�Fˡ��rjf�\�Y,��������]�6PNf�����3eY5�X6�-�]s���:W����[(���m�e��������ze��BY�����E8�o��}�'���a��rZo�\�[(���ɚ��Pf�-��ze��B٬�Pv�-��z��B���Pn�-�����ׯ��
�      P   �  x��رjA��z�0aٙ�ERB)�l�E�����ώ�����*�CB��k��T���u9o��!����/���v�z�����ۻO���/���z�/��q�_��_�i{w�l�o�n�n�.V��K������]�θ+�9w�w�`�V������f�c3VGc����X���X�l���;vcu8�1����x]�w,��r�c9^�����X���x�r�.�;��u9ޱ�[Q�O=��8?�_ޓ�5��YZTc�*�ֲ
���BZX���VV*cK+����¹����
aiiep[Z!��V�����
���
ali�0��B8��B�[Z!,-�Ʊ��AFS[?��lo�,WS��)�*
DT>�H�&��	DV(�(
��"�*#�$�j!AbR����I�bV��*Ei�]̣��)f@�*DP����- �z�uy�~>�h���̬f!�U-d��ELU.dL�B�U/d���̤�!�0d�*�̬�!�U2d�ZFLU3dL=C�U4d���̤�!�5d�ʆ̬�!�U7d��v��,O˭��Q�c�T8�\�c(�qM�CQ�c()s��CY�c��t��	��'\�n�p�{��E\n�q�s:\����p�o�E�	��&\�n�p�g�E����a������      p      x������ � �      d   �   x�}�=�0��˯���>���
�H��f�"�nڡ���EHc�n���}�x���v�]��=��=\j�9r��-��V��x����¡��f�:Ad�%�P�i�U���p�C���0)5Y���p!_�`u��}����B}Vο9VƘL�U�      v      x������ � �      z      x��][s�8�~��
>�V%9$AR�1�w��X��2S��:�DɲJ�g+�~4�H(70��Uq�X��n���� ����d�[�����'���»�ʇ������A>̽��"?9ˇ��ps~��{�ν�bZ<x�W��Q|N\������0�W�+
z�~��)��d,��⸗
.ޯ	�w~yrz:�Wg�������~4[���bYz�rZ�o���b���6-�/OF���i^̼�h\,ʷ�w:�/0h���V��ǟyc1�W��9��%��)&�[��e�@�Y�>\z7g�G���~�����"?����ޟ��p�ȵFJ��� �[�� p^cBX'�a�<?������9��Z����;�)P��Q���|0����|u;8q�3�;p�8�~̽a���ۛ�rp5��|� δ3�o��L��*��[~6��%7�;�P���д�3޷������!����P�8���x���K1y�gv���Δ�XC��$U��b���8`�&��u8N�Ŭ�4�j��p%�`�b�_�;����������`M�tj��ޯ��O�+�����a>�NuT�����[��ۡXNN��o�������OVX���%2xd��?y��ɀG�6�?�AwZ�g����/��8��əXɯ��?�Vt[�΃����a��tyl䝟����_'��Њ����&�!t�8<��!����i1�;�Ç��	��*��|�� �� ;�{�	��Ѐ�|8�7�O�?_�������/49�E�^'��/]�|�!��_�"��j���np�68�tb9�������b(�|��g�^�W��[|8��\�lFq��/3DR���C�緜��7\-�O����V�˰vr��.�m~�A{1 lhG��2j�8�33+���4�1ҕ�h��}��oņ�,Oۅ\���ƅqRM;��Q�ej�3Z��F���^�1�pۥk�3�MA���&����L�]̻�9���d&f�}&��v�n���M�	dz4��NԴ]�u�tFʰ�"�a�_�[�dV��\�Jg$�@�}�>��~��s#��2D�2�*��"elf��b��3r�\��@�ڌM �^�5�tFʐ��yz�:cR�������Hrr7C�a���������:L�^�O\Ũ���n�1�ˍ��Y���y��2��4A�ֳ��}83%&��9�v9�1�)C-�<��T�t��.�zV:#�Ǆ�!����'���X�Ǜ_.�����jP�ZpJ������ě��r���W��қ�K���[=���j;�s��'�4��O�ϑO�g/G_�E�~x�ʷ�*�O��]M�}���I���c%�oę�F�:��Q�F Wa�y���n����)��
��G�d�̅}y� t���Y�FE���u�ؓq�N@�"_˪��,-���ң��J���@�i�]��:Jٸ؍dm���S)eY�(|�Ա�a1[TvC�aU��9Pڼ���7*�:B���!iH�u%*������ѕ����H�Q�2@��ة�Q	�V�v�Ӥ�2Y�fm_�ڨ�]�O;��]�����Qڦ%^O�Q�Җy�fe��-�j�Fe�T�����+����_���Q�;֯v[��a	U.ս�YɻT�v[�s�5��ΧUlÂ���h�7dy�03�u�:�fE�R��i� #+c�|�2�Y��<j���!#�c�e�oT�6+h���n뷪^
��n�k��צ�n"�(�ZyC��3�*��U��3n8�ZG�qmߐ�ʽ%��5�Z�Fe]G�Q���z&Yo,�z+��7nT�����!���k�3�����u��F���hZ,S�dVxw崘}�?~)�cI��a�����Dxw��}�,�e��^����[�[��;߇�5�#�_�����9��1�w%���a��'�w?Z��TR3-���?��OwO��������r�����h:Z%��:��q6���\�'��^azд��!0��<Y%=�/�o�Պ=��)+�Rod�P?U�6�>�UB�A�X�FwO�BH	��G>�bu�+>�������[�wOb��M��q�ܿ^:���ND{�g &8s�˿����^���&�C���[O�&$[���88E '�(��g����i�ˮM�աO�I[H�I�;�W����`�~еY{�j-�*6T��,6�띺Z8��1�@����Y$�6����
xk�b�#6
��Xf�R@[fB[}�_�V:�Y8�r�e>�Q�4��6��@o�a�,��7���r��Kƽ6������2��ط��'�	��z�,�;lizq�� 	�1���=��+����݁�v��{� � U���VJ�|(���<S�F��� �+*3وbR�.�{�+ 	ߐ���y�*p �+�4�׽�x��>6� �Ձ��%��ݹҰ��MB���.�l<��+��u����#O%�E�I�����zՖ��^�p�vХ��ۧUy��(����'�F�G0m�	�W��6���{L�m�\��' lS��_-/Q�]���u�/���Ʃt���E1-���Ǽ����W����e)���؛�I���u7�1.=۵����>�(ޞ�����`.�{�kÊ�R�I���W~
!Y �L���-N�o4Y�\�@JW��H����e��W0�{/v�QѨ�n��g�!�+�Vd�Jjת��$w�:`̛�Np�@����)�-8�ܢv����UrG?�:8� �r苘M���YĬZ|���"��b}B�p��[�ӽ�"� �	���bQQ�A�Ā�La���\�}� A�Ht�D�<~k@�*}x�<���L�ܟ:@��h;������:<��b;�������L�:2P^����x}�P��������s�;��qD�	�PG�����	��k�(A_c@#�k���vm]�Q�`G`�o���p�\dj��Xu�(ux#��u����~��zH?�Ig$3�*�Ƶu4[�>��*F o�|#F0m���uު{ȈT)�1��j�N��+D��0s>	ݭ�:>l�t%*����ht;���"� B �Z�fϒM�X�QSǈ�I��$�%�+N�Q�����NBj[��'\\��hQ.W��[<	�I��C1����,9y��[��Q�$_��r�g1�.
Y��M�U��/.JoUξ�&����&��Ӽ��._T%j�_�/�*g���\3�f�nh7�ҍ�ѻo]���*P��R��3�k�:W����'�y��Tj�u��h�� �[4|�q����x��b�k�ȃĦ!Iq�aߜ�E^L$�W�CHJ�X�|%A�B|�W����}-Z���*�z�q�@���u\��[)��I �O�|��c'�)mZgn������"�ᔬb�Qtt^'�C>T�	��E\��.��rl�U&��A�Qd���S
�$����ھ
���n����N$@��m�2�%��N�͟n��[<t���u�Aى(ʇ(JTh�Y%��9�� �T��'�ǃ�Mq z$�ݒH�/�z���3AV������]�O	蕬xz;W<�x&��S%F��	���]y2'�+~�dN�g��N&�(��K`7WVZ%��e���j�d�U$�
��ó�)N ��~_X�.�~!-�����Ǥ���n�=^�",W��e��3AV��������+���$���)ԀJV��E@�_Ű�+O(������B�g��.���h=0�`���}�x���Se׷��SAX�\�I����,�% ;�Ĭ�K��sM�炬jՋ�(*��KRy�&�N�����n�Uj�>PK���F{��u�0���t����2�����p�=�+o}����]��Fp�>��zt�V=��!��OAo#r,vI�9�Ĺ�I*/M�|t�t6��������g�d4�'��P�w¿�r���qk~h�W��z�-q�=���7����C��+h�[|a�1�5��7�������c>����G����s=��K ��Ȁ�g�����|��`kѕ�;��~X� t  �SCU����qw�AK��G����A��(�\� :�E���W[�zw��k^d�V�T�9�ĝ�����
}�@;�
��"�BZA#>Sķ߯����t:)��@�@!'��D�"�L�O%+�1)��j�Ǌ�v�$�ʲBP�BeeID%Y�\'�,���2fPOu��}���"�@9�5҇�b���:
+$�U�Mx���2�&�G��Dʀr���`i���֖n���`q�f`Y �Z�`o�g`���u����qw���e&o]U���A��C�-8�'3��8T�Rvb&�����H��Ǌ	�P�(�@q_�@��S`��g�p�^P�,197(Y[]�~P���T� ��\�pkR�Hb� �: �6�-�6�-���-�.ܡf��z+���b����ъ�>��>R���>R^ɺ�Hy8�"�e \���z��͂��ي�H��4D*�@����"Y��`_ES�V���ƨe��
��Kih�Fy ��[i5�C���^��^ڸ����u5<�و��O�H��i<�*�p�)�OgN� ��3��3���Ogjt��%��Ը ���d�F����r��SIej��@?�x�ʃB�B��L1A�
��b���`���3�S^H�u��J*�m��R(W��ƖF?�-��Ҩ�Ķ�F;����4 �%�3��!/��!�zw��i��L �_�<H���P1���`}�)���.�͙g�(�������\�_������\t��E�V��N'������v�5�|����m�g�-O�W�{�լ(b��}uc�*ڿ�T!=�(~�3\/��VmW}3�M/���	�� H|)a��0�\�a���v)�\x��à����tS��+��~1-���?�=ɖ��lU,
�n${�V��78w��R���8�,��G��/�����L�R���{@���q�]2sAԃ��`�Iw<C���W~����)뱵��^�6���1���4��'�o^Nʅ�B��M��w�����m;�����eR���ɇ������/{��xW��W�|*��v��^m�qXu=�z���~/Z/\�/����>*��-�?G�b9��Lf|	�˨\R�_���̇䟹�os�q�[��b!^�ex5z����"�����	������?�4x�e�����]ɇ��x�?q���G��zp�b9��S���"x_�2ȩCq�m4-�x_�W��7XJ8S�X\ԭ(�6)h�^t�J�����^`�X��1*�+�m�s��b�ꈛ��4%�=���и\���f_�ޢ�{��fq?�+'Λ���#�q�66d������sY^�J���g���XT��LYiR���d��qʃ����S�������#~��U�o+F��Վ���Ar}7kl��F��k1�؀��ŋ���5J@��oaEW���d��N Dy�7�fг�Pňv:Q݃A��TcB݄A��Tc@݆A輇vBTesIT~iħ�x���d�
�_Z��E�_�c���Ui�֑*t���T��L[�X4�����F~��?�<O nF�T/�%ݔ-#��i�[e��xtURe����*�vx��j˂�X���#�b�jC����(z��,S�H	E5�)��F#^%S�1���(�H�+�im[g�s�?���ĺ4�T�+d||�8@�y�LGЏo{Y|#])��w����-�p�z��nv�X�Ū��:�F�YK��(�<iL(N举��$ڡr�:1O$��i�i�C'C�����x�ReCJ�"(q��AB����ݜ����V���6(��S��U�ц�KS�F-(Y�z�A%$t� �D�z?�kжU���h9,��Q�h/�o���~���h�      @     x�-�Q��C��Ƽ�ظ/���xax��R���5%�O�ݟ>�ߣ{������2��̛�?<�Ok<�c<ƿ���i��.z�f��S{�e�2b���C�!�{�=�RO�$v;���Nb'6b^�܎��^�^��!��,p]���ʑ�O~?�G�#��o���#�H���u*橘�b��y*ƙ7μq�3�g^ϼ�y=�zV�Y���*�Ͽ맛���i���ڣ����i�4�?���ߣC�8�y-=s�=�7�袓���X9V���sҿ����y����N}tӛ^��s����S������?r�;<:~�硋��~�9��~������/���ed�?�Ƈ9������M�7-nZN���r���.nZܴ�iq���M��7-7��iq���M���[�q������R�v����=�s�C��~�o��C7Ջ������;;;��b������r��p��M�W�ϱF��_�|����t���!�.:)/_k�n~���C?�����S?\�����o��j�ڭv��j�ڭv����o�����jo���[���V+�*�*�*�*��H��������īȫ̫Ыԫ�;�3E�d�)r�ș"g��9S��O͟�T� ���o^�������o���[�m��Gm�Fm�Fm��x(���x(���x���!x���!x���!x���!x���!x��\~_�o�����e��:�u�<�C�<�C�<�C�<�C�<�C�<�C�<�C�<�C|S�_���'�Ip�'�Ip�'�Ip�'�Ip�'�Ip�'�Ip�'�	LP�@!��ڪ�L��,������ݚ��o�/�>_�c�2N��S�)�q�8e�2N��SF(#��v�]`���jt5�]RRRR�X�X�X�X�X�X�X�XA]A]A]A]A]A]A]A]A]A]A]A]���S_L}����;_�|��Ŷ��m��n��m��N��n��햶[�ni��֯�������ٷ��nc����6D���}>���8š      =   �   x�}п�0����)������tq`���rB���D�����o~�\r.��hB�h�����<Z	Y;]:%������A]qK8v�8�����&L�H�0�=x\Z�a���x~�]�e�Z���;�a��u�Gmk�Sh#%�����jW���NJ��u��Z�Z�      l   �   x��α�0��Oq��6v��Ҥ��s�A�U�H��?t�	���ǉe�+1+��+��b�Q�I��@�� 4 
��-�	7c�aO���P���
d~�d��؂퉿!**�B��!'�	V�u�E1mT�m4�
����*ƛ�ߔ��9z�      F   }   x���A
�@E��)r��_'��,�lW]���h��Ea@D�>�R����&k���h߲�Φ��d=��˙�B����	�W���X\|?亦��]��==U�>x9{ڽ�r�mϨf��&"�UH�      H   �   x�u�=
A�:s
/������l#�,l���ETf��W�' 3� `d�'�'�F�����,�`p�n��hN���%��	�j�5�ju�3j�0�_���^�֣ll�C�\
�y{9�PGx,�\ϥ�7�T`�      3      x���K�-9nE�/G�HCR�{�T�Ͽi-�u��.P�x+O��EQ�(����8�W������?��������j���?K����ϯ����Gk��W��
��Wk����C�LBh%��;�$t�Zz
Г�*POB��C�Đ=�bȏr���L{'	�dEO��x�R�OV�"�y���!��hEx�'+w��;4�7ē���x���Z-;	��r���%	��Z���-Q�$�"jOB(�*E����"�RD���A(�*ED��J�"�RD���A(�)E�DM)"�PDS�� ���������'�h3	�6��"�NB(��:�v��st�w'8r�������7�$]��(�u���EL��s'�b��u��ƕQ+ט����v�>/�;犣�������P=K���&��Rje���ԁ:9
׏���ק~O1�%����LN���k�J
� 5��˯�Bp >��ɳ�3���l���a,9��a>��O�0�KN�gp���1�`Kxl)Ϡ�-u�܆��<���A0ָO՟���?�~Ԯ>ns��_Dm.���P�Ĝ���*��9
G s���0�9
W s*(�%U�71�9
g��$��j��A��(G!�y�Q��E\j4�g|;�un55���.\����W��a<G�d����|���}k~�e�gd�
5�T�ZY
����Q8T��Q��cݩNٍ����o���W9�d���,���[��g���RGV2a���3	å �1a��2~~8�}o'�;���� ���Q�A��燣��0��G=a��G=����"�"����p{f�AB�E8E�;oP��o��g�KA(�0\
B��R�KD-1�D�R�KD-Yҁ�Z
br��e��YwݟR'3欻�o��J|ue�����J|u��?P�A��(���$�^��(�����2��񎻅��5�I��{�`�b�^;��X��&)V0Ng�¥���P�r��$g���54I��31��^:��|=���u���]�I
�vv�®����OW)Y�hzGܘ��\����6wi&)��]�I
ks�f��ڔ�6�VW�j�}u��6,�u�ޣ�wt�Z��1)v�-t���*�§9B��.�`9����
����/��2m��
�:�4ת�"
c]��e��+�o� �U���2,>p�
��98�u@@͇���\�
����&Tru�
�{RuY�+CU7z� ��?����]�
�Gs6!���W���FC(���Se�!q�!g���)��9�5�&� �N,�r%)��C(b�)  \�"�".t��/���6�y�p�ː���n��D4��1�'~%�i�j�C#X�yj������r����K��5��qN_�Bן�+��
�&̂ߏ���l�~��._�Q-�����w�r �x���O�[����t>ŧyP�#&��
{?�;J �e��ɽ�K�ރ0���Ȉ�X��;j�x(��O������؛_=ʹD���L!ʹD���O���D��R~���K�z.�JN��t�
`o2;q���{�/�NnM�{�d|��NnM���<�������U�Q��v6rA����R��yF�-$5�DG{H���O�	�����D�jg�5�=o%3�]��r�R@�lf�}�Why��8˖k�Ծ���Q�\c- ��6N��k�6���z6α�45W���\�& �	7N`��W����_-����`���8Q���� Y�橢����n�*���WDE�]�~�*���0�A(b�+���i�B����f�h���>��Ϲύ����eT[�rNe�+�U���@9B-P������!SN�FP��O��`HkD��,��y���&�(Z����ὃf=���=�������.߬磋w���Y�G�4�nݬ�/��|���ko^��w�f=��  ��j��q����"���Q4�<Q06�������%��G	E��b�cE�` 4>�P�=��EHd|������BѦF\�j��b#,N����AT�Z�7�E;!AqJu�wBR@�_��5����y�����r����K�w9CA~�k�w�E�d��RP�N��8% �j���=M	��� ER�;�� W�P���"�|�3,��Ȉȿa8�P\�p���75�p���]�p�d_��Y��Q�� >�)�Yx�T��N��3�Qd����AK�>7�������$��s�?P���iIYg�9��4h�a稺�����HC@kZ����N��zT�M0_�p0�B��q��2@@�!\��L�g��Z�e�F���z�E��`J����`*����ug+�`3�Ȯ��f5ޣ��\�Y�=�� 2��Ԗ�H���a"�y�z9���=�� �p����,w]��%�+>��#@(�E ?��#B(�E��8B!�"�PDa.�PDQN[�""���]�"B�r�"B�����3����]�"B�r���%��y����}]�D���jr�w��A(�n59Eܭ&=�;�n59Eܭ&����� q7�W��;�C��B!�"�PD��*@�h�!)����W�>�p�!+���/��Q���(�K$r��dr>0���Ln G���Q�Ӓ�Pծ� ꐩVV���s�Zɶ������1u�K���Y�.�_zY_�`��񐲕2D�xHa>t����98�9��EQE�����.�k��g�'(���w8�.�8[U�Gg�fyiU�R��N�g�9u��|��n^ݣ�B
G�Q�h�`��Jo��'�ftj1�j4[F�rߢ2%��rߪ	9��mՄRT2oՄQX��UeJ񖭢�i���߲V��E�g/>Q�����
Co��	�0��
��
#�mh7��^a^a�6�v_~�Pɲ��
C��	�0��
��
C��	�0�PD�� 멤?��m�^|�TI~�bz���Q�/�9�	�?G1�T��(��Krs�US9�I�>G��i��Qhc*mP�M����FH����Rhc*m�ژJ!�6��FH����Rhc*m�ژJ!e�v�� _� ���6��W�['�U��*Q���|�d0ȷ��W�['C�ؑ�Adx��dZo�pe����jX��~��,Q�JG�����$
n�)�[a�A�$�n�9]�,q]շK�VU�L��w5vNAq����F�a�wNA9j@=Y��J	�5�Ԇ�Y�@�$�=6�������CP��p�;�q
j&�����)�#�#SbC�� ��՘����A��Q�Al=;O(�i�P�=���]Ln��]h/�PD�!х"BEt��B]("�PD��N������i����>3��V�nj��W����+G\�%G���b��
i�eŕ�,(;�mW���u3e�q�:����*�v�a�b�z�v:|������b�z�(����b�z�(����b-W�w{j[�Y=��	�P�hj4�/�z�mi�e�D���֙*�f���Po�b Po�b��a�b��a�b���2F�)�����"I?����ok|����6���BM�rH���f9��FS�R$��4�6���2m��IR��)���b�ϫ��O�q<�|��\e��,_��XZ,�Š��^��B�9����sK	�(��#o�dG�$x��}[��[�l��=�d)�Sj��n5�!��(j�Cʮ�J?�i�e)�F�Rfv	i�q��m,.������Qh76Ga7pcsv76Ga7pcs�ٍ�{a7pcs�X���n,=_��s��.��6pcs��)z������=E�r@ٞ2�ژz�=�"YU�P�u=�z��#هk�:ѯ��NS�jӷZ�׳�R��"��T�Z@�]�j�G��8�ѰO�,�)�"K�7B�=��?rQ���"��Qi�c����.��Q�v�o���Nƺ�r��U;֚鞐-��r�Q�(R�9
�r�Q�(�K��F�\r6��k�B$Os� y����P�������f9���P�Rhc�Y)� F  1�,�ژj�C
mL5�!e�ד���T�)ӆ�-z~ݮǠ�)Q�]��E�%��[��Ƚ����e�V#���L����3�_ѭ/�������gPh:�����)����&\A"�������)׉f_���s�}�/v}ɹ���j�K�=D}�З�{��J��E��r��=�hO}3���ةoFwP�OvN}5z@����Fw������[I�;À�>����m�M}�#�x��>�R�WS��)����qDשڅw+�p��]��B�U���|U�mR�WU�&!�|U�mR�WU�&!�|5�mRX&.�Q����M�>Lz�J)7�٧?�Qwօ���{csU�����C�n�Sw�G]�ĺ���*:%����:P���_(�p�z����پ"]���Z���%�!�*�Ffp\8�]
�+�����(�/��G��O���ފ����}#�O>���C<E
K)7�Yfm-�-Ј�P�V�5�z�{�S�VXF��l)�}�w��p4��[!ew� ���cMk��$��\7=���'�`7����"���6�I�e�-�j�m�V|�?������η0�      x   0  x���M�T1��=�Aω��Kp�� �Ab,�=�{*�5(�%�����J%��Vnv�,J����o?~�=�>n�_���6[9$� 瓜s6������	��@��� �$�A���j�$dԡO��t�S��1;�S��<5do��J�}��"!�Kyz�����:.�PǛX�:�Uo��C���fPǥ:�T�>{��� (->&H�� )�9�R�|@i�Y@�vQ�-X {�tT��h6�����/zC�*噐��ρ:��u�������h�G���)��:d�����q����/*BW������|6�܃���}M�T`
���}6��������DEW` l�7(#��0HC�=i��{�Ho�A��0h�J�6��ad*�q%�AW����6ڸ�M�6����hC�޶����~��䌂�����'X(��3@m9��iA��p����5:|҂���B�ΓN��`�i��vP�I:�RE\9�P`���u��6-�(M�`��9yKA��R0���rP�KA��.])�2���
l�5�ߝ%'���z8��ޠ[+�&%�;w�[.h��>��pS��LA�S�RfNA����nŲ�z�X��wq��e��ऋ?�.���r��z��	Ɏ�J�#ى���ŵ�N�F3G���P!�AI'��"�"Q���\�U��2V���Y��S{p��c��Z�{�z����:pڤ�.k�Q1+�^�\�7�(S�`��2�J�4W&��^����{�Q�M�)˦�RE�<�f�����|�S��0��/�y{{�2#�q      t   �  x���[�%)D�o-f���M�
f����+M;����0�Z�X�����>w�������}�!�̈���3é2�*��*�hѩ��T��<T�r�7U6��^T�%Q��	�ʭ�RkTy�}n��*�HU�-���<:U��Ǡ�&&U4qS��UL��UL�ۮ2ʳs�2��2��##|��H��X��2��<��1X����I�����JS�lU4��kW�m�?�L���c��:��6ܿ�\Ԇ�c�L����f����4w��Ad[ױ���B�c�*�߱���?���l����ޱ�a��E�������Hׂ��1�����.#dU�Cd_ШTy���v8U6�����*�ߥ����Lׂ�����e`� JBL̿�t-�{WG���.���c�L������]91��o"�>&�w���<�'��č���1uc������o"ݘ�?�������7�ǟ7���S@��O����b���Љ!6�V*W�@�z��9pf"	��"
��r��3q�(E��0$)dBӥ
���rb����H���RȆ#C:lF�"���B@"b3y)##���2B��M�FNt��#CRt�ň�.M^��8!D�	!+�+�@*QqBH��}��0�\N7�Ṱ)�;�	��pBH�C�TB�8qBȈ���D�	!!N	ѵ���8!��	!���'�t8 �t8�+�p8!d�	!��t#N�pBH��=�H�B2��ahOw�ᄐ'd_��vVv-���ۋ�.�eu~Ii�.��o(�+�e����I�,e}����G� �Wto��G�l)�#��M�|�k��o�!������.���~�O�2P7����V��@]��ԍ�m��u�m��r�T��D]��Nԍ']:݉��b��n<����/�T�����S��N���t��ȞnY�k �#W�:��Բvn#�
͑"���B��m��@\�1�k��4���n������r�n=Luu��.��>��ۅ���cW�A]��څ�.յu]�=�B]�]M�Pץ�v���o�֫��� �F��W[��_O֣����1�Q*����7[���#D�m��ڷݟe��[����B�Q\���]t3ԭ�f��q壠n����n�����y�#��}$V���Gi��l��F���N���y��2��q�ӭ����PE]ݙ�����]�Z>����T��}��K���	D^�m	��*/��L��+�9ӭ�2k��Hc�U>-��ӕ�Bk�t��흮V��n����t����V�3]��v��Z��t]>�m0]��w�Z��NW�;��ju�;]��|���]wL���Rî;��u���ӿ��i �<ZwL�����>���{��Sj�1��ϣU޿��) Mfݍ�q壠nՉy�nէ����}d7�>�o���#�Q7�u�(7HUH�PW�G�B]���u]�[/ԍ{]>
�<�녺q�ː�����XQ�T      r   O  x����N1D��Ǡ�q�'��k�h�耂�g�'�nw,]i͎�/����4K_��󣈖���m��'WL�Z�v�QA�}��BQ�6�+eߩ7$z����/o��Eξ����]��{P&z�հ�V�u��d{kg���j�������k3h�;�ҚAv���C0ZH6�.`v�u�:=Yc ,��~���Ǫ�``+Z �k���*���!�`�8����v����}K0H�����	�:N�:Y8N�z��i�z��uf�Z�j� ��`�Ӣh�sT��HDP#[�?O5j�߹�E��bna��\E��p{ڶ��㲔      ^      x������ � �      \      x������ � �      Z      x��][s�8�~��
ξ�*�%R�|y�nf&O��8U[5�/�E[0/Rx�)�ן�H�$H�2#S��J)�M�u7}�q����y�G�>K}Y|�Vlfo�����3{z6u-{~m;��\�����,�ؗ�c�,WY����	O�`֎E�ֽ�X2����k��1Oyrn�y�,f���B�[� I��O���֒��"f����Z�8K���'[���k��)\���|O���R/^-[+�YrF�ю�W�-,۽v���ed��s����EZx� ߀n ��D��1K��
��1p����%�L��D���L0�y�	�q]"��
�)o����`Lqs_9I��w!��2GiL��?'�Y5�?��� 
��΋*ytni��H}�l��hn����l�\��w�6D�D0)� T4yU2�%Ǭ�9�Lɳ����+ߘ*~b��z�Ei�k��V��n����O�=q�,�x	���`�� >eƢq���9��uߴ&�����m�g!�:07fȍK��?X��HU۔��|�Ux�+ ����0�9G�W(��6��u��͇˷ƪ��HS@z�fQr��O,y�aP��b>n��,���ci�K�@�䖷lo�~�b彶9-�CB_d���G���@����]-	L�*-��%{�l@V������/����"�+��Y����}�2tYzcf���@��́.Nq�aNN�bZ5�Z�?���V#�'0' 
��۔���,�	�a�`\��G�@��3��=��� 1q_h7�{����Zc.��X��X��P��7�D�%�O0F\��-�c�Ģ'�O�U�b�f䀛m�Jq�'�숅 6���&�AS�n���a4����"՘�	G��-.)f ?��e8���nkm�G�;��~���Ox�c��-�hY?�n{���,�C�9�^ShMT�g��'�m�룸╤��:\y��S��]���W1`� ��e���oa1�������g�Χ�ۀG&��~n}�C�O���AÌF1����[�A6`Ho���Y�6����)�c_;�nVAg#��)�3�� ���`��v���7��!8�T��eI�G-�nq2輈?��s�ũ��Y�Xr�vy*�ނ��{h���:t���A����ɀ/D�To w���S��6����v��d\�[ ����N�A��~�aP0mgOO�C���������r��lJ�9�;��m>����N�C��x��ѝ���x���ѝ��·ip��'��|Mz`C�>�3���f�l�d|��,�}�d|��<6��.�E�O�E�)x�sStΕ�l
U�#�����g~���sʗyC���,��zzV�8�ϭOX�X���~�G 1`Af�OXD<H֛ � ���2�j�v��*�켛�����q� ��T�^ĆFC���{dw�F#���Eb�,��
G<:��)���`XX0��Q] ����xu��GF�@PSQ(��p�Z}�]�.":LK/K2dŰ)���G�%'�*�o�ԑ�c�G��utъx��X^ǒ;��Q$��r�T�����o�;p:�l�h"�w	"�@\�d��ZAg�i���;�r*��k��ڹ���}�|c��������04�5�
5�:"�uJ�D)u	��=�ۧ�����/K^2GH@�%�1UqH'�h~��Z���kԐѡ�zU��R䮋��R|�bdq{����b����KN�Da���V	W�)�|]�d	����Rl����֋�'�VU%5�5�#�� 6�/��,�|u#i�ԥ��^�:��pp���R�P�!�d�D;xT��������(�v�M�ܽ��
q��j�92�Mp��k�B)��h��k�S�l옘�XR6J��ӯJӎ�&�ٛ�iSh㳘�P6��{�)�Ij�_w�$������UQ�v)�	9 lF@>]ƌDG�?=?k�hȧ��v��#�F�dnN	+�a�	�M�:��IX�l�v�7�L
�b��$�� z�ҙ:fOJ�V�BtB�I��倁	%9~�t鳰B��c�r�,KmP�6����4<�Rw_�~Hnf�-���+R�:�7�F��
�];�}�׺H�*��_�lv�pg��$�Ṣ{{j�t:�Q��x̦��Q]��)����N�ydl1Q�����
�*tE�[$ul��Ĉ��Ne3[m"/���qi��wk�
O��/�c9J���z$��A�����$�q�l�j���.��wa�j���3��=җ�$x�5�{╒���/c6pTBC�2S%���xX`4��q��F�ς�{i������\ħ$�n=�h{�c�W����Lɂ�ɡ���`4�с] 0%��8��%�rT|��|��;:�+�P��_=	K�xl`�0��w^�nP-C�����7��[�h�xl�܅<����i%�V����r2'�\Er��,�pW��l��ӱ�o��S<�Ag꧹&",��	�r��x�D��j8)�a0���CϜi�ķ���L�+��w����Xƾ����*N�g�̿�i�#��%ƛ�����A�K�����d���'��S�tj�8T)k�C�B����<I*���SN5_�t��/�xm�螳���X򬛦vSʆӑu�����#5��g:j7�������2����("����@Lg��䑱��H�n)%2Dh�
Y�����׾��HƜ�`ҙ��R<�u �W�W�9L�V*rxR`���e%-l%��R��m(s)�+S�9U�@c�cF����Fm:�����k:��d���X�:K2z�����	;�i���Z��~E�:�!��¬p�M4�4p�aA-QVOޒv蓷uJV���������G<���M-��w����V]��rݠ4g�'*F��Zm]��B�J4����'����BLNf����=^�f��l�4.�vےC�&�Z�ؕčy�]��T���fe=m�▉�fal�0��`�n���V=)[σ6h�D�7�����K�UW�y�R��z��ӷ@)��[܄�?��	��.�IwA`�]�19�qW���t���3�Ã}��0fOyd�gceʶ���5ԑ��U��̲�H�+����񳤩�VC��ڝ_ϫtQ��b|t]��]gt�r��0uF�/+R�|6>��k>>�fH��k�t�P�\��b|t-�����u�t]��.�;u���==x\ta)�u�gW�����B{������?k+��[����>���*k�z#ʈx������LC5�il�4�Z��ߵ��(>3.��o�,�>��RpCM�D�Ֆ�IU���|?���/��;��|���S��o�ځM�u���)_'�������w�ܕ���7m��i��g���p� ���1E���m����6���ddw|���b|���b|���bt�(>}�Oq��1�+�m���z��[|�K�M��Y뛷���9Qޖ�K}	�4��G߭
������!N<���/�nÒzscɜ�%�-������'���/j�}�e��L����ZQ{����Г�*��wV��m�X�Y�l>�CV_��z7�CV:�`ʎJ��/����Q��=m4<�M���FY+���J��zih�ۃ���K��7�)��ۛ-��9�-���:�bbо��?����Cm�uIA�Q��-�[�U"�#ѵ�u�tR&{%:�����
�H���_j��ֺN/"X�F
c1:ߛ�{5��]'��ftKz�f���r7�������ގ�ݎ��|W?�����]'D�����
�/��[?�{5��b�k��JFdk�@��u?��vN���MH��&���ִ��l�b��O�g履�{<EsM��Q?tG�7��zM��$G�9���{Ծ�X�Y���l|�y�7���W>j9�g�1��{Z�<�L)�+��gŻ�K����\[%n���*~N��Mv=s�������t�Q�'�/S��k̚�*����uS��DO�O` �Vi��G:�Z�.�c_p��� F  ������@o��z�y:+�4�9��uâGŏa�o�^b`�^�,�Z	z�9���!�|C�F�J%0Nы��P�iP����@n��^S�V�$���G�l���$��/z���aq�1�<�+��$ VU��Y�!�7�N,K�ߚ�oߌ4N5-�3�k��2�U�ue��M�T9&�^�q�(A]��gO�?4�1]|_1�2�`Ҽ��0'��Z���f'謪���?��C���5����N�(臡��9�뮨"�l����<ķ��AR+�V��k)���6��}%�R�E�0w(ȕر�
b͙�oM��? [ymk}_,G	�,�6����2���� 4�B��s�U�����^U��O���\\��A4�pB1L��x���@WeSf.|�3�.o�F��7a�Le�	L�1o!�ՔԞ@��5U�e�e_�Yla}}.�R���ڭ���ɤ*�r�2�V����m������cMuO�ľ�Dy�D��S�/��������b�C�˷^�tDn�[r�':�n�r�a6M9��ۦלQ��g�^�c�t��׫�]���"&�.^�&�Y���,v�W�z#bHg�"�.��!͙�1����0��c?��d�U�OT]�j�S����7�Ĩ���Va�$#�q���.��)�!qk�H"�9�1�(�����n���ˇ���3j�&?��́uf�Z��R�Q�����L��!�|?�;�u;���,�H�*h7ϱNcs;�ؐ�ØQjp#��3n���~e��K�����W&&�^�AN�6�%����mt�s�bDG����LX��LNc���+����"�`l�:�ǿ�3#6�ݲ@9���)��sz8
8o$�D~�{�0w��&� ��N�Uׯ�_�������t��͑[����ל�}Qa�W@�4rz��L���ɽ����;�>x��F
�4���ZAҜQ��#]>*�fmO�Dq�wE�q��ˆwvjk�1g�-��춈<�BDόU�Y4�	���o���h�z��r})Z͙���#�!C�)�NUI]�a�����h�Ƃ�e������<��.��B�����P9��{nh��͜�`h�\҃"v�WM���v�'�($~�������FTFTwl	��=�� ��W6ew��xhǫƘbsվ�k:��z�=�]�5�fyE���l��#ǯI���t�}M�����k�7�k:���&}�4������I���u~M�H�h��>�n:�}���Mg#�ϸ��k��v�Yǣ!^�>�?f���8��l���7���>�c����g|��t>^��Ou�v=��5��c��ָ�����z�����~�]Cq�      7   �  x���ۑ!��!�M`] ī�p����.�$�U��{J��s�U:��U������(S����+���*Y���+�=	꟢��Dj�$#�����O2�|"����@�R�~�y�q�T��p�5�T����D�(�ە��b�b]�4�b�D�)��UU�@4ӏ�c�+�G��w�������]��˱�ݪ��Z�c�S�1N���E�n�\Q��Z�n�I��Hu��/�eB��u$z�&��s�B��{O$�}K�^���K^����;��x�i��QN�,MPow���ڙ(��('��YiG���E��('R�����o;�_��b2�o���F�ʲ]͎��-;��Y��Ð)f�|�j��˓���HLq�ƕ�&���f:���GOh�������q�Y�`Ps�ke����)�Ĳ�7w��X��!d�'��&%�M�RC	�CyޤeM䟊?bB��
�F��!� ]3u?��d x�hܢ������[��z����j�)��I��Ë9�h�B�I��c�c5/nJ���?VSg��c��Aqe�~Y���ғ��b\��Ң$�+�Cp�r�k�$�W�[���WY�0��T!֎�&�J"���$N�K�&��&&���c[�D�p�Dҗ����=�H�Pѷ�[E�r1�$��B��O"���
��uNǘ�B:Ȍ�x֣5�^mW�EId�d�4e��g�[�yѶ�;�����$6}^�;��ĦW�&��b�Il��ZZ9�H�k
�Cޛ>��H��)�����j�%G�rJb5O&���*6	�ˊ����
�|�6��P�)�ح��z&B�-�B�PO �x�1�9h���F�߶oRt׋�����uK�7�j^�������n�bZX_S?�L���z�Ɔ�M���+�(3,��7!+�1�"�z7�/2s$R6�l��T��U�&�6�Fe�Y�_�e�Y�&Ĵ��`�5=,31vFTf j�X���Apѷ-!%* 6g#!�!8�!-L��HH�SCz3�Ԑכ������:Ng6{ ����Q�E2Iǉ��!��;��BjXfl�2��l����(�m��}u��zn�UC���7D1s��i��6k��yu�����&��S���W1ϝn~o�@�A��	���;�.�u�ٿޗjSu�Jb˼\�xf���
6��~�c�����lK��&ۗz]�QD^���~a���WJ��MH�            x���ɲ�J�.�v�)v�tOnJ�f�R  ��N�5�����
bH�\���e����e�[���=`^���s��������s�˞�P����f�ntڍ�����N�ƹ�L�x��TK�ۚ&��Θ�g(���T��2����/���ec4��Cs��S�Ok�04Uc��Бn�۵s�Uv�L�Ʋ����z��J�������l�_0L1�����2����Xoc��U[N�鱾LG_�f��7�������0_u��~��$�7�LGW�����?���S�$�
�
_������iW��m�^r��S5�Z�j�;\��z�욻�����eZ��sM����C�pP~q��}ۧ��,�v�r��zp�o�c4�^���w7��a��/�������D���|6���Gs:b�qۨ�&-��h�[?��z�t�lR�q������k�'���O��W]�v��p�rs5�:7W�������Q:�\�����ڭU?��:KA:�M�<�M[�_���A��k�������kk�����^��iط���4ߦ�z��4EskS����/��3�_��cњ��m]��;��uq2�;�����n���J�:����,����h�?�p���a�MTW�a}���*\�*{sf����t��������/�*�%�~�	�u�ޞ�G3���Ő��%�s&{�{k���8?�R�?M�u$�|��n;�����+,M������B�,,�U�c�5�
����B}^�"$�:��8�>�sJL��¿�Z�f�F��%%{�ƾ�'����e���p����h9�<=���ϓ��_ZI�J�p��ȃ�Y�y�O'��Y8�b�"y��߯t�o�+��w�}j�!��?��y(�pL�ǌǽ0��Z+̺5����`��1�M���gv�`���[����
�������c�����3[�,hjN����1ɓb�q�0/�m Fc�b������1�H��q�3��]8Vh��q,�����ټ�Q0�f�W�Ϲ�YJY�u ?����a"*�tτŁw?$�ߟ�$�7�Եǂ	k�ڏg���s��!���e�㐌��4Q=���%� V��cv`H�-���s~�.����x]g
�����������cuO~ϣ��14yp�e!�����q'$|L��#��IO��4�~UL���9���/Э��,�v�4�-!�~8��B�������_���'��)/r������沵I������|]E�o)*��Hv��8���M�̕t��i��Ƚ��G�=`�k�Y.�yz�����C�Us�_�n�2�T�?�>�-����<��w�ǁ�莇���2?��i���/.+�p��z�_��ir�g�������귻}^��G���hUɻX�kG��ڂp�5�sZ���%��p���2�`k�(�O�u�uJsT�ϗ��ϩ�����-~�'�w'�}ryS���������O}M2�A�_1��]�F�p����$t���eR�vFU�߅�8��4Ն��=h\��,y��1vO���q�/'�g�m���������Ϗ��fO�a0�5�Q;i�\�?_�4�#ܬ
�����E�t��a{ѧyi�>j�f?n�U�Mk�G�7�m��Z���hYh�����x�{S�����������/��&s.tW����VQ�dm����$�w�c�ۉC���̨��M���cAjT~�W������Ƹ�z�5�Sr���t�������r2.�1vz�N��?~A?�\�p�-D���e
����I>�N��iʪ�e�荢S�O��U�'���K*4��[���"���x����x�Ty\w���lν]�g6�m5��\����{�7�[���j.R�u��Hk�Bm�	�I���H�8����"��*��ب�Hk�B�ځ8�K�޸��֑߮S֙�l̲ѶB#���	-�uέ[��W�l�fĆy0���}������l����o��]՗�@5�c��܌�Z�����n�phl��;mcY�CÚ��K#V�L5�:�7��*X:i5��}��u�3M�Vw��$�\��^���;V۾W��V3���(��smOn�ǧ��u��2�	��Wh�)��h������wg�&��]��h�t6��T�����bڒ��sȜ��*n�:�P����d�5��
�4�Z}�K[�ڸ�U�`�u���%[��U�� �\��;m
kϤ܅��.h�]-���7�	����
�4|C�ߦp�NKg�ɇ��|7,~�ʦ���dw+�l�Oh������z����Xe6ɭ��E+��W���	G/Ű&����"�^��ա7]�v�L�*�l�OhO��dG����m8�Y�l\��c
�i6�'4��c�5Յ������\*^냺��ԗ�����;�s��å�n�h�9��@?�B���ۮ0H��7��rZқ�-�5���h���iF��5VX����<��i��M�?y��I֭����M����y�g_X�m=T~M��P�íl�u�'���l�:LT܏�My��������]���/ ��(hؚ=�^㼞��	}�� ��u����������=Y�¶��m����Rs��O3�p���~�U8��Z({����5;*z�P�٦?�K��E��pHS�7���`�-%d��h0�D�[7^)��R�&i��'���w��dZ�_���H���0���4��U�C���	�ӏ�py���j1Ϸ�S�y�to���Zᐦ�B�E����ư�i['ڑ��ru�u6i��'4���v�a��Hj��9>ԃ���T8��Z,{�q�޵�oo�L�Fڭi{;�թ=�ϭ
�4UC�g&����7Xaw�Qg�g��M��{��l-��Ѯ�y|n��?fԖ(ͬh�z��U?T�
�4��-(KiM��p�^���&����m�9�i6�'��̝�b�dQ�r2݆��dϙ���pB�~�����ڃV��p�z���#�c)2�l/�Z�ԃD[o]�V~���	��b����������rngu���v��ut��Öl����l��7|�oO��WJ6����Z��r[�zM�s�Bii�*��B����'RV�k�ܴ����S�;���"����" Ǿ~9��X��kީ�o��vzEV=�}{�5�i�T����p\k�V��'	��5���0�����ª�?;9�����E?%�Y��:�kT��'���:F���V4���r�U���܉|��q���3D-{���p��c��V�eF��Uc�80�j�i��*���?�Ҥ5������w˽�3�2&�������ǚ*
���*՟��?\+��G��8����.b��T���#$��k�̙i*f�����G�*��w��ө�8�Y�J�g��O��b�q���o:��L+՟�w���N�d7|��&|����@��l���0z2��Sal����U�?�^x�Y�*��ևd�q��Xo�Ow!gT�?���j�d�N���ko�su�;�9T�X�s�PD��gK��W\�g�I�L��u���)���L3�*N�b�ˏ�,w�]��"��p�et���-ּ�o���*?[M�.]8��2︞�?N�ZN<%RE8881\��SXZ$��#E����,���0+N
�g����cwˊ���Ź���')��9�tt�]�1�QoD������T��K��d=|�_�Օw;�fY�Ҹ��_g�˄ف�ѴW���)���x�ydBu��fӬWD�0.���59U�}��c��bM����1L��~�ҽ�I�IFִ��	�M�k�]���ӽ��cl�Ҥw�˙����ZE��_.�xM�y�D��3����+�Oob��7$״��c��;���V~��{��I�dߛ��J�U�)l�k����p˒�}�k�LꇽD�+?�����o��gjqj�~xO���^z���Z��c���<,y��o�xޭ��c���]���p�4�z׸�/�8a*���?i�p��%Lo��%[�6+5�T1Ɛ̦�qd.Z4jmV�5��S1�!���h�sUY�ASs�Ji�*�45�	�-}���O���VjHS8�4%���t�k�:��Zp���b�    -�3��eDg>�Y3n��Ji�*�|i&��:�=1V&\����Ŝ���X&��z�!�+4���OR5�c�3�Ʀ�� )��1�$��ǡ�F�cO�w�lw�.�D���;gΝ-q*�|�AJa�pL2U��a��Z=q9`oBxR��^[�p�����<Aկ`���ck��MdD�>v�lk���i��8:�x?�jj@)��8���5~Xi�ī�A
�M�-�̏�cpq{���x��+�5zǘ��8Q��p[��[�O�%��86y�h�a�|���G��T)G����&u���&'(���P.�4����5�����Ƙ�A���8�|�TCaҰ�is�@.���K��1�M��hٝB���9�?�����rϱ!�-n������R�q��5���?z�$�y�g�������f��}'|َ���7�q�1BU'�/Z�A��b�����w�j���df�*��6K�Y�	�-Jw�ޮ��$.�@
���y�k��Hk��h���Z8K��y�aŝ��~�����?i�7����K�G��m�fW� � .���#%��u_K��a� .�4���k�8rfK��T@��%+�8MJ[�z����|���L����CMft _Vj0H),�I~�I��Ι��6�׫}� �p	'n��3��5��FBM�-[��M�O��5��v\���iI��[�}�1 nd�]s��{eoG�9h���Xӄc�y�V���o��R�h4�9-����L��r+?���#��׃��sbR6
'��	<HQ,�5��|hxK8���P@����l�+�j̆��\�0X���'�����!���V��g;�R"{ȃ�%�I�9�R�a�H�>8C��SgӟT�����Z�X�~.)r�޸8��e-¯��{1���Z�x��u��V�����AJ�LK>3�1U�����&���7���y�r�������h�ҸD���s��8Ó�t�0k�lS�1���[� N�1wL���|�[y��|u�k���v�O]�N�i|?2�;�n6��L��88)\��H���"���}��fG'��8���>�(��y�]*����F�B��\�h�Ʋ��,;6A��%]2�̶-&��2p���dO����fݯ
#^�3��|A�@V����GN8����n/����e�.&����$�'�:݂'�K46\8p�`k�)Vk*�F�Ώ�{җ�(�0�]�3�λI�!���H�Y����F�D�On��)��=����`��"P*,�~�1���W�|V8`e���4p��J��M���N�?�:�������s�նc��������+9u��Xu>bVi}�`.�D��|�F�;7c����H�M�����}z����k�,���a-��.�-�=��} GS��$˓�σ�ˮo��-��)�K8��?&tR4@On�XK�$ہ����%�Q�J8����y�m���%��!=k�	Ǯo�ݬ�i�}��_���$�����ԅI����?iT����`F�$'Gg�Rc��6�hvˋ=g�Kdd�����X�R1��Q��^�w��4Hq\�iJ��U�Wl�k=��n��,.�hN�x�C4|2<��~s�Rkl��zX���f#�V[G��A�����q�6��bO��'���G�>ε���rp�� ����yR6@,AK?l4��������_z���-T�9�����?�{�g��FRS�>D�m��%��ٗ��U�!9���9��r�lm�7��x�t<��<^���]���OZ��Hc��Z��<m���OM���.�F��mڼ�I�j�f)�z4͂�c���l������Vt:v��](͉��l����k��ɟg_��W5d-J8��;;{��`�����Hz]ǹF�m�Н�R��H��F~��#G2�K�V��
�ҀWn1%G��P�A̺:CoA���Y��)�>�J����!�*G�8��в�s����y�K>V*�`?�S� 4Ha\�1���bҲ�',HY\l��y2�w{l.{��:X�)�K4��?�g��$��J
�,.��'n���}���qW?x���)�[U�ǚ��^	�{ڑ5�3!��R{�>ԙ/s�8ӦRme�.�7=�����Ĺg`�O��S�Q�A��+�x�;�Lx�k��ٴ�L.�<_Z�5=���u����e��x����{8n��?�A
�ߪG�c�${���\5��q��o�p�2���?�eM
�g~
��R$c����!�e��NC8H�\��JGf��zu�h׀��ŔG#=�T[Z�[��EvP�b�Lb=_|Ͳi]��%�x� �p�&P�W
�����mM�PaP���O��cR��;F�"~�\�J^9&��{ϐ���+��G4H1\�i~X��3�mԮf3����i�������fk�\�CE�W!�M�K?��?O�"��eW�f_�@J�b��[����9�·��;;)�+a����N��B�v ���Ř�)?��輄u�w*զ�h���XcH�'f��-���c� Eq1�X��u:�;h<k�#�~��
�҅W
jfo�w͌u��l%��A
�M^�O4MNmL��t� Rkl	BG5� �
f��8�b !%�o���������o��X�  ���Ş�'���1t�����hkڰ�@��+Ÿ��(ѻ&6X9l�3h��X����I�t]'�G�p�H.��;�<Ju7~�AJ�b�/Yݏ#�X��Uqys��Id�Z��X״����kV�z%<.��;�f�R���Jعs����_V+hΒ88y\�ѳ��scJ��b�4�QN$����c�"��`���6`�B��+�X:,J�f������IN��|Su���;��{5�HF��+�xa��^��r�)Fф�<8���VX{�M�����p�'�����N(�p�{��~#L�nn����+<�T.Ѩ���]�5F���\.�de���h]�ѕI*JO^��i:�Ӊ�9��UV}o�ξ���������T�n�8�؄�J_����_Ǿ.K�g������Cv��r�x�ڸ�p;:=@,�4��������T��#x�b�ؓo�C0���9�w��(z��lS��\���!u�֭��L.��V􎉹륾����B������g�?�0��r4��t�L.�i�1/k����f��[f�V��RMV���=I�ֲ����P�AJ��!��$�sŞԯ�j�NF�����.��d��A
�bMh����i��v8��=4Hq\��T#ʊ��=b�Y0��k��A�ア�K	f
�>��޼rL����|Լ�ok/��de-�+LH�\b���}�	G��g��=ҰPFi�+�8�����rp�Jr>��y4H�\��"I��d�.��f�e\aP���=C�>4���o��A�������<�2'	�-h�R�����Wc'��KFaR�;���=�̳q�|ވ��Yv�av� er	&6ɳ���_ċt  �P.钗��� ����-`�Ҡ���,�!��aS)��_ڠA��b�aZ�W���6��2u�� rA}�5_��#3T���� )��0���L^�Л�V����
�ҞW�y���=7�醮f-���C���<K����F&UE-R�Y�Q3D45:8l�-��;���RM;�nw>����G��0C�����z�NV���zЬG�]7v����07���NUz03�=� �q&v�`���"_ΰ>F��+���e`�k���L)��1ҽ��]�Қ���̚(z�h�ם^���Β���'� ��k�!�0���c� ����0&��}hj�mA�#:�����r�#?�ڙ����F��6i��A�������b��6F�5q����¸���۪�C���b�n8HY\̑%9z�x�i�EcvR[Ԭ8�����U������,.�m���n�ƻ�glW���~�0.�<J͘����w�lw	�,.Ä�*z�i����o~�0H�y%�櫧�fl���|�� ��Ř�Ez�O���_�>�0.�d���qt��crm��9�����J    4N���;fk\���p�	`�����|H��ƴUS�@���lAq�9�]/9,�-��s�~N8!\��,�.�wM�[	��ŏ!����J�s���Umt^wG��N��|�l�OB�:�\7ٙ�I��h�c>wW" ު7VcO��%���d�ە~�ܛuTk$ '�K@�����ó��ֲ�N�]��q�G=�S�5�0�i#@����G'�"w#���G��	�O���nY�umt46A�5�\��ǡ駍�6̤��)�b���:�c�V�aU���[k\a����4�{l^$d.���6�A�Us�紏�D�n�KK�s�h�~Ue��r�`���`Rw��'U�ўu�q�Յ>a7;OH˜L��n��ě��iT�6/zOү�Xt_�?��9���:��p�;EB�{uK���Gv1TV<H��7���E2KO�AZ�{�-��E�F8�Xi<7�� �[�h%T��3���?��> ��N1(ߐ�`��J[nn#X���L�m��yl�.�~�R*T
�Xl�?�������907L�HW%"�3�<�Q.���B�#=����֦HMWe3�?0u-�OZU� s	����(�k���V88[�+�R6��:0{}�cu�͝I��wU�q�g�tD�e�i�A���6+\�MK�������v�'5dǩ�H�W%&�м�����+t�~pN�uwsR�U�F{�B0������aH�W%���_����u�>`���s�Y����Z��$70H�\�1=?z.wȇ�9nD{�j�)��5_~P��5?��m���A��:!��f��F�x�͝S4Hq\�����,��
m��b��L-;UHy\̱!u�ش[� ������� ��� RC47�=_+�t�TX���M����c"���[w��A��o0��W����f�S��8E�b�sج>G�>�y6�ɺ��A
�2��&"����v���=,Hy\fy���4Z�tX"�Z�`|��������M�雾 �4.�������N?k,G�Z�J4��ڇ�:OF�UX� �Z�h$9�t��qᬼ6ǋ�^s�,.�b��%M?4����D{�7��H�Ve���b��B�L�:Ө�r�A��b���"�h<?_Y�΀)��5�WY�\�=���}0H9\�1���k�i2��W�3���0]�ò��2�v�#X�r��J��v��?��f2�l�K�������2$��!�SW�o��r ���\U�	՚Ĳ������m�`A��bK��m�3�71}�n=� p	&�gS�?�=�5ZJ�p���XU�y�ؑ
���0j���RklɊ>0��<��]�����-(ʁ1��i��z�H��v�O��9p�B�����T(m����W��������0
;�
<HY�7����f�p'��ZU����o�Ѵ�jѪר�jFJ�b��W/�s�Kw���4��D2WP� c��_#�r�)���c��.�u�N�N,�p.ae�|�9�l��4u�[����z��0�)�Ϗr�촲�� :�mR�U�'��ׇ�sM�,z�Л��8R�U�F��gCѨ+i���UNN6�i�'�҆kf�^�p+�&���F'��vE��ӶuN6�pT���$.�mX�l��_A���e�y<�'�!o��j���-R�U)�k!��\��[ET��8R,�X�ז�DӷR'Qe~
74H]V�����å�u�6�D 5Y�aL[��1�b\;��}t��0�ЬW֐o�G��bni���J4��*��+�}B��I39�)�K,�"3��V��h
w3H�U%+����m��˓�ո�)��5��=ˏ��6�.��� �f����4�j~��,wճ��j���+�a�����3���ݍY� q�ǑT�����Z-vq� Rk���O__k��ʷ
��eU��`�z�,&Ι�9A�)��,��wD̭�����m� Eq���>����N���G{�$�&����r Ƽ�{����u&��R&sb�|n���TtU��ذ9� er�FR���Կ��ԼJu
4H�\��?eO4���M��MA���%/�����D$\�� ��SDH�\&��SD@�x�����K �`.�����k�߯�$1�pHW\A-��Q&�Z��;&�X��)���</�a^��F�e)�A
�2��=^[�ߚ�]ک�$� er�F����.�U�{�X��آ����gJ�ߚ�`y'� Er��af���k�9�H����A���0����pf�f[ﵯ�p�2��c??[���)��ou���)�K,�/k�ܳ������(;6Ha\�	�<��n�׽��pH�q��V�ֳ�a<H��7��8lс(n� ErA�{�=�L!�g�)����}����:R�`�ϥ?��������Ş�Xz�D���)�-�x�r��x�TH0�0�1�2R*c��j�'M�g��s*��ٕ���%C2�Ƿ��^ȍ��$s�p����� Ʋ��Տ�SmF�M#]��
�ԪW��H�ǅ�l:�IC��X�"���d�2�1y}CcVK����rRcbм[��3���,.90�ٿH4b�tVC&�� %q�F1^-�D3��{G�ڵ��A��b�.��c��1�`[���h���D�j "��v��f�]��A
�bL^�I0��jW��$pc�ԗ�|�XC�?'���7e�9<`�2�[��8/��Ҿ����a���N�1�����!R
�`�ϛ�-mF�-�=�l�:��4���D3֧�vu2B���Z�J4�X�q:�~A��t�$��<`�~���U����4wʊ�[���2Η%:OJ�Z�杣�r"��x��<��Ѝp��~7r�N�q��y�#�lCh�	48y\�y53K�L��<l���%��(��!��r�V���>�pH-y|Am���dZ�kC"2C����ܐA��%�N K��^����a:�D�����L.�Ě��U�y����mRS^	&kir�O�b�������A��O���x�T�4��Kj�r�μ2Mӓ�O�	��M�^�5��AJ��}���se��+�"�?�������lM�Ԍ����5,v�D.�d��<4y�G_ǂ�^;6h�2�L�
��\z�)Rg^	F�v�|��J<�����0�3�A
�b���K�ib�g���)��$'j���ƴ�� �qA������[�h�Ł��&*�޼������أ6ޥ��Y
p�¸��1��ܐs��.ZI�cl)�K8p��Dc��!�fT �c��RM䘎���s���w�9�� !�q	�||x�X:[F�<�����0V�{r���˕1uG��07 u�p�m%,���bi�Mu����K�Dce5fң��G���Xr;� Er�羕���Ѽ}���k4H�\�QMG{׸��au8.j#� %r�Ɠ�y�
3w2/Q]ȎR �i"��0���7E?J�BR �z�X���Y�L8��Um���]H-z%X[�+�l���5��h��D������`�T,��Z��4��iѻ��ݪ��y�
�ԛW���gU��E6ŵ:��)��5�dY��D�I�����	<Hy\P�c��h�:����)��5��=�|nl��]c;���/���+��b �v�vՅ<]���-�T�W��9bjb�K�;� �q1ǀy\6�5��1p�j��)��5�-���q��q�OV�*�R���r��hj���vC\�)��<`�|�,��:��#V8����۫Rt�_�W��S� er�'�G�`�tGP���� �ȥ�YGO8��p���4�)��8���:�ܖ1�D.���GF���yշ��A���
`̗>�f�U�e�����%����ٝ��%��;[�-�(�<.�dۺ��EC�S������IV�z>Z�=�6��Ѽ�����%n>N�b_wy��_*R�^���~`���3R��
&M�=����Ͼ��m�𮹥����R�i��7y��?�j��)�K4���ztB��YO�F��"\�H�ye��35�]#7��x�8�A�������ps��n    �4.�dj7�1tC2ŭDQ0M!��`��CIQ�N)V������b��[1�}�T,Mo��������#�K5V�1��Qy%�����eT�G��+�ؒ���GZ.v���d�������<�G�ƣ��M�`�q���]��\ǦSF�zȓl�ik��t�)[�`�1��ߊ�cm�i���kol�9���ƥ����"5'��y$���0i�F��AK�ۀ�Zr�� ���߀|Cr?8U꺛��6R$s|ɂ���G!?Lu�̈́I�]�	)�Kϙ�nٯcׅ��B���������>Fv� ��A_����;�)��4o�FPy!�����!zP���Id���|���Z}�\.�]#�f���3��4�%P:�J5d��9�Z�<m
�`.��FM@]��+4H�\�y�5���hc��c
"�h����>��kE���Y�V��Q���%�׮Qv/Ꞥ�T.ƐwED��{[��>�2Js�����L%�$�6q O���e�׮D#����J��L���Ś׮�r��|��� �o�����FϚ�U}�ں<x�"��Cv���B���d�p��R�E�T�e�±�(�M:����Ŝ׮�2Y髋�=`~@i�+�|�5�G�
5�/p'�ҥW�	�<���O���)��%��{�vO�GѠgVx�N��ɫ	l��N�<�������y�<H��7�a-]���q����Y\�q�:���`.��FL����ѣ:`�r���5�`��yŷ��}�T����>�u�����8��<H�\�!�F|��qe8��8H�\̑��9�瘎��&�p�� �r1�i�P�z;�k�£t���{�D���tj5�}�t�j^�F}���R�W� eqّ1?�+]�(>U��Ai�+�h��y)����xk
1�r��������>�y�:V�5rx\�z��l�)��5Y��3hHq�)+�iW@���e� ~&M��O,�R��Q
�.�44�N��&�Y�c���/�A
��i|���V��rv)��1��c���tݰ+<J�^9F��y�]fpPә � ����>fe/���Qo-�[��!�Q��J9�d�G'/��8{��F�.p�Ҹ��uY�{�Jc��EY�)��Ɠ�gk�!�v<H�\�q��i���2��aiKz�R&s�^���|-h�e붅{<�N=�˿�[�Ǿ�oNߞ��,/�p�B����j�����6��ImƝh�R�D�lH�P]]��C2�+<J�^�ſ�H{��:�V,�ʺ�AJ��!u�g{ӗ3�I���0�o�A��bO,�N�Y��.^���Bi�c~��t��&�i~��[����l@���e��dE���yq�hr\N�b��LN4Q\�8�ߧ@���e���s��u{�*`p��㛏�%���^ؿ��<��q���1��;�QUUQd��O����tA��ɦ�(��ȍWBS]��Ai��Vc=/���BYq�n��"���q	G�tS�������J����%�V���j��ܵh� �q��wMk�\���ߘ�AJ�bّ�˱Ilv-��)�8�N���.���L3�y�M�vA��5���?�9֭�>�Z1ܔ�t�}�y��y��z7ޟ}�2��A�T����xRú�{)�f�R${`5��M�I���IpxP��J9���wL�����j��A���c:i��ѡ6 ���4{���4��L�rc�W�QR{`���S���^��N�ڱ�<.�t|ɉ�1�.��X��Ř���-bK�NZ��)��-��.��͎�w+��.�H��Y��Ȋ�6LU1��������$+���3�N�ӽ>�ϰEi�+�x�k�ʫ*������C��4�}�q�-��Z�pg��	�?��s���Umid-�R���F�&m��fv8�)��5�Y�`<~�m��y�R0���Q��X��Ymz:X�r��w0ϗCt^M�g���jW�AJ�bMS3��w�%>�!f;� �qƉ	M8�&�c��E���;2_��5Y�Wu<5�����GR��P?<��b�7�xp�T�:���0�H����4��v���v�A
�bL;x����������z������Ŗl���nH�-Y��[� q1ǓT��88�=���9�AJ�2M�����$8z�o�)��,��iّ�����&`����g����t,�uǖt� %q�kz:�4���$�`�����΀A
��!y�y/|��W��n7Hw'՞ )��9��A��r�qw�9U�Hy%�������n��R��]�)�K4NG򟵙���Gý�!x�����i�CC��]���,4HI\�vƤg�����p�F�R�X�������;���2/)�K8��އf�L�8��k6h���X�e��kf�7:�#�)��4��4��i{c����0.� ���1F�wd��'
`�����<����	��D���?N��*R^	�����/w�����5�֕��`B
�������%w)W�;H�x屬�<��K}�H��QX��ˋ�����'�����U3M|UN*3/���?���1w3ӊ�*{ N(�b�~�|jg�رA�c��r)��V�`�L�Q�Gi�N(�a���+�a�sՆ	�X.���o��'!����y���:���dj����[�k�my
�X.�DR�س�`j���O���H�xL�{z��g_=���9\��	��H}x�a���L���y���ukC��0R^���A4>-�C�,A��%��]"���Vs�~DH�\&��K�'���J�ܝ#�㕁^�D̈�02�pX�#5�1��a��A4��ύ��2�A��o4�K'W�LLk��>�ԑ�J9�]"��;��)ci�a�ԐW�y�""�!�V���V1X����u���=��*��H=y%�K��[7/�.4�WHMyL�+{��K�����F��]8H�\�y���o������@S`AJ�˗]"��|����x�¸�yN�b���U�U R_�_y���UW3-{7�Ԛ�W��</�FQו*Rw�_y�[��ڵuR(0\��Q[����9�|�ԝ�O<dÜ.M������;R{^�'�%�`v�k+g>���޼R�s���`�ڻ�Z0H�\���Kė�#��R�]s �d.�]"����u��=p����� �^3˴7n��y<�)��-���-M��^rv� r�#&{��x���h4ft��MX�T����,�mf�
�pe��:`���C����8�p������3ݜ��z�-� �p�KF|�G����Q*�J�RS^���]g�Z��w�͹�R�i<�l9��u�'����Aj�+�h�����I2�D��9��AJ�bOS��)��|���m'��������(�`�-�8&�(\� %q	F�o�rM[�Sy>dX� u�1�e`,�D���Z���p�@���+o�e�3#:I�a�e�ԒW��_Mg�М<���Hy%G�5-���{�I��#��}q;����[ )��1�k��[�G=1��&����l���x�"��7:u�C���%�/_Te� +k�ƛ�u��$q'�:�nD�0�Mg?ݛhp��D7���yDcITg��uX�"5�j��C3v��f�S!�����0�I�`T=ަ��N�a����h��k]Y�N��a`��������>�"n�O�v��L���h��h�{��N�hdI�82���!���}R'^�E�����̯Zݴ�W.�9!�p��ܹ�v��;�	�܂)��5�dv>0�ԍ���ڨ)����X=���wMݑ�Cҋ��Fj�+Մ�3��W0�9/-i�:N@����r�@4r˫�W=��)��5�d<�D��V<���.h���Ds%��ɬ6Һc� Eq���#t��|�d�=��0.x�c��!b	�1���~�R[<)zn���/;&ǹr<i�k4Ha\��ny=��3�횦�O�p�Ҹ�K֣��`���F1u���AJ�b��y����b׵�]ڬH�xe��D�}��{��l@��%���~    ^Ļ����2�@���]ج��YI0}]T{���A���>:�X��Ѩ��k5 ��e����߬�$���,H!\b��N�]�/���_��3;SHI\�g��g�	��R��@�z	p����Ӏ�V�ׄi;����:R��c�/C���ҧV�kJ�~HQ\�!ߞd���9l4N�xۯH�x%Oz=F�1��h���A��L�������L*���:�(.ј�.u�5Km��j^t1A����_���[�-��:��,.h�e��ݖ`���8�F��0.����y�ox�v�m�|	A���ŚN K����W�jV�î�$.漊��Z�3�^n<� �p�E��g���\���Ɏ=�)�K4pW���&���j�n8H���ԌW�	���	�cwkǚ�ߪ�A��j�;�s-�W4�ǳ�4�� 0H1\��� W�׍f.�81��
=R���79fw�/ǲ0	E� Eq1&{��qd�*�j�n�Rc��F�FU�5��ґ:�J4�di�����"/���HxlA� ��) �ι�tA�c�?���!�J�m���2	/�A��񤧈��s���ԁ�W����{|ߢaq�ԃW��?�N0��.i�Yn�z�J1�&b�G�e����,X�⸠L���:��e����K<;������I~�9;�u�F�j��Iv#r�'ۥ�]/�R�`ɰ���0Us�nY8H�\̑�Q�·g�hn��l� R �x<)v?4fw+�ۑ�N@��%�G����ꉽ�7GVE@��
�`L~����Ǉ�y=׀���%L�?..�]���9.d���rO���G��K6`pҸ㙾��q���Ә������8��ۙ�io3<��b���D�W�̢�f��FqN���c��\ ���D�f7���48i\����z�q�-��\�Re_['��8_V��#�:m�)xp���<�����q=����ē=�~�w;�'\�<�K��T��6�`����֔U��8.�x�.��j�Y,[�Q�F<H�\P� c��1�����l���(R�]���ֈ)��[f#�&��H]w%��lYZ�9?��[�,g0�)��=�fk<^���R"cHq�\��ڲ<� D��N}���ܝG�o�3RT���hثk�I�V�ֻ�k3�������`��5X�����u3��F��/YR{�fD#���H���L��Ś/�A�fg��΢-x�A��b�k3b9������R���� �x��$����8R�]���+/8���2׭x���o<��W]�#~�)���s�e7��.� �H��"����1��+R�_y}���6�~_H]x�1'39=6V�x��������f�=$�t�n`�r����#u0fCW�ޞ��R^	��f�c�w^��s��d.�� ���55�_%8H�\�ymA,��$�g����ŖW}�\֬�l���,��Q����ǘ�F�'o<yBZ��
4q�����c��'N$�C�H����W���$�g*wM�VoZG�%ӽ���N�7 �zж~�� ��7��"��,\�Q=�- !$q9H�g?�t�65���B�kt��X�f^UOg`A��rK]��d}����;����e?+������c̐��~�'��J�2ì���M@~V9�6�ͱ�/U� eq1�)Y棔�hR�����@c4�}�y�w wW�-j�C�W0z��hϊ%��zm��_dn�1Z��d��^�a'�IS���{�^A�ȟ����}��X��f��>JN"p�����C��,zl��f�)���c���8m<H�\�i����k�)8u��d2FG^��ё��l��.�Gﮌ)_ ��� ?2�LZu�����X�h�����b�1�n~��ּ�T��.����%��9�l�w�sm1����Z1:��Ep!�J���J��yusf�AJ������Z0�v]o��%K��+8]�w}���1xDH�\&�H��_4+z��J{�d�,a���]����ƠA���g��ӻ��zט�ݡ<�0`BJ�b�bh^d�k�5?�-���h.�h����n�3�S0H�\��\�<O�Y?�;��0H�\�ɦ���o�*Y7t�d���V�?�LϏ��rh���5�'4H�\���"�t��鞫�)�K4p{���X�7���)��5_���B:6k,�Xu�����;�86��;hR�]/0���"��H��|*�kҥ���(��)�?K�c�go�w�-������ڀA��o0��\<���g߽�!r�(o7 ~�V��f�2R �a�#���p�ˋY1:���<��	F��SS��"`���k�G����V�XM��0Hi�Y2���W��P&���}Rkb)4��&�?lgC��a}�ѦW���l��G7���X�!\?�A����i����=�m�L���%��>0�s#��<�p��������vZ���8�`�0���,����C�Z�,���09\�1��6BT^1��ua��NK�"b4�}��jNc����`�p��xNPĲ?�=ҟ�%�`�p�Ŵ�~ǘM�nu��p	�.Ǆ��IRz�b�&���#�����~�>�|}�`�톟�j�5���r��}������_���K�5�:,x0"�;��ƎhhVٷW�I��.�د�&��Ʊ�jv0H\�����9j�/�˾z��	�3�Η7 ��j�7��:Z�*"Fg^��{-}+���4�l��NF{�?����O�a��ҾTR{����)�4�q}B���1��9����$�ݰ�	g�`�"������3%�t�wVz�rõT�a��ѧW��[϶i�Q�s�M�}z����}̏L�|�Ow���.�H��ѩW�$I�R����Oz3-��@����R��VD#���p��� e�w���Ί�N�^���X_TD�>�o@��� Q:tj�n��A��b�
��ϳաf�\W0�bt�e�����1��{<�'�tѐ�h�do@0����t�)3���vgK��ZÀ��y�%�*�3��Si<C�AQP��?bCl��g�z�2Wm�M3���}��.��m'�QX����]��[�N�p[hE�:�2��4B7	O,�1�Q4��<ϖx�2C�_\O<ND��k�֦
�3���i*���K�(Wk��(�\��������._X��s����5���U|��Hϫ����jz���9*�D1�Zc��C�$1�9�X�E��"=�F���k���d��t�� 
�_+����o�r��lO�]���I�A��= G����qCq4D��Zӷ
N���\�U(�y�-<�bq��*z�wK�ks��x%-�y�,��;���$��#;�Q(�Zj������C�W��G��ԍ!���sAB�kH�ϙ�O�r�u�~�c�����Ϋ�9�Q�j�ؖ��~�D1�Z��c���Yj�~ �RDL��QL��h�s_ȃ������ed�A�k4��j��\ScN��a43��\'zə� ܢ��h��	z�ǿ��ome��\x5/�1�#WQT����P#;��&}\Dq����蔜�p�N��D����5����� �c�QL��<�F@�ن�o��bĎ$K���Z7z2�oKC?g�QH�Z����PsI;K��.�A�A��5/{˰r!��Z-c��E�� ��՜g�h�,$�n�L�#Iѫ��ԍ�m(���ڶ���4�z�[��<u����T�-�����')>,2a���&"�K�E[���3k�s���	���/W�'�3�b+�������Ǽ�N�-�b��$E��S�i�R�.�,�l��&�bu �3)��d��$7��ንآ��N�$�p(����HX�u�r!�H�I�hϊ��$5���� -�#Ŗ|r��M��<�4@�`ּ׷�CpЌ��a��=g��3�V�&�m')�E�'�b���Le[0��\x����I��������i�/ժl{9X��y(�R���^    5�k���y�4Y�6��,�ЕK49�0�x~�o�@�,��`�t�U��O��>~�󡹷=�A�s�i�q�-���g�����:>���jN�a��O�g1#v���n˾b���j^*7����@�Dfv�?l�y����,�mr�げ�6����'���d8��~�j�3'�h�Ɠ�MW�i��H�����i�����g��Y��\�Y��������m<#�7�<$j��JU{�2�Q,����d���F�5��6��S��Y�P���Y�L�~��m<'�,�1�����T�D��cr� �?8SXA�&�S�xN��������&NF�A4�� ��5c�g�2�H��| �g�� 
{����|��.�)��y�gD���S"5�L��kN���仟��e5	ɮ�c��B�(��+�8^��4rh��Kޟ�������Ɣ�L�m��>9{x�A�j0�3��E��N��^<3�g����|�-���-�E���rWhŽ�/|ݧq��T���t�A��5��qe��:UUZ�������l�
�Ǖ1΂��vi�Uh��j�˧B���;�����y�A��5"�8��V\�Q��H����5M�[j��B�(�i��3%J��,�IQ1�i<���ep���@����Ƴ���V�����ﴥ����B�(�hn�Q���������~�������}.=}*��^��?l�ix?=}�����#�=3�Q0���륽k�ޭ�;d������րoL��F嵶mI�c���x���i��m����V�Ql��^G��7����	�}�.Z��hݣ:�������ƀ%hƎ�Řf�O������V6���~�Dc��m<��F��4KmXmⲻ����ܻ��=_b:�ķ�������g�����06s����9�����W�q>���a��;��� ��?l�)w?A�O��\��n��?l�Iw?9j1�r�w���� �ئ��m<���>B`���x �7Q(�ր���Mr��`<ʹ?l�)w?5�,cWbFӄ������?LT�Y`q���!��)���a϶��QD�sn�2o��	)rԕ�@�(WklP��C���F��m<��?0�#���ڽ�%m���������Ɣ��P�Q��N�y�'D��Z�Nr�w�? ����O�X���OW��mϝ��z�~��Y��x��O�ˏ�>�4�f+�S\?��?l��v�5�Wݣ�V�i��36���x��o�k	�;F�V��>h���񌻟���=�%��*�W���+�x��O�mř��P$�þ��Om�!
�k�4Hb}V,1<>�}�+0�Bq5V�*��7�A~]D[�X`��j�&sC��B��/���Ԫ� 
����a���m ��loD��FSYz_�j����k�A���ӗc����x�/�V6Y��@[�QD�X
/ڪ=V�XN�- O���%E�aY�Ķ.;w]��g������O�n�(�(�Y�'4CEx������i<��?,>gk�ǵ����w�6_x�j��=J�@�p��#w�/��(W��m`���}>7�a%b�`w*8�r5�3�W�����g՟ƅQ@���ڸ�&�̦��vEw�x��o�}Ǫ��⩾��bD���y?xA{�9���aϵ�I�Ʒ?��XsvtV����\��oW��m�g�?��,*u��Q4��X��E����iEF�A�k8��SP���Ҹ{,��Ɠ�~j�Ib%�_O��P��L�A�k0�9�W"�o��F�����h\�18Wd2@�8�[��o����?]�D_����Jm.�t4�A�A��O�L,T��0�3�9��q��b߷w@�9�7�?X�����8���1k���3=c��3�~b@���c�	�lO�텫�/<�"r��1>.-a����f���p\m)����8^��r��ɨ�6�����-E�P���|<:�����'�C�9?=e%
X�\������-0�"r5nn��$붥��Q�B�( ���e�$ِt�7=D��D5�ut\_e�DѸZ�D-}l�Pm~u���1$�n�G����u'*]w46 ��R���)��DtpP��Z�k1
��>g#aw��A�k=e5����6{ꚝ5�������r%(ɮْ�4 ��� �
t�	~�� B����e[5hL�g6�)��B��7P�n��gZ��3 ����b7�2K�� ������c7�rJ�
���a��v����jPY%��
&��)b4�"t��Q&�E�;���9� ��_;
nm�u2 ������D D1�e��������<�Bt��Y)bz��Y{���\�yn���#�ZvI�i� �xh����Gy�{[�P�5�n��D������t��d�\�5�l�#�[�f�"Ǽ�C������QR��F�o��?)����M�:�-��ઘ9.Q��d��!�ޞ���xAb?ʯ�m�d�v�����zN�'GU?e{=[0�IL�sI�EJY���P0��񻓾����<�����K��6U:�z�q�Sb��6�x��O�������K��q��O��w�ɔ%��?b��O�t����tZN�8�x�W)qI,R{��HV�ƻ���E/ޅD[��*���!���ˍ1a����{�?���8�^l{I�1���b���������{����!zwj��l׳�q�hLo�������b �x�r�|�[O?���Y�0��~2vs�'f˽7Ɠ�z�����5X>����~�0q��W�uj���aB'�͵Y�(z�Z"?��w�zA���Ȱ�2�f�ao>O��>%Y�8݂6���x�߁W~:�TѓeUa��iޞ��-3=R��|�5���x�����_\����ҋ��L��ڮ3 ��u@Dԡ��7�uq�MrCm_����̓���w9 Dԝ�*����%çp�Ӝ��,s�}��_=�F�!^-[ ��?���1�U0�..�\I6��YԖ��pL�%����'5��-.}��H1?M����aE�V��za4��ߟAD�I�/���E�V�Фvy�f��1�%�l��A�NcN"Q�R���U�������E�{���xk:3v`���Gi>w�'��q�3>zn������ėt�S���� h>��niW��At6��d��0�q�h�Ir	7˗������D���J�I���r�?��q����{�g��n�gmOkM���>��j��B�|��/��xSJ_7��T��B���M�v�ҏv1v����t̟����ˇ��ȯGù��(��ʑRǢ���0lh>C�/�?.���ibo�pǭs9���碈Kd{�  ��x�?�<x���Ur���D�X��ŉ�p���|�6��y�0�mZ0��߅K�C|ƙe������lj�A�� Dԧ�	��E.��=���Q{A].6��6�l�3F?QXDj>��1;f����w:a��J��l�m�6�.��nn�2�N��hd���1Z��>^t��i�k�[#����=#����:�0��|ݝ���,J}9^&�؝,m��UCt�ͧ��2��4��ӳ�	+�:xǘw���BH��U}��t�y�?��z�5�s2/-�&5]'�Ɉ�Aomy�D�!�~��l3w��K�ql��\$U�3�d��y\�˝81s0|h>��'0;�|��}���:S0��O��aϚ�fǓ�0Z��������m�M�nTɕ�>ɾ��k��=L�}k5�Q̂o��S�Ømޅ�p3�Ƴd�t[�>c˹��k�-;���z��YHG'�8.�ϓ�,��h9)��|��	"�W��V��wy-L�T�FQ��G4F��آ��S����֛�y�f��x�.�Vz�fi����!4X����y����B4�J��1x�E�=l�����|2¼�1���~79���֒( Dӣ�w�(H�O"D���E��Њ�p;W�����p���L�%��T��Ñ�X��
V��DH�9������ͣ��+�d��t�)������K��ݖ����    ݟ�(�x�ĉ��-�όb:9������"���i�hz���R�N����m`t��eГⅯ�\O��I�ٽw^�����}J�I�3��=��\�ܥ�u$��m MW��;�ܘ�i',v���276m�g��~�|/�� ���j�� �/J���	�%wG��� ���j��ks@w� �����t�1kPy9&8�6�5%˓���ڀ�vñd %�~�Z��E��?n�Ҝ.9�e����-j�v�k�fDԕT��Ȏit>�{BOV���,y�=�m>���1�<���R@�ټwQ��g��/$cyr;��&Sk��R��Ly+^�f�����\ߟ�rK�Z�~�v��ާZ7���$?`�3�R D�뀛ǂ$�7^V�K+�%���Îa'''����vDo�b�Ƚ����{E�Qo��v(_��������,Sdt�!��MU,~��,���w���q��ɒ8�L��t7_|��� B��������%��f��i7ٶ%�Lw o����b D�끜b��P�gxg��};]�d��p�M�ӆ4�."�B�*��<R�qMa�A7�e�����n`X�j��r�#����m~�w�@e�����̔�<&5#?��(�gTl�i>���PD��5��h7Ə�?>`�z�ЗD�m�g�/����;�s������D������vg'w�a��3��E��c��ͧ,�Br����r%ܓ�?����@�C#�����
Bw�i̿�v�4?�W��b8�<ߜv�r��\;�&+�u��Q�R-�=�6J��ڤ�~D�Lٝ,�@w"ͤn�Q�Rs�y�R>�K1�I�����mD�<$y�S.~[��I��3�͞��F���4T��Ŭ�m�B��-iS���~7�}�|���ی�Ȟ� ���L���C��l���\]����,�_���(:
����Ւ�gˑړ�E7���\�i�I�ϛ�y_�!,��oY�L�a��,~����9���?(��Ǜ�1��>�+h�/Y��+��;�{|��)z�m��'J��6��ћ\�k}��I;�bƬ�����X�ɽu��+�<D����|���|̽�Ya���p8���1�X�����G�_�s27C-��k��x�w���ƺi;SH�C�W�=?�w&s�.�.���Qw�ʝJ+δ��H�u��߂G?�^��y�9�0��h�ꆕ��f�M]�.5_x����F��N'�rb'�6.��L��V�I?7����7�
��o�CF�Сg�]��O���`Z�i˵<0%{�uQ�}�_�hU<1�e���!�+!W4�f����>�����p?x�~yb��j�U�^b;Iq��؛R�#XCn>#��G}�˖v�\��P�2�r�����I��R�j��׫���3wm��.>�b�l���#u0|n��A��#ȯ����x�[$~U��T"%g���` ��mͮ�J�<��7$����G�'�l�K.qot���ނ��g����o�j�^��jH����F��ɣ��NC�	�x���bn�6O���Byf�0�O��[�A�[�Yj_�SOXG����"վ����*�q�gNW����;�=�{,�鍸ԏ�͠�0/�ۑ��ǅuI2���
�}���*w������Y�����9��܆��:�*���W����/�	&9��1�	]	����|�w=���&]�Ҏ��X�J�����=��US<�^���~�ؼ�%w�Ckr�Q��Z�V��)��$J���Ţ*��(vs�*y��f�G�;�㙺�����p�|�Ɯ|HM�Qɻ?{��*y�F��@��3�����:2��0���^�kq�Z�<ۈ8}�����-qr�L�a�c1s� M�Q�c�x��c^�Qd`Z�M�t�Y�q��	'� M�Q�7���cVO�#�m'�y�ɡG�=2�^9�м��<��ꍧ+j�G�u
�~6�3��ۼ��w��&�U򾟽�O�=�+/��̦�8Q�,�'y���=4�F%�>�Qt%��̮�4?'V'�B1ե`Ʃ��t6�^M���Q����Y��χ�uC���x=%2ɽX�y	�sQ�9��_�#?m1���)?_
�b�����Ewu<D�F���mh��;�o�\+^o��z9/�<���#`Ă�S�������,AF�s4\�p.����)Tr4-�R��6_�����SV>�̡K�ْ%C1r��ٟ7K-=x���^��G�\ay��S6�.)��~/j�E�1�ix���*^�;�(�u׋���r��y>	W���\�͐Y��|�[jxĭ��o��]yn�Nɒ��u���O"��m�*x�'"�7x�*�4�V�,WB��rI'݂�|��oˣx0��9��9g	�O�����$�ц��g0��[�ȗ��z?�M��.���ⷩ��?����y��H6�U���S<�w��;CW�q�"�.\[��wP��
�|��O��q��l��J>��|4���Ss/-��q�m�����7���� �ów�t�z�f<��(�^t�Q>8)5I�ڀ&C�i���y��^��ɴM���x��cY��0[�a�k��-b���GO?=�|*���A������} Byj���tq�����gn;(8ͧx��]�O�|�:�l�b�>6D��������2�wMl]1JR�8�bO5���Oʹ��Hm/����|��/�ɉ�0��Dk�4�O�=��n>7�����:��`��V�����i�Gi?�ia�vz���`|�|������6K��ǦN�L17X��D#�j�R�8J�,�Z��L���D��Oy*(���Z��v�j�+g�s,>%�X�$�!
�u������J��j>����J�y>;�HP�� 
�Չ~σ�!��N�9�|`E���o�{֡$������\���*9�E���ҥ^���q:\��ڨƆc������S�a�Š���6#��Y�r�� X�9��HW�7�F8�9ͧ��~��*�$�=������DE`�����ߜ��
V��kg0��S󉲿8p�9��!�35�M�����B�Aӷn���ꠉ�u�ۙ ���$�: ��^�^6�\!��$F��^��$����m}��a�2V��Xr{��������d�Ln<EG�!�����i|~Z��'kM�.�"���|�/Ϙ��YP��ț���� ���N�z��%V�����bj����9񁲺�؝ƀ�(,�p4��|��{}���p���)�{���Ǔ3lۂK�.BhE���8x�*�o�g���7�� ��\���!f�R�P�/��(�`|�q���Bѐ�O|{���jM�I��D �Su�'�I$?��<��r�G-�_�����ή��n]V�٧��&+��%�`�b�ӹ[��((Ws�����L��N�@��+�<o>����;P��|�R|f5�:�S��{kh���`}��DџE9��S�b�~֎��
�ű9���W�=���h���LU�������Vm��̮���O���)��2/Z#�j�-���|r�/��v8ɵ�=y4��i����'s��<O����3y9� ���N�GA�48}��-n���\�)>��'sBǤ��.�[p�O;��tŊu�ƹ���k��΋�k$���g���t�1�(�����b�S]�A��5��X�YO�x��nk&p��((א�ٝR����a������Ҁ���k���}:�k��Ã((Wk4���E��a8<X�j>-���tA�s�,b��6��|����+����u:�b�NcƸ]Dq� ������w�D�����sH��;�wV�Jqˈ�sn���ms��@��s5����I�P3W#�0G=0#�O�����-��(�e�m� �(0W��S��ht�I6n�	빃��\��9[{t��������$����j�͉ʇf�U�];�<�A�k42�������&� ��\��L���4R�-��c;����ō��z��p�! Q`�X�/��<�w��O�D�z 6    ����yD�rY?���X�,�br��[\�~<<%(�P�+�T Da��hN��q5li6	4��r��Rl�Ó����{�� 
�5Y��Y[Q�,�1��(0Ws�L ������� ��\�Ѡh�s���u]�~k� ��\�18Wl��ʭ�T������QX��KP��|���6 !
��������`��|j�/���y�a����t���\�q��g~%�#;P. 07��{�e�b�A�fqbqy�%h�ɕ��5�C B�kA�13]�5Xd�����3�a�A��+�w�h8_$�����Md����.8���t\��)�@h�s���yK����M8���(���50�rN�|!`[,#f9c�+�������Ym�p0���J�Md��X�}�J�+��\<]����
����`(�;Ƶ�>����N J���J�Yct=X�75PU�@�5VR�>���YmJ�&nh�@'�(i���s�s�zB�8�ɑ�@dF�5V�1�c��ּ�d0��r�v������>䁠�ڝ��K�@�(i��2��-�+{5��4 Qd�Е�'d7u;��B���O����h�m B������&H�|"J��'P�I�0s��@�Bt�ރ��ͅ�@��5 D!�dr�}�.������:����j5��Ǜ��P�d��=�Y�(��F��;�����h� !��5 ��Mn���Y�C�g/�͈�j<7��[-������Qx��<�f@�@���f[�A����϶gix`�^HDB�3|0(�r=�Y� j�(�s!���-$yu�gE�g�Ki���4Kg��3#ɬ��)K��Fy�2�"�σ.In�O����\g
���8(Br-~�B��q�n>��ࠈ�?8ei艆#X�\!Iz]�祴�;�"���^��L~V�z�=��@K��]l����A�X������M��Њ�Z-�l�zM�A9&��:c�}0�A�����pB|�>0B���2�t�Z,��ruy�m�D�QT��E���2��2��[I��Y����R�z&c,�^8}�t��G�x�eDOs�ʊ	4hbr��Y�b:�HFӨ*H���1���w�qv�^<h�q����0Ǟ�����4I�_�����r�p�W*�nD�A��9�[,� 9���鰶&�)T$�~?8�	Kx�$;���%�/`�I�_���aA���0��L�[I�_��?1J�x���� �("�`ʢ/'�F��i*z$�8�$ӯ�S}x�U�i�ʦ���� ��՜g���	��L�w� ��_�p�6X�r�M�ïU~�D��?hࡨK�'�N�_΀�(Ws�P�Ç[�A��W��5( Ǔ�*���̑d���<kP@�!Ѹ$�[0u�$˯��  �Ȝؾ�O`�I�_��_3^�6X�r�aʙL�(�IF��W�y�A���p���Ͷ�w DA��2�AW1��~g�o�\�Zг�t����ϖ�sI�_-֠���#n�y�>��\Á5(�g�
$9I�5��C��G���W��5(�fw�ۧ��,�@�(.Wk�8L���љ	1� 
�5����Ѱ��3��@��W�)kP@΂f���� 
�5�g
�I��VqW�}� ��5�g
�	��5ń�i4�B�W�ح���(1���1���$�,�z�k
�L����S�~�&#����Ԡ��\��ɘ`�	I�_�֠��1o�Ԙ��4�T�Z�2��cg��s�g#H�j9���ٶ3q�,[㐤����Z*��P��}����b�C"��ה5(�2s�6���4��}�$��zNY�r�eKQ?���(*Ws�P����mf4� ��u�G
�I����wDa�Fg(K��_���ۛQL�X=/�^jP�0G�YvB*�/���(&W{�� ƚ�y=Q�m
0�"r5֠�����vlQR8�"r��A9��)/��A�k8�P��9R]�,4H��j5e
�q��2�Ծ��Q@�X8Ǚ����Iv���H��r���)Ϸ4���)�@��$��VS֠��E�^�n+9� 
��X�⅓x�3�|8��r5֠��9Xg�;G��W�y�i*A�}�D�. B�+��q���Bb�����B��P��>5��~���) !���j����#�.@HR�jAe
��&CD-�uD�Ns�M��~{��xrz�I���=�b��� �����>�v�cE�k
�3ia��WL"I��5(�r�=hg\�-�=�A��4���貟a�<hBs��1����· �&4ׁ��cl��<�o{�A��8/5( �"�ñ)1���У�8��)'�u ����w+�ы��$g�U��|�!I����r)ݘ�q�[��tI~�MY�z���kE�~OD���S֠���;��3\H��j9��W�Q6�q|Վ��B��W�)kP@ά5���ؙ���$���銵������W�Gmz�Y��r��e<H����yq�p�@D�����I��� �(0W�`
ȹҴm�s|s!����yԠ�"=N�ƶ@��$��V�Z��������~	@�bs�>f����Ϯf�,� �(0W,��k
豜v�ړ�|P ����֠ `&]�$i�;� B��Ae
�1��΃sU�@�(6Wk�9��G�f���FE������,i7qrjspc�A��<��ӱN�|���!� ��+�E۳Ą�BGs�F���j0�5(�r����qSr�E@�s5֠�'2ec��� 
�՜����Ì�؇�f J��<kP@̹����E��W�y�AAs�ʃ�9��$!��>�b��h{����B����4 Ө����P�̟��Ji�3 !���:�:F��*� ���'��`ϲ\�xs B��ԟnV�^W��L�	��Q�1�Q���5(�FGġ��Z� ��������̋�w�D�Z�Z��(�CD��8��u_ D1�kP@O���Aj�2<�Bt��Y�b�v�o��� �(<Wc�{3 F���|ĭ��e��>E[0��h�r~���k�5do[3�$�Q������/M2�.�Y��EL��<+b@��m@]2I�_�VĀ�Ӻ?�7��&��$����Q���Rz�;�L�^:,$�~?=�n�ұ�Lf ����|��孏Wv�$�~?8eE��wWwl8s���$ݯ��R�p]座D��d���ZУ"�Hj��#��tH������(rk�K��ϴ�!��4�br���g#�="Y�w�Y���sDQ���p����L@A��$ۯ�+b@Ι�alғ��I�_-���5�p�Z��b�<�d�Z�KE�Oˎ,�� <�����[[Yj&���-7{@�(&Wk�1�r��=�G�EL7 �( �``E�9���ɍu|A �����TĀu�	H~�x;�A�k<�~sȱ�9���e$�~�Xr2�uG�Q��^tDA���^9��^+�F`�'�T?�/��9��VVĀ~]w��izs$�~��G6Yn�ϸt�bv�"I��ǔ1 爫�<�ZI�_=���9Lrvgǀ��$ׯ��1�b��U���	$i~�Xr�v�I�ٰ��I�U1Qpk�4���l���Ń$˯�SVĀ����;���5$I~�Xr�ǝ�=�Aw8h�q-�Yrƾq��}���)$Y~��9-S�춝���\́1 g�
���fp��=��׊$[��ʌٸ@��r�eꟄ�x&��@	u!
�ՠgE��t���RQX�����ӳ����� p����=}<9���[�A��=eE�i��P�	�ۻ�(.m¸��1�f�y<�;�h��MY�,wa����懼�B)$�~���"�FVG�'I�_=�Yjf�������QT��<+b@M�.G�6V��QH����������%�A�k0�1����N"�8!��_[Bnm/1��'���nAD��W�1�r?H�"��26��(&W    s��)�8�a|m8��r5VĀ�-�wZ���)��ZNYjN�L�\��B�$��^SVĀ3&|v�'m�A��v]��`E�aN�;v���\�)+b����'F�\�� ��u�GE�ɵ�N/m&Da�FS�P�\�}���<���\�y��=���v�yb�A��=�]���r(�`E��|��Rr�Dۘ���QD��1�r)_���6�>Z��("�p�1�&���P��L+4H��j5eE�If�-y���Q@�ּWĀ��k�3��O	 !
�5�rv������mŷ�XIz_����5S��-C����QP��VP����s�Z�~np�j��A��@���F�����\�y�i*A���b* .#���G�GE�;�^;`��$��Aj0�	zk�`I~�?�ґ1^�i� i$~ŏW�1(�ʊP�H�طh1D�Nsϔ ��e&��2�G�d���ܳ� ��Joe|f!�����1 h�JX�\^� B��AeE��K�=�k�v�E���=c��7�"� 4#��+~�bE�h{��Av7k_Y#� B�k@eE�\��\�ޜ�6�D����s^*b@����>��o�Q`�=*b@�Q��.)`fI~_��"�[��9l�;�I ����?4�0�_v�"��Q\�Ӕ1�gњ���p\�A�����Rrb�H���Q��$��r����� 펣����M`�Ӕ1 ��j�h����A�k8/1�G�q�U�14��F��W�yBP�7r�E:�E���� ��O�
'' �&0S��6Xr�C��k+�/
$�}?8��T�� ۬��J�@�4
IV_��"c&;n����\���!��ە/rd ��żTĀ�,�OI��$`�IZ_��"����Î�If$y}���"Ԉ�ǎ�*@�(6W�}�^������ʷ���, Qh���{�gH${]�(�<�"s��Yrr#��!�l��Qz_�Yb��Z�-|
����kE"�$>P���� J����#���G��C"��*�m/1�'�^�]�b���ϳ"O!wF�7Y8`C#��:�KE:�F�?|>�1 B�k@n%(:o]�k�Ѓ(��@��d*G���8�R��$ݕ��@��󿀔���qP`�Q�U��h�u��R5��q(@�2�������~	@�Bt5���5�u69]�` ��"����<*b@͹*��L�&� ��՚׊4�x{/���ݎ(ٯ+b@�)��v0�`O5�|?�b;D����1zh�a�R�WQx��<�fP���N���R��L?��}����Y��������]0�A����A5��UÕ�1 �=(���_�:���R�z$�z�i�S+(�~y��`�h����u<�A�{��Bk�Uǰ40C��W�y9ĸ���&��d�~�??��m/5(�G��3C|�����y�A���8V��& 1���A-���Ծ�CDA�~�,�Ix�����`$�A�~?4��!��fxRՑ� MT�:����r�`ɹ�sܖ�iJ ��\́5(^�?��~��4�t�zNY�j4)R�It�QL�ּԠ����OO2&��A��<����FN��������wo{֠���ϵ��$IK�A�k0�<O��[��`)���(W{^jP@{"�6;vo���\�g�*���i��$�A�??i�m���i$���QP����;{�k�s��+D1�FSvX����NF`�F���C�u��qKҢ��@�wE��LY�r�K�)+�"AD����S֠�u�[�}�8 QD����=kP��y;氿Qp7���\��5( g�����ep�j��M��o(>_O��D�S֠�������� 
ǟ��m����2����iY~�8���^�:������A��9/_���[��ݮ�4�z�A9���f�o��($�p^jP@��ֱqb��W B�?�����^,A^g���w��\�zг<�v���a��H�����C���(�S0�@����kP@ρN��D;G:� ��՞��ˁ�ݡIz��Dq�sg����A5Ԉ��G���Da�FS֠�'���\=���N�Q�����5( '�;ڥ{�V��@�����A5��z&����"����:�Y��#��Lh�䊥���%f0t-˸ʗ>� 
�5����Յ��s��)G B��E/5(^<ڴ�>�E�_�֠�3�sI�Q)�H���L���L��穙���u~�֠�gVRt]�c�A�k8e
x~h��Fc��{��MP�Ӕ5( GVgD�]�RpPd����5( '��P�S#_}(R��9e
�I�}?H�L�����\�2R��5(^�u����u��o�
MX���*����F�Ù8hbr���Q��p��p��(���=��%�7�~�m�
����_g?��`��sp�8>X8�"r��A�re�ߞ��Q���\�y֠���'��i���QD�֔5(�fv�.���q)��>����h÷���s��+6$DA��T�|.�"�`�l�A�:��\�)kP@���;Z�݂��QP�����۝��8��r�|;8���A9g�[��	��8�br���>~�3̞�@����������=��)~��+��k�7�(mB ,M���b�� *�/�7��X	E��W*kP@�9�=f�=
�����\1�[�=kP@�3�9�D� 
�u��	��$�ٟn��`�Er�/�AAyg1(׉M B��Ae
�Y�tJ�ۂ>���X�z��q�×{�D��b��R����^����a(�~��/'3�����t8D����R��ұ2�~���\zԠ���p̜�]�(���-�5( h<\�������>�?����E[Y�j�GfB7�U�A
k4e�xR;�ugs�H�"����<+5S�s>���s	u?4e��9����xP�Ӂ���;-�^j>���_�i��r�m�"���u�UN�.��J�B� D��_@����[��Ȧ����s��No�� �ȥ��q>D���m��lTA�HW����6��ךD;ێxJ:'0��"���Q'��BUK��]�cTyt�����C����Z�X�A�IW�y�� A��Px��@pF�IW*k>@�47���e?yt��+�tk�ErEv�ϙ�L��Ȥ���q��jp�ޚ����&2�z�5 g��J�s�[��&.�p�5^NiZZ+y�+�-���5�ך䝧��w<��(����{�� 9�*CQ����iD�t5���/��7�\��!�C�NW�y�|�����2���{�%��az��4���/;`��(���T�{[��Qc����J�TD�t�&(��E�S��R��	���u�^k�^�(��@3Z�n�,�jD��_@+*������Qf��i��jIZ���d����(��T�|��q��S�rev]hE�:ͣ���=��!o�@�(>Wk^k>@���-#9`F B�k@���,s��ٰ<�Bt�2	k>�\���7F,;�Qx��|�Ǒ��6X�\��"?��ޖH����)�N�q?�$����W�u*�pqĝ����)���hBֱsղ�E`f�U(=$��^z�}���|�����b�&�JO��~1��[�`��Q<(�v�zw�a^�OzfSϼ��8�3�PH�o�
�k�����`}�p�a�6@ 5��6��r^�J��� � �U"n���glcq�b@����}�ҳX
�;>���@��V"ؿ����7�v�~/n/�]�an�p1�o�Y�O��4#��^���@ ��/������L�	�[(��j��3q
���|}i��E�@��/��������}Z P���=N��{����M����� �&ZV�{��?w�/K�Q��b���}<St`��>CZO�mGh�R&-{�     �����C+���|L� Q��`�;������"%�}iU��v��N72��H�� ���IT�ͮ+� �bwU��vH-�d�6��MU �|#��.<ƞ~�XDJ��*�_�!��U�5@ �_��}X���R� ŉ
�'�'G�V���8�(Fٯ�AzI��h���+�MR5��v�m�����(6F���U���i�S��~9�(�C� ޮĚL�334�ە@1��_�5X9��F#��>zP�}�D����1�	�6�A1+�k�ڌsw���DLI� A~ �����J�:���6;�`���޿7���3��J �(XQ��}<��-c��^���
�+�ٕ�5b
s��jR'e��@������)������1=�+�"�����m<��j�8�`�bocLs�܁[�Z(�;��F�u��56�<�3'������K��<��A|����A��f׈B��L�P�pV!h�/���(WѴ������N|���
L��֬D�oǸ�>Y�{� �hdU�x�E�	��Q�68t��"7�jj�h{��m��`�A����[��r�v��@ ��_�/�z;�Av�E�7�@/�(bV ����1�bk6<moS�"�����ގ�83�f����X�o�CD'���: ��VU���[W����y��m0�CQ��A�j:NwL^\y �(lW ��/��0�Or�>�QT��AЯ�c�v�ؔ�+�3E	�J��x};�|��O9Ɓ���S5�5N������#
��'�~�VV8? )a�u Qخ@�}��q��� ���(.U�h��&)î�V��(jJ� ��+a��Qv��@��I	�:>�y����ʽ�N�]m�KQ ��K5虸Vn񺬻��z���	�5��ĵd�1�pq� ;uPl��	�,0���[\r0C���<<z�����#� �b�L�+9��s��I�pЄۯ��6�HO�vN��m	`J����H�`o��i1!��Wn��=Y�yM�+=��Οq��E��&�y*++�y��v�Þ D��_@���b��>�Q`��$ҕ��V?)R����(6nZ���D:x�X_�,[-.Q�Q`�ּ%ҕ�(�<����1 Ql�=�=��~eO��n/��\�yI��������}'�Q졬��&�A�Q�>��f��jP�H5��#$8G���B��^� '��ϴ%|8�B�g-�{�K"�KQ��x��s�>��\�y&��JLH�Z�h�o:���5�g"�T:�Β�O QT�Ƽ&�AИ������e B��A0�r�vb���:Da���H�Rg�r[�j�D���4ǽ�H1�<^���d�	D�A�0/�t�2G�P�$���"�Zr�@�u~<���V�M��o�<�)����/ ����qz= B���}�~ D����ɽ�4\����8 !
����a"E��d{,s���R��̍�̞QF�m���"*� �1/Z���a>��� DQ�p_�*�έ6�#��*PI�P���'�!�l8 D��Џݭ�-���M�頨�R ���m�'ˉ��Oj �]�ş,��DQ� �"���R�-��g$����I�����Dֲ{�� E�/@��*P�]vm�L�(*�  ����?ݰ��t���(j�T���3٬�ں��(��� ��C��%[Q� �"����?B.Y�����-@	+ �]5�_�MX�M�0�E�^Z3>(3�����wA�k�6� z �5���Di�n��@���$�6?q󴣑�ۅ�y�,(vo{f�C��\|��Fч����`ʪ�e-���}���H��-�����l+��꾯��������;؟��Y�Ǌ��N���x�o�MU�q��8�6�R��i:�^��wE���.|��g�-%{�PnOO�}�O��=�JM�a��^������SS����X+E��_�Y��, j<0�9��|zbj�����-�i<.��t�	�R3��{���Z`^�����_�+�ns���jY�g�EgiN�aM���ݿ<��ާ���� ��MrD���#s�����į4�������r���»'�#.�D��ڣ	���zG�C����6��j~�O��\�/5���_N�-L�7����
9��8��&d��u���?ݪl�> A$���w�1 !��ՠ�,��wO�v�te�4��r��Pj���[L��hE�jM�1�<ܭ����8�t���7�����a?�䔞�{>�1!��(*W{8��Lp&��Nҷf�Z����ܮl+�'>	V���`q���?5�`p��>��Cחy<�"s�����d�rx�p!�͟���N�ҕP(̢coF�h�h��Ǚ�6^r��Y���¨����qF��=b���\�-�םљ��uWt
O�~y4���f/�j(�Iz��( �pS���gƚu�{wh��S�)�������:7�1��5_h᧦r�����~�	|"7_t��,����g��N��f�hn7_}���le�)(�.8o��z�>s`���2�4�r���MvJ�K�R 4���
?���i@���ޮ QX��<6'�Q��G�0�����S����O%w��\;�&؛�|��_�1'Z��ʠ��z�G`/`QH���F̣���	Ao�΂�xЄ�#�m���Q����b�Lu���W
���d��'$B��i������yd�@�V��u`-08m~[�O��1t9�sf���nr�A��4�oq���!\�;mV�ܪ�k�}��5Ũ������S�9�hࢠ��.�XS>�g��M��N��n�_o��䪲$�z��801��u��w� ��7Ƞ�RZ4�}v���W5�N(�eV��*�0��NeuDq�&+���%�}-���� �,/����*?q���T�!�7(q+ܟ�W��#��*�]�M������W~�(�!<�K�zp^:�������1f�c��Ɖ�l C�ϧ�<�4U�f��"��N�C8���V�Ou�T{GE�f�N�4C�!�|��O��8�B���]j������Q�0܊��2�$�nF-�`
���xs
�k�,���L���IQ��h���tp��>�,>UϏK~�ᖚ�IF���La�&ɀ��5��*ʚE�y�4�����ەƐ!3"�Z������5�*�c��#�["�Z���Ę�h��_e�J��Ϡ����?r</T�gz�$������)#<~q.A��u'7�M\z�ׅ)"���mB�Zn������
�>_\�G�z�i�_!ҤeJM� ��>_]�G�r��J��p�1����������v
#���r;�`
��-��_����tu��6۝LQ�Q��r������S��
8��r=��?�|6aH���&F&�L��sM�A��6>-���4;Z���)>׃LAV;��������� L��
�\�\/'�[l]4��s��t���+�U�n�Lp�� ���E�����a&ݴO�;�
L!����N�'�Ϯ�.�̇b��k��&� oì<����K��|���K�������ZSO�v�b� �)B#@��r��o���FS�`����
j��q�;*������2��6�������	k���Z���.��Te��E�?z��RX$=W�F���oS ���k��(K�/.b�`
����,9�P��Q�Z9���?q`�1R�9�,8��J�67����?q4��~9�:�l�4|�`��MqfU�9��᚟R�8��`M�C��%�F����ξ{�����c�"�al���a%�5�0�Q�A��ĳRC���~����[���5�,�s��-7\5�[�`���O�+O�Z#�d��=�`��(�)��&T_V/=�sv��@��k��{������>�s���~��������2I�vW43`:0c�R�FB-|]��J���ظ�S!�����h���Y����ݬ�;�_    ���`����	�]at����|�2�K��:F��_�;��L��T��9��(�h������߿q�	���\pl���A�U��#2#9��>[�1�dے���K�
f���һ���O�88�2�#
�d���\���֞�9K��Zκ6Q�=�%g7�c$p0�eG}T�Ŗ�7�L[��a�K��_��s׫����<STFpI~δJ�j�{�n����=���B'xTA�"��ZF>1� ���EZ��^�� %�!���N,���p�H]��	E	j��I+�hv��!A�}��1#%�miџO	-�6�)>׃��0���5f��ˉ KX��~�<7�J��:D��,���R���&T#�sS;����l�ֱ�!9ppȫ�(<V�Z�^�`�������V���K"m5\_a������˓��`H���ge���}3	K%��~9e��^�F�t)�b7��\��Q�^R���nr�S6����@џ�%�`�7?t,
1>g���@t_u-%���#~��nC a
�P<�**5ӹ�J�pt<���]�{�	�LJc�Nk��b���R���Q�H{*-�{�}�RڇĴ���/4=�Kg�X�@�)�k�JyuE	Z��}��(���!A���h�{��e��-�b��)�{dA�*O�k���閿�V:��>��k�-����ӱDʷÆ ��\�Q�)v:\�1܀SP��t]W%ߗ�E�b�O҂�Y1��>�H��t���e��d`��8��2�S��v�6.1�����R���B|��ۥHmOv���zD�b��{�۴� �O��N6�0��z��
���Q��D��9`!�`)�Cj�@5��;g<loN��I�`
��7f<}(=�1��+os��SpFzT��$z�1��� ��\���_y6R�Bm%k"@7�����������.>���(�7�:�a�����DA͇���&	�_w%�	�RC���r>���]ہ�o��D�"J䩢#U@��W�n[� � K����V�yok���<������	Z~}��-�Fν���,j4���S��օ�+,U[H�(	�����Q
o'is,u[?x^W���bnp�B��l��TS0���s��=�:�oa���r�1T��T�V�\[��)lQ`)���t��q��u�S�6A�������To�w�bZ��#����o�K�B�����	��RgΔ�ƼI1}fcB��.��Uy�/Uzܾ}��`�Q��):�<��k����R������|���K�+h���/A�.7n6q;�Xj�~ ��U(��=�sLb��p!9����k�tph�]�.�FTC�=brX��GM,E\?y"��i,�c7��8�Bs=����^�B���;S`���
��nK�m���� a
�5��y[�����kOx�]�)0#4pn���1���E�ٝ.VTw�P��3�k��K�~���-��[���SU�%�<.T�ڜ{��_����諳�KT�S<�ٰ%��f�;��%�5��>�s�L!9�܎,w�����[�S4Di�5���)�"h0C�&R�E�RDEm0��-�L!E��B��WE�Y��5ۃSDD��gzFə���ci�S,��(��ع-5�N�
��	k���6�UM���絽tյ3�a*JS�[z��c���\ob)�Bz�&����GC���2 a
�� S����IZv�N��9K��@~����M����;�`���椶_y>���c�Ir�Sp��J&�x9�UA��`c4b{�،�Ϟ��L�i1j��q����DNE�[��ȝ�b跰Tp!5���8��ak�ga��Bj�{��;�9����jkäK���5�*8��aө���?,LQ�f#9o���M�a�=��E�/cz:_��-����-{�6;j]'��-�31[����X���q�ӇQ��-�� �(R�Ec�+3�}��;��-��w�YV�7�K�ܭ�`
�����
�1�ahж0�C��T�E�l�m"��V��u��s�!�p0c��L*v�7No����s�h��<��J�-��؉o��nP��#���l�y�!��)�T���U�\jF��Dq��M@��g�׼���^8�a�S�d��<�i2P-��^����k6��6�����?QAG�!c*�Bj^s�b���nzR��`���'�$r�EGwe�Yc!�`��B���Lyat�;�H��rs�#B�͍��_�������n,4����ɞ��?L���)e�
#�f&�% a�&�A�3]���s����d��c* �j�����A��H�F����0 �~�)n�-��UDؗ�9��2��1�����0��c/��7s��� ��`']���7��+�6	<}�����m�gSj"�099}*�y��1��W��a{ᄽzҒh�����@p�����@d����1�i0�!8� *��Eɱ��q6�g<�Qݨ�pN���V<�@�'#4��8���f�[��n<����m���Щ���;����$�h��D�����<�m�My��)&������RC(n/ht�&h0Տ�4导���	]g�������F������췉L!��c��͓��c�0�<�b2�c�s��o��p|k��ق���)(�,��mo�����E��a���\�M#�z��BȎ��B�U�`
���]��w7�E��z
�22�u�A��)�t7��ڰ򅩂�	��idX�������c� Cp�٧��$����6H�H`�"�~�۽�ZB'��=�yx������j��H���ir�Ne]�� @�)8�k����B�n���b� b�!C�T�W��cE~�,ID�L���\�P�wOC%_^ڰ%������b�Qxk-��ĸ���*2�ǐ�*'�	��%���TF��4�{[�O�����1���ʇsȖ�TF��"a��2Z��М��oSp�״�����9����s��AH��)�9<�������;$��]��B�;ܲ�D�����w�(]bhG�p�De�f,o�.,��y�Ŝ%C/�����U��M0�}���z{��1��<��z�(Wr�L�O�k6��L�~HNh�pr��(�IFTn���0���Dꣀ�Čنu�NL� <a��(p���wb���1�!<�ƨW��ڑ�De��c*�cjj��6Β�`�nİ��3#�F1�!@fq_	SG�d�vM�>����T�䈪)�sH��8�����1�!8.\g�s�x�m�ц�=cL�~HNh
���Y�A�:� �n0U�!<_��+=�y���hB�)�Z?��)o�G̺Z�z�Mo����=��:'�G?S�#m4�IJ�d�Sm����,9lc
MV%��P��:�-��Le,A�x���l4�PX*3�J�-�ݺ�3i
��
�9��<n��I�?N��L���.*o����HLQ�$,ܣ���=p0EB�U'��g+������	�=�5�%����6��s�`
�����I`��_yD+o�k��n��	�0i2�
G�,FO��^��\Ϲ���5Lp�[V�q;�`��5�����%(p��F��0�A�*� W{�L�z@�Wb�c��4�B3R�>�*==�5z�M`��)6�<�:�R����0\s�h0�f�ƫ>���m�m)^�����5�KfJLֶ�f�MM0��rM�A���VO��
hInC���@�"s=��J�jg��Ӻ,X5�JL1�^#���u�q	jm�ߛ�J LQ�jy��|��e�nͶLa�Q����2#������]0�
�J������0�15���Ǩ�a�30gr�}
8�b2����k)������o�<��2�����s���� SX���ӭ��pZ�����,L%~�����7�Qh�.����5_��'�4yn���"p0Ee�H2*9�9U�o��\Ԗ��ă�M|EV+��t�+}����S�!�g׾��e��)n.�AW�9S�
t���38]G	w�;�`���׹Dj�M�    ���60��T� }Yc.�u�}�X��8�s=�̮����69H��`�����]~��2�*s�6�����S\Fi�{"��m���fo�k5��3�0�f��S��94�7��=%4x0�z��
�
�
*m��4KN,]b��C�6�s�g���Z*�`��(L�4W�a�6[��lV.1��15���&�����nwݒ7��1��Lp�s�����,�=͝��S��	���3�w�^����܃�����5g/8,�h���4���T���h��(�+9���D�@56���.�|ݑ��	���%�=��a*�k��C5��Az�_mSj��N��0�E��5���*���d��.��;���Z*9�a����>� O�����|JOk*��L*n��Tv����cTr�[�]� OtFp�gVj�鞈����G��c��k���m�jAzX�eQ��-׎�/LuwPW��U�h$�r>v�,�`��Cp�r'�����zD�bW���ϙi���6{���P��
� �h6�$X��Tz�u���kW�uj�_���o@7i<�ts���\�ퟷՃ�Y7�X�#a����ɕi�3·�(L5x�
4M�`��L�1U��+P_�35��� ���A�E'�k���q�@��>N�,5'2}�8�g���k���6�Y{��KP�hi�M�a~��R�|���(v�O�p����L!���:��,�3��M��-L��:��t���+C1,xT��!�6��:���͒pq8��V��ߡ5��:���#�4D��>GT���V5���~k���c��Cj$���Zj��������K�Us#ƽMr�b�w��nn;ʺe�K��'��S^�a�Qk���5��a����D��9�5�߳a�¶6��;$�+��Z�M�/6-�q�����#�9�R}8�Hr����hp�c��<b��ȓ4����mL�����v��8w��m^�2�I`��)�a_۫\A!�e;���O,�wH�!���)ǂ�NЛj��'Xj�О�� �M��3��0��z�	�]r�]��3R��<���Ͻ�v�_aBG+ox�� ]K���%񲼀bK�M�<w��`�����i.9�qIl����$�j74���EX1Gn���
S4��x���w�*�Ƒ�e$Xc)uCs�o�N�-@�,=Y��%���	��Xk�sڧ�^��v�t,�nT���6A�^��c�_��X8@ �R���D�D<�������J�4�Z��dyٮ��D���:�B74�y�B��Eנh�G����5��<ȶ��$�����h��g�����ܟ(=탠���N�d�T�Q5wO��Z�`�+�C��+��a�_2���Ɂ㼅H��<�Pfo����@��`=(������J�8��&�V.x0�A�'2���W���&�����9�s%� �`4��������S}-f	c/8q��P� ��U�"�=�fє�B4�B!JSܸU&Y�	M�ޥL����6�)3��1�<����`X�{�W�v�i���VI����4F������5��~FuO��,En?hT�����h���1h0�oy��6�t�$����z�����0E�zЗ�O�������#�2���)2�s|O0+�t�"�j:.�@��R���T�z�̵#e��n���\����bs���6W
��\Ot!!��BZ��$�Z���-!��&�=���,�s�F0��p0�d\������	8�B2��cFGH�@�9KMS�Qrnӳ�J��GS����ex�+��h0�z�+/��$2�%������-�ޖO#^����sD�yS�"`=G�T�z�tz������� �Ҙ�� ����]j42B8�`=�U���.�D���)��"`��D)R�
�JH{AQ��	@�b 
T//i/>MK�5X�ɨ�+1�mvP�a���bԣwP�@b�&Cb`���v�+:��d�M��AK1��
���K��\��n��[�b)&���U��$#�l�>cL�/���K�,���K�G�ҕ`���QP��Ǐ$�O�㣴�5^�n �:�����v.�u���5�������
��=�M7n�0�R���(������̴P����N��O7���7d�5���0s�4����"4P�U8J{�����}�K��c����S,A[����|��$,5bh�3+����N��{BLa�f�>o���PzF�(�h#n��h剔��+Ul�/줱	��?���!9���P���z��Ȁ�)�8�7N6o:��m�S���U~װ�h�&���蘢`���.5)/��.;��`��5��y�	^r9/Q�릓(��ձԇ�Q_�թb���c�a���T��KЪ�QG�LXS�R%�/A7v�����r� ]2�׽�%g�9����C�`����B�h�t��O�in�Sx��2����"w��X��>_�`� X��~�<7��b�<�瘝�#�`
�M�!���p�B0zs2� ]��OQˍ�Ҥ4c�R����0�i�I�\���Re��Ͷ*�s�Ԉ!9�=NW(5����6�t�G�R ��D�������Vkq��L��&� o�k���%(������ed,�aHPy�U$l�1Xx�-�?`)Csގ3(I�hv�1[	S|F��gP��~G�E��K�Z�:Π�p�1>I�q#�]�)�3(9����m�	�;�"��O�l��m_�3(=ͽ׾	O����Q��qT��i�L���-L�b�kۨ���Y�Nv=�`������� ����^�J1�<Π�:3��Dc���\��r�A陰��mN� <��s��u�A�qEő�� ��+Lq�&� o�z�A	�,��/A��Z1�봫�-h�?�0���)2�+Pʙ�����Sl�7�ď�t!J�����Ȣ5��)�k�A�J����qO��0��T3Fդ�m���N���v{1�!@�qT��p<���s�#h0Eh��y�A���yϿ���������|�׵��&�S�F���J��[̘>sv��T���3���2)��S��`*_�j��fq�A�����rJ,��8��h���Σ-���O�����C����E�c�v�S������[��g�s�S)��ȼ�����0zr̞Kd���Mm�{���6�GzO�e��7#}�]��1	�c�d��$%��dĩM�7�\�ӹK����h����K<�8��p[��w=zs��{�s�z!υ�/��X���;$�̧�����繹��þ�j��e(�a�z���ʲ۶d�c�5��ax���>��ی�G�|{z�W�瞧�L�{$�����9-��}��	�k�և/��qW�[9�z9m�zC�9&�Ί�i�R�?_	����ū���\6��9�6!kT��Y�����<����!q���lN�R�ۤK�T�r_��}"`ԩy\V��x���q�ߟ0_��RǺ"���w
'^��e�㏷���d�u�Ovv�̞}E���?S91�I���e��� 8^��ٍ��\}���|�*�'�mf+��� �uM�,=H���1�ɤ�����|�6��#��{�����ؿ��5�X�n*������X�e�ϗD#y�G�O��67nJ�����hS�-X�y���u�~�k�}��m����xM���u'�u��Ǽ�%k�&b:˟#��=���&*F��d<ﴎ��٫=���\0�gq�>���6����ߒ��-Ak�Ol�Rl.%%."���4�K��\�����fa����8<����J�$��[-o�캑;��Zgqf��+�L�����:\r��=2��Ϸ�p�^03�یHz,j��;�0g�8L���� *8���E;�p�������\c:���z 8L���y��o�I</}�d���q�no��h}�gj`\oT2��\��n�)w��c�\�k��ŉ`�'�N�2	p�Bs�����a��� }P��N���4��!m��R36IE b��u��7�|������n��i�w'�L��s���š    C#�}>���#�;I7�R7���%N�M�V���8ͩ�v���uã�|��C���cQw�����i��3���	�ޠ˧���)F,�볪�(���8+uט]�Y3^N{l�����ܞt�� �����4���(��n�n�RGRԲ�7b���=o��bkb.[��h�:)�0��E�1O��/���L�{e�v�m[�t��=34�fD
�0��]��:^}yzFb����e�盺=u��XY�j����>L�����IP�{�9�?�R�u>��tlH��V�Fs�i�	��h�}���3YN6�!��V��Jf��̚��3��~ƺdv�u6�f�\�s!��Lhf�ϟ/��k�3����f�)qb���и�c����t��^��br�8��;D�-�q�d��&[m�d.����~p6���jt��d�n�z��J���O�C�ܙG�pYc�V<�=7㸧 S�6s�<>�����x͑����UԼm��ujҍ53\��	���0@�;0�q}�����N�&:{�7Ƶ}\6yj/��0�/ZE��o$�&�uC>�7Z��D��mr�ҭ=�0E�o>��	&��9`���\����>%�Ô�*�m_is��2��x�t/� �������Ȉ��㽴?��%��mm�?��0��kl��PO��/�|/JO�v{�5O[�Ԙ�IG�l�����yH]��j��i������<w	�\&f�ntVs���Q(�`��3 �<��|8�?���_�X�_F�ks*Q��aաs�{�FE�^ S�Ѩ��Ǔe�S��~6�#��lwOq_��`:���E�'���s��H�zL�����}k4�Z�Ld�c����u{O���=����@��?��+.�΢�v�l�ݵi��U��Ѣ��K�8L�F.�jr,m}���N��7�<i��k�O��@�� 6L�E������<��z�ͭ����Mnͩ��\��i>�,�\�>���mx����&�����T6�*ۚ)ђdZ�ƶv��d'p�\����I�<c�s�3'�&�b���h0J[�dиN�3�WL�����e�?J�;Ƈ"�����0��Mڟ�ǫ7�e��9�4�����Z��7$����<Wvh�/�%�cQ^�&�
����cX>X�נ�H縴���~��N����[�I�?�|nǘ:�:[��]�M����7��h|��1[��u;�L�6
'��L��7`�/���m�I6e;�!��ޭ��ۭ+ڭ�-�a�iklp^�!��w��^��1��to��t0�r[u�p�:�\�&��#�BNS�
�]]WǾ�n��4r�1i�x�a�fkV �%���;�tT9i�g�ijz��=�:�UϘ����V>2r�'�5˥�����;vuֺ�I��&Cz��w��0�}�����3o��}i�����z��ju��9����L�q�;��W�^�݌�9P>h���~��z����W-���p5ӯ�~>ꛇ�Kv2J�0��p1�o��T�Mt�
'ȣ%L�?\��H깂+�sHa����a��õLş�k��qD�i��s��p�6��2�_0)S��])��%���T��~����"����s6eK	�X���>����	�W�!�uezVr�`���M�U�z��n���~���2��	��N��ҭG�����J��/7k�4���ٶ�#�ɇ˘~��9����|���a��&Ov�G a
���{� �{X��K�y�Շ����7��%�Yڈ�)>\=�ȶ$��9�cw�s�2�������׳����B>n�x�a�ɖ�@��p��/"/��U�üD2m�O���W���A~F��[�C�1`�z��p��oU{]�N���8�]�!���D)����@��VR�6�F �Q 5�*�����l@���ҡ�/��m�.峜��Y��y��`��J؇�~%�y�q�u ���f�!�6����~�<Fy�x�� ;�-��.����.�}�UP�.������~��ED��ڊ��;��mby�6p0�z�t�`�M�'�Ĺ/�K�s��%X�h�]}U�j����A��s���LնA��kM�=�W�f���޿hT8��>�)O�����r���a|����_8_~V��0!8��3���n�C^�46��vP>\s��u��g4���u!����\�1W�"հ�E����˾�� ����6S��B]��4s�v��	��~���L��z���ңm���0X�p����/����oG���H0�pa�/$W�;��4�.#��8��?��ShFi�ʣ���Q7'�0�"3
9ӟL����a���=*��^$��}�q�xfq�hءWޙ���.?m�̈W:�h��P�?��A�A5��>��ȇ�!%��R^�uB׊X^ޑ�o�����?��c����s����߄s��b������XBd/j���xx6��xt#�-�<���q{H�t���T�:��Bn.�g{���gK�;���09n���ъf�̓���ޏg�0l��Ͷ�g�{�<���H\����0;�����} ���Ic*�uV�+q���%]�)�|z������hd�Op�������3F�9��^o3���e�»ObJv�69L�=��͓4�}r��
�zD),h0��|l����Sr:Z��)	LýzN$�T��i,ӆ�l�8�F{�����`� w9�mo7R�i�� ��ԫp��v�'-�`�!8�H���N��vZ��h0��m���T�w��|�73�l�@����;#�i|n�h���\�g��Q{VEsN认���h0����T�8�'���[����1�k\`�,�֒ELf����1��ƻ&���k̓L�mS{B�=�iWv���)��`������CBnǋ�p�P��(��ʏm�/gJη�j'��@��1�ZH*��h4�Z��☢q=ǀ�D�5Lo�7��ć��é��i��mZ�Qymaս?�WB�&=��qwo��`�"�&�)"���fѳ�,���� �)*�Pđݾt�W+ a��� 6��K�eJ�q}䵕�����U\�x�܊f�u�t���m�`
�����d��*x~�y����(>\-Xj�e� >KV+Oi�M�)�'4�b4B�-Un�	3����\� ���A� Ȫ�Ι��3G&������9�.��G�iߎ:�W�|<.w��8V��3��D��A'��{��+���:����h�`��5�;���ܫ/Lg�Fw3e���pm�o�|�4����G[JS�m4�"4J��1��Z�K�aq�Ù�a`�|��?�{�ӽȘ�2��F��c��I������F5�]���m60����(��Lפ��m]IŜ�ӌZ'o7nz����9�˛FɩJ:�d	������oZj���r\�B/�p���AO2+g�Mݝ=��`m��G9��1W��q��v��6��'�5Y(y�!�j����\���8x�1��eFA�(k���OKb���� ��ޏ�y���\[��Y� OHFpl7��~d��86wk@x�2��=�;�;jI`L�-0��2
�J#(9�fh~��&p0e'���|B�|�Q_2��evsӇ/(,�~Mr֦������E.J4M���������=�����i�!��O��Fc�o����H{�EKNC G�K�5�L��y\����n;����L`@��m��8�Xo���Q\V�J0��p"ï�/Uu��?ym7o\�G�p�G��k2d��X�)6�u�g&�V����5���8W6^��!���)B��y~>��q��j�ld�0U�"=���8��M6x~��׌����_�����f��M&\��y隝㼭� �t:+{�_�g a
����X�)!:��XGoL����%����ٰ��;���y��XoM�s�0G���������˭��z=6i�Y��
zQ��4lmX��9��*z�]伭��=:�Iy����_���ds}�-�t�� ���h{ʹc���i�T���@$��]$b���W���u4f�ϡ?�T܋ =.�z��{#�Mxm> Lu�t͎r��� �Ms[��ݨ����
�` �   ��Ov���u��.�0�h�y֛g X[c?��p�Te���/�zô���
�ÉL�s� ��6���S���a�h���sK�+��7�������!y,Wɑ���w�o������E�y�y���~���_������#Ig<y�i0H�{N�`9��u�p�B�qo�g����P,�7Ѹ��x��^Z������}��U�ܒ� c7,)�s�pp����	]2������������?<p�{     