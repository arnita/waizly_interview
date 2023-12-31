PGDMP     1    '            	    x            postgres %   10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)    10.9    }           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public       postgres    false    3    267            �           0    0    absensi_absensi_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.absensi_absensi_id_seq OWNED BY public.absensi.absensi_id;
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
       public       postgres    false    3    248            �           0    0 "   class_advisor_class_advisor_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.class_advisor_class_advisor_id_seq OWNED BY public.class_advisor.class_advisor_id;
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
            public       postgres    false    264                       1259    17200    daily_exercise_skill    TABLE     +  CREATE TABLE public.daily_exercise_skill (
    daily_exercise_skill_id bigint NOT NULL,
    student_id bigint,
    kd_id bigint,
    skill_value integer,
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
       public       postgres    false    297    3            �           0    0 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq OWNED BY public.input_analysis_tema.input_analysis_tema_id;
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
       public       postgres    false    293    3            �           0    0 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq OWNED BY public.list_question_per_kd.list_question_per_kd_id;
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
       public       postgres    false    3    295            �           0    0 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq OWNED BY public.list_question_per_tema.list_question_per_tema_id;
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
       public       postgres    false    3    226            �           0    0    m_building_building_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_building_building_id_seq OWNED BY public.m_building.building_id;
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
       public       postgres    false    3    216            �           0    0    m_class_room_class_room_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_class_room_class_room_id_seq OWNED BY public.m_class_room.class_room_id;
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
       public       postgres    false    214    3            �           0    0    m_course_course_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.m_course_course_id_seq OWNED BY public.m_course.course_id;
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
       public       postgres    false    3    236            �           0    0    m_department_department_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_department_department_id_seq OWNED BY public.m_department.department_id;
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
       public       postgres    false    238    3            �           0    0    m_position_position_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_position_position_id_seq OWNED BY public.m_position.position_id;
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
    student_weight character varying(191)
);
    DROP TABLE public.m_student;
       public         postgres    false    3            �            1259    16558    m_student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.m_student_student_id_seq;
       public       postgres    false    220    3            �           0    0    m_student_student_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.m_student_student_id_seq OWNED BY public.m_student.student_id;
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
       public       postgres    false    3    204            �           0    0    m_unit_unit_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.m_unit_unit_id_seq OWNED BY public.m_unit.unit_id;
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
       public       postgres    false    206    3            �           0    0    m_unit_year_unit_year_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.m_unit_year_unit_year_id_seq OWNED BY public.m_unit_year.unit_year_id;
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
       public       postgres    false    197    3            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
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
       public       postgres    false    275    3            �           0    0    observasi_observasi_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.observasi_observasi_id_seq OWNED BY public.observasi.observasi_id;
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
       public       postgres    false    3    222            �           0    0    parlookup_parlookup_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.parlookup_parlookup_id_seq OWNED BY public.parlookup.parlookup_id;
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
       public       postgres    false    3    277            �           0    0    pd_pd_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pd_pd_id_seq OWNED BY public.pd.pd_id;
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
       public       postgres    false    3    250            �           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
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
       public       postgres    false    271    3            �           0    0 (   physical_student_physical_student_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.physical_student_physical_student_id_seq OWNED BY public.physical_student.physical_student_id;
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
       public       postgres    false    3    303            �           0    0    prestation_prestation_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.prestation_prestation_id_seq OWNED BY public.prestation.prestation_id;
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
       public       postgres    false    291    3            �           0    0    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq OWNED BY public.quiz_per_kd.quiz_per_kd_id;
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
       public       postgres    false    313    3            �           0    0    raport_pts_raport_pts_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.raport_pts_raport_pts_id_seq OWNED BY public.raport_pts.raport_pts_id;
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
       public       postgres    false    3    299            �           0    0 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq OWNED BY public.setting_daily_exercise.setting_daily_exercise_id;
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
       public       postgres    false    263    3            �           0    0 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq OWNED BY public.structure_tematic_detail.structure_tematic_detail_id;
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
       public       postgres    false    3    242            �           0    0 .   study_group_setting_study_group_setting_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.study_group_setting_study_group_setting_id_seq OWNED BY public.study_group_setting.study_group_setting_id;
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
       public       postgres    false    283    3            �           0    0    tahsin_tahsin_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tahsin_tahsin_id_seq OWNED BY public.tahsin.tahsin_id;
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
       public       postgres    false    3    281            �           0    0     teacher_note_teacher_note_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.teacher_note_teacher_note_id_seq OWNED BY public.teacher_note.teacher_note_id;
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
       public       postgres    false    3    199            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    198            �           2604    17010    absensi absensi_id    DEFAULT     x   ALTER TABLE ONLY public.absensi ALTER COLUMN absensi_id SET DEFAULT nextval('public.absensi_absensi_id_seq'::regclass);
 A   ALTER TABLE public.absensi ALTER COLUMN absensi_id DROP DEFAULT;
       public       postgres    false    267    266    267            |           2604    16824    class_advisor class_advisor_id    DEFAULT     �   ALTER TABLE ONLY public.class_advisor ALTER COLUMN class_advisor_id SET DEFAULT nextval('public.class_advisor_class_advisor_id_seq'::regclass);
 M   ALTER TABLE public.class_advisor ALTER COLUMN class_advisor_id DROP DEFAULT;
       public       postgres    false    248    247    248            z           2604    16778     course_setting course_setting_id    DEFAULT     �   ALTER TABLE ONLY public.course_setting ALTER COLUMN course_setting_id SET DEFAULT nextval('public.course_setting_course_setting_id_seq'::regclass);
 O   ALTER TABLE public.course_setting ALTER COLUMN course_setting_id DROP DEFAULT;
       public       postgres    false    244    243    244            �           2604    16979     daily_exercise daily_exercise_id    DEFAULT     �   ALTER TABLE ONLY public.daily_exercise ALTER COLUMN daily_exercise_id SET DEFAULT nextval('public.daily_exercise_daily_exercise_id_seq'::regclass);
 O   ALTER TABLE public.daily_exercise ALTER COLUMN daily_exercise_id DROP DEFAULT;
       public       postgres    false    265    264    265            �           2604    17203 ,   daily_exercise_skill daily_exercise_skill_id    DEFAULT     �   ALTER TABLE ONLY public.daily_exercise_skill ALTER COLUMN daily_exercise_skill_id SET DEFAULT nextval('public.daily_exercise_skill_daily_exercise_id_seq'::regclass);
 [   ALTER TABLE public.daily_exercise_skill ALTER COLUMN daily_exercise_skill_id DROP DEFAULT;
       public       postgres    false    286    287    287            �           2604    16917    employee_unit employee_unit_id    DEFAULT     �   ALTER TABLE ONLY public.employee_unit ALTER COLUMN employee_unit_id SET DEFAULT nextval('public.employee_unit_employee_unit_id_seq'::regclass);
 M   ALTER TABLE public.employee_unit ALTER COLUMN employee_unit_id DROP DEFAULT;
       public       postgres    false    258    259    259            �           2604    17062 "   extracurricular extracurricular_id    DEFAULT     �   ALTER TABLE ONLY public.extracurricular ALTER COLUMN extracurricular_id SET DEFAULT nextval('public.extracurricular_extracurricular_id_seq'::regclass);
 Q   ALTER TABLE public.extracurricular ALTER COLUMN extracurricular_id DROP DEFAULT;
       public       postgres    false    273    272    273            �           2604    17127     friendly_value friendly_value_id    DEFAULT     �   ALTER TABLE ONLY public.friendly_value ALTER COLUMN friendly_value_id SET DEFAULT nextval('public.friendly_value_friendly_value_id_seq'::regclass);
 O   ALTER TABLE public.friendly_value ALTER COLUMN friendly_value_id DROP DEFAULT;
       public       postgres    false    278    279    279            �           2604    17250     input_analysis input_analysis_id    DEFAULT     �   ALTER TABLE ONLY public.input_analysis ALTER COLUMN input_analysis_id SET DEFAULT nextval('public.input_analysis_input_analysis_id_seq'::regclass);
 O   ALTER TABLE public.input_analysis ALTER COLUMN input_analysis_id DROP DEFAULT;
       public       postgres    false    289    288    289            �           2604    17318 *   input_analysis_tema input_analysis_tema_id    DEFAULT     �   ALTER TABLE ONLY public.input_analysis_tema ALTER COLUMN input_analysis_tema_id SET DEFAULT nextval('public.input_analysis_tema_input_analysis_tema_id_seq'::regclass);
 Y   ALTER TABLE public.input_analysis_tema ALTER COLUMN input_analysis_tema_id DROP DEFAULT;
       public       postgres    false    297    296    297            �           2604    17392    institution institution_id    DEFAULT     �   ALTER TABLE ONLY public.institution ALTER COLUMN institution_id SET DEFAULT nextval('public.institution_institution_id_seq'::regclass);
 I   ALTER TABLE public.institution ALTER COLUMN institution_id DROP DEFAULT;
       public       postgres    false    300    301    301            �           2604    17292 ,   list_question_per_kd list_question_per_kd_id    DEFAULT     �   ALTER TABLE ONLY public.list_question_per_kd ALTER COLUMN list_question_per_kd_id SET DEFAULT nextval('public.list_question_per_kd_list_question_per_kd_id_seq'::regclass);
 [   ALTER TABLE public.list_question_per_kd ALTER COLUMN list_question_per_kd_id DROP DEFAULT;
       public       postgres    false    293    292    293            �           2604    17305 0   list_question_per_tema list_question_per_tema_id    DEFAULT     �   ALTER TABLE ONLY public.list_question_per_tema ALTER COLUMN list_question_per_tema_id SET DEFAULT nextval('public.list_question_per_tema_list_question_per_tema_id_seq'::regclass);
 _   ALTER TABLE public.list_question_per_tema ALTER COLUMN list_question_per_tema_id DROP DEFAULT;
       public       postgres    false    295    294    295            q           2604    16621    m_building building_id    DEFAULT     �   ALTER TABLE ONLY public.m_building ALTER COLUMN building_id SET DEFAULT nextval('public.m_building_building_id_seq'::regclass);
 E   ALTER TABLE public.m_building ALTER COLUMN building_id DROP DEFAULT;
       public       postgres    false    226    225    226            i           2604    16473    m_class_grade class_grade_id    DEFAULT     �   ALTER TABLE ONLY public.m_class_grade ALTER COLUMN class_grade_id SET DEFAULT nextval('public.m_class_grade_class_grade_id_seq'::regclass);
 K   ALTER TABLE public.m_class_grade ALTER COLUMN class_grade_id DROP DEFAULT;
       public       postgres    false    209    210    210            l           2604    16521    m_class_room class_room_id    DEFAULT     �   ALTER TABLE ONLY public.m_class_room ALTER COLUMN class_room_id SET DEFAULT nextval('public.m_class_room_class_room_id_seq'::regclass);
 I   ALTER TABLE public.m_class_room ALTER COLUMN class_room_id DROP DEFAULT;
       public       postgres    false    216    215    216            k           2604    16500    m_course course_id    DEFAULT     x   ALTER TABLE ONLY public.m_course ALTER COLUMN course_id SET DEFAULT nextval('public.m_course_course_id_seq'::regclass);
 A   ALTER TABLE public.m_course ALTER COLUMN course_id DROP DEFAULT;
       public       postgres    false    214    213    214            v           2604    16707    m_department department_id    DEFAULT     �   ALTER TABLE ONLY public.m_department ALTER COLUMN department_id SET DEFAULT nextval('public.m_department_department_id_seq'::regclass);
 I   ALTER TABLE public.m_department ALTER COLUMN department_id DROP DEFAULT;
       public       postgres    false    236    235    236            e           2604    16414 $   m_education_level education_level_id    DEFAULT     �   ALTER TABLE ONLY public.m_education_level ALTER COLUMN education_level_id SET DEFAULT nextval('public.m_education_level_education_level_id_seq'::regclass);
 S   ALTER TABLE public.m_education_level ALTER COLUMN education_level_id DROP DEFAULT;
       public       postgres    false    202    201    202            x           2604    16734    m_employee employee_id    DEFAULT     �   ALTER TABLE ONLY public.m_employee ALTER COLUMN employee_id SET DEFAULT nextval('public.m_employee_employee_id_seq'::regclass);
 E   ALTER TABLE public.m_employee ALTER COLUMN employee_id DROP DEFAULT;
       public       postgres    false    239    240    240            s           2604    16640    m_floor floor_id    DEFAULT     t   ALTER TABLE ONLY public.m_floor ALTER COLUMN floor_id SET DEFAULT nextval('public.m_floor_floor_id_seq'::regclass);
 ?   ALTER TABLE public.m_floor ALTER COLUMN floor_id DROP DEFAULT;
       public       postgres    false    229    230    230            t           2604    16653 
   m_kd kd_id    DEFAULT     h   ALTER TABLE ONLY public.m_kd ALTER COLUMN kd_id SET DEFAULT nextval('public.m_kd_kd_id_seq'::regclass);
 9   ALTER TABLE public.m_kd ALTER COLUMN kd_id DROP DEFAULT;
       public       postgres    false    231    232    232            u           2604    16674    m_kd_detail kd_detail_id    DEFAULT     �   ALTER TABLE ONLY public.m_kd_detail ALTER COLUMN kd_detail_id SET DEFAULT nextval('public.m_kd_detail_kd_detail_id_seq'::regclass);
 G   ALTER TABLE public.m_kd_detail ALTER COLUMN kd_detail_id DROP DEFAULT;
       public       postgres    false    233    234    234            r           2604    16632    m_kkm kkm_id    DEFAULT     l   ALTER TABLE ONLY public.m_kkm ALTER COLUMN kkm_id SET DEFAULT nextval('public.m_kkm_kkm_id_seq'::regclass);
 ;   ALTER TABLE public.m_kkm ALTER COLUMN kkm_id DROP DEFAULT;
       public       postgres    false    228    227    228            j           2604    16489    m_lesson_hour lesson_hour_id    DEFAULT     �   ALTER TABLE ONLY public.m_lesson_hour ALTER COLUMN lesson_hour_id SET DEFAULT nextval('public.m_lesson_hour_lesson_hour_id_seq'::regclass);
 K   ALTER TABLE public.m_lesson_hour ALTER COLUMN lesson_hour_id DROP DEFAULT;
       public       postgres    false    211    212    212            p           2604    16600    m_parent parent_id    DEFAULT     x   ALTER TABLE ONLY public.m_parent ALTER COLUMN parent_id SET DEFAULT nextval('public.m_parent_parent_id_seq'::regclass);
 A   ALTER TABLE public.m_parent ALTER COLUMN parent_id DROP DEFAULT;
       public       postgres    false    223    224    224            w           2604    16718    m_position position_id    DEFAULT     �   ALTER TABLE ONLY public.m_position ALTER COLUMN position_id SET DEFAULT nextval('public.m_position_position_id_seq'::regclass);
 E   ALTER TABLE public.m_position ALTER COLUMN position_id DROP DEFAULT;
       public       postgres    false    237    238    238            h           2604    16457    m_step_study step_study_id    DEFAULT     �   ALTER TABLE ONLY public.m_step_study ALTER COLUMN step_study_id SET DEFAULT nextval('public.m_step_study_step_study_id_seq'::regclass);
 I   ALTER TABLE public.m_step_study ALTER COLUMN step_study_id DROP DEFAULT;
       public       postgres    false    207    208    208            n           2604    16563    m_student student_id    DEFAULT     |   ALTER TABLE ONLY public.m_student ALTER COLUMN student_id SET DEFAULT nextval('public.m_student_student_id_seq'::regclass);
 C   ALTER TABLE public.m_student ALTER COLUMN student_id DROP DEFAULT;
       public       postgres    false    219    220    220            m           2604    16537    m_study_group study_group_id    DEFAULT     �   ALTER TABLE ONLY public.m_study_group ALTER COLUMN study_group_id SET DEFAULT nextval('public.m_study_group_study_group_id_seq'::regclass);
 K   ALTER TABLE public.m_study_group ALTER COLUMN study_group_id DROP DEFAULT;
       public       postgres    false    218    217    218            f           2604    16425    m_unit unit_id    DEFAULT     p   ALTER TABLE ONLY public.m_unit ALTER COLUMN unit_id SET DEFAULT nextval('public.m_unit_unit_id_seq'::regclass);
 =   ALTER TABLE public.m_unit ALTER COLUMN unit_id DROP DEFAULT;
       public       postgres    false    203    204    204            g           2604    16441    m_unit_year unit_year_id    DEFAULT     �   ALTER TABLE ONLY public.m_unit_year ALTER COLUMN unit_year_id SET DEFAULT nextval('public.m_unit_year_unit_year_id_seq'::regclass);
 G   ALTER TABLE public.m_unit_year ALTER COLUMN unit_year_id DROP DEFAULT;
       public       postgres    false    206    205    206                       2604    16900    menu menu_id    DEFAULT     l   ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);
 ;   ALTER TABLE public.menu ALTER COLUMN menu_id DROP DEFAULT;
       public       postgres    false    257    256    257            c           2604    16389    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196    197            �           2604    17083    observasi observasi_id    DEFAULT     �   ALTER TABLE ONLY public.observasi ALTER COLUMN observasi_id SET DEFAULT nextval('public.observasi_observasi_id_seq'::regclass);
 E   ALTER TABLE public.observasi ALTER COLUMN observasi_id DROP DEFAULT;
       public       postgres    false    274    275    275            o           2604    16589    parlookup parlookup_id    DEFAULT     �   ALTER TABLE ONLY public.parlookup ALTER COLUMN parlookup_id SET DEFAULT nextval('public.parlookup_parlookup_id_seq'::regclass);
 E   ALTER TABLE public.parlookup ALTER COLUMN parlookup_id DROP DEFAULT;
       public       postgres    false    222    221    222            �           2604    17105    pd pd_id    DEFAULT     d   ALTER TABLE ONLY public.pd ALTER COLUMN pd_id SET DEFAULT nextval('public.pd_pd_id_seq'::regclass);
 7   ALTER TABLE public.pd ALTER COLUMN pd_id DROP DEFAULT;
       public       postgres    false    276    277    277            }           2604    16847    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    250    249    250            �           2604    17028    personality personality_id    DEFAULT     �   ALTER TABLE ONLY public.personality ALTER COLUMN personality_id SET DEFAULT nextval('public.personality_personality_id_seq'::regclass);
 I   ALTER TABLE public.personality ALTER COLUMN personality_id DROP DEFAULT;
       public       postgres    false    268    269    269            �           2604    17041 $   physical_student physical_student_id    DEFAULT     �   ALTER TABLE ONLY public.physical_student ALTER COLUMN physical_student_id SET DEFAULT nextval('public.physical_student_physical_student_id_seq'::regclass);
 S   ALTER TABLE public.physical_student ALTER COLUMN physical_student_id DROP DEFAULT;
       public       postgres    false    271    270    271            �           2604    17406    prestation prestation_id    DEFAULT     �   ALTER TABLE ONLY public.prestation ALTER COLUMN prestation_id SET DEFAULT nextval('public.prestation_prestation_id_seq'::regclass);
 G   ALTER TABLE public.prestation ALTER COLUMN prestation_id DROP DEFAULT;
       public       postgres    false    303    302    303            �           2604    17276    quiz_per_kd quiz_per_kd_id    DEFAULT     �   ALTER TABLE ONLY public.quiz_per_kd ALTER COLUMN quiz_per_kd_id SET DEFAULT nextval('public.quiz_per_kd_quiz_per_kd_id_seq'::regclass);
 I   ALTER TABLE public.quiz_per_kd ALTER COLUMN quiz_per_kd_id DROP DEFAULT;
       public       postgres    false    290    291    291            �           2604    17483    raport raport_id    DEFAULT     t   ALTER TABLE ONLY public.raport ALTER COLUMN raport_id SET DEFAULT nextval('public.raport_raport_id_seq'::regclass);
 ?   ALTER TABLE public.raport ALTER COLUMN raport_id DROP DEFAULT;
       public       postgres    false    308    309    309            �           2604    17549    raport_pts raport_pts_id    DEFAULT     �   ALTER TABLE ONLY public.raport_pts ALTER COLUMN raport_pts_id SET DEFAULT nextval('public.raport_pts_raport_pts_id_seq'::regclass);
 G   ALTER TABLE public.raport_pts ALTER COLUMN raport_pts_id DROP DEFAULT;
       public       postgres    false    313    312    313            ~           2604    16855    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    251    252    252            �           2604    17374 0   setting_daily_exercise setting_daily_exercise_id    DEFAULT     �   ALTER TABLE ONLY public.setting_daily_exercise ALTER COLUMN setting_daily_exercise_id SET DEFAULT nextval('public.setting_daily_exercise_setting_daily_exercise_id_seq'::regclass);
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
       public       postgres    false    307    306    307            �           2604    17432 "   summary_tematic summary_tematic_id    DEFAULT     �   ALTER TABLE ONLY public.summary_tematic ALTER COLUMN summary_tematic_id SET DEFAULT nextval('public.summary_tematic_summary_tematic_id_seq'::regclass);
 Q   ALTER TABLE public.summary_tematic ALTER COLUMN summary_tematic_id DROP DEFAULT;
       public       postgres    false    305    304    305            �           2604    17185    tahfizh tahfizh_id    DEFAULT     x   ALTER TABLE ONLY public.tahfizh ALTER COLUMN tahfizh_id SET DEFAULT nextval('public.tahfizh_tahfizh_id_seq'::regclass);
 A   ALTER TABLE public.tahfizh ALTER COLUMN tahfizh_id DROP DEFAULT;
       public       postgres    false    284    285    285            �           2604    17167    tahsin tahsin_id    DEFAULT     t   ALTER TABLE ONLY public.tahsin ALTER COLUMN tahsin_id SET DEFAULT nextval('public.tahsin_tahsin_id_seq'::regclass);
 ?   ALTER TABLE public.tahsin ALTER COLUMN tahsin_id DROP DEFAULT;
       public       postgres    false    283    282    283            �           2604    17149    teacher_note teacher_note_id    DEFAULT     �   ALTER TABLE ONLY public.teacher_note ALTER COLUMN teacher_note_id SET DEFAULT nextval('public.teacher_note_teacher_note_id_seq'::regclass);
 K   ALTER TABLE public.teacher_note ALTER COLUMN teacher_note_id DROP DEFAULT;
       public       postgres    false    281    280    281            {           2604    16801 "   teacher_setting teacher_setting_id    DEFAULT     �   ALTER TABLE ONLY public.teacher_setting ALTER COLUMN teacher_setting_id SET DEFAULT nextval('public.teacher_setting_teacher_setting_id_seq'::regclass);
 Q   ALTER TABLE public.teacher_setting ALTER COLUMN teacher_setting_id DROP DEFAULT;
       public       postgres    false    246    245    246            d           2604    16397    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    198    199    199            L          0    17007    absensi 
   TABLE DATA               �   COPY public.absensi (absensi_id, student_id, absensi_type, absensi_total, month, step_study_id, absensi_insert_by, absensi_insert_time, absensi_update_time, absensi_update_by, absensi_delete_time, absensi_delete_by) FROM stdin;
    public       postgres    false    267   -G      9          0    16821    class_advisor 
   TABLE DATA                  COPY public.class_advisor (class_advisor_id, employee_id, unit_year_id, study_group_id, class_advisor_insert_by, class_advisor_insert_time, class_advisor_update_time, class_advisor_update_by, class_advisor_delete_time, class_advisor_delete_by) FROM stdin;
    public       postgres    false    248   ]I      5          0    16775    course_setting 
   TABLE DATA               -  COPY public.course_setting (course_setting_id, course_id, study_group_id, course_setting_status, course_setting_insert_by, course_setting_insert_time, course_setting_update_time, course_setting_update_by, course_setting_delete_time, course_setting_delete_by, unit_year_id, class_grade_id) FROM stdin;
    public       postgres    false    244   �J      J          0    16976    daily_exercise 
   TABLE DATA               A  COPY public.daily_exercise (daily_exercise_id, student_id, kd_detail_id, structure_tematic_id, kd_type, score, daily_exercise_type, daily_exercise_insert_by, daily_exercise_insert_time, daily_exercise_update_time, daily_exercise_update_by, daily_exercise_delete_time, daily_exercise_delete_by, step_study_id) FROM stdin;
    public       postgres    false    265   LL      `          0    17200    daily_exercise_skill 
   TABLE DATA               H  COPY public.daily_exercise_skill (daily_exercise_skill_id, student_id, kd_id, skill_value, skill_type, daily_exercise_skill_insert_by, daily_exercise_skill_insert_time, daily_exercise_skill_update_time, daily_exercise_skill_update_by, daily_exercise_skill_delete_time, daily_exercise_skill_delete_by, step_study_id) FROM stdin;
    public       postgres    false    287   �M      D          0    16914    employee_unit 
   TABLE DATA               �   COPY public.employee_unit (employee_unit_id, unit_id, employee_id, employee_unit_insert_by, employee_unit_insert_time, employee_unit_update_time, employee_unit_update_by, employee_unit_delete_time, employee_unit_delete_by) FROM stdin;
    public       postgres    false    259   N      R          0    17059    extracurricular 
   TABLE DATA                 COPY public.extracurricular (extracurricular_id, student_id, step_study_id, type, value, "desc", extracurricular_insert_by, extracurricular_insert_time, extracurricular_update_time, extracurricular_update_by, extracurricular_delete_time, extracurricular_delete_by) FROM stdin;
    public       postgres    false    273   �N      X          0    17124    friendly_value 
   TABLE DATA               <  COPY public.friendly_value (friendly_value_id, student_id, step_study_id, friendly_value_type, friendly_value_category, friendly_value_value, friendly_value_insert_by, friendly_value_insert_time, friendly_value_update_time, friendly_value_update_by, friendly_value_delete_time, friendly_value_delete_by) FROM stdin;
    public       postgres    false    279   �N      b          0    17247    input_analysis 
   TABLE DATA               A  COPY public.input_analysis (input_analysis_id, kd_id, student_id, number_question, value_quality, total_value, input_analysis_type, input_analysis_insert_by, input_analysis_insert_time, input_analysis_update_time, input_analysis_update_by, input_analysis_delete_time, input_analysis_delete_by, step_study_id) FROM stdin;
    public       postgres    false    289   �N      j          0    17315    input_analysis_tema 
   TABLE DATA               u  COPY public.input_analysis_tema (input_analysis_tema_id, kd_id, student_id, number_question, value_quality, total_value, input_analysis_tema_type, input_analysis_tema_insert_by, input_analysis_tema_insert_time, input_analysis_tema_update_time, input_analysis_tema_update_by, input_analysis_tema_delete_time, input_analysis_tema_delete_by, structure_tematic_id) FROM stdin;
    public       postgres    false    297   .P      n          0    17389    institution 
   TABLE DATA               �   COPY public.institution (institution_id, institution_name, institution_desc, institution_address, institution_telp, institution_email, institution_start_time, institution_end_time, created_at, updated_at, institution_status) FROM stdin;
    public       postgres    false    301   dQ      f          0    17289    list_question_per_kd 
   TABLE DATA               @  COPY public.list_question_per_kd (list_question_per_kd_id, quiz_per_kd_id, number_question, quality_question, list_question_per_kd_insert_by, list_question_per_kd_insert_time, list_question_per_kd_update_time, list_question_per_kd_update_by, list_question_per_kd_delete_time, list_question_per_kd_delete_by) FROM stdin;
    public       postgres    false    293   R      h          0    17302    list_question_per_tema 
   TABLE DATA               ]  COPY public.list_question_per_tema (list_question_per_tema_id, number_question, quality_question, list_question_per_tema_insert_by, list_question_per_tema_insert_time, list_question_per_tema_update_time, list_question_per_tema_update_by, list_question_per_tema_delete_time, list_question_per_tema_delete_by, structure_tematic_detail_id) FROM stdin;
    public       postgres    false    295   nR      #          0    16618 
   m_building 
   TABLE DATA               �   COPY public.m_building (building_id, building_name, building_desc, building_status, building_insert_by, building_insert_time, building_update_time, building_update_by, building_delete_time, building_delete_by) FROM stdin;
    public       postgres    false    226   �R                0    16470    m_class_grade 
   TABLE DATA                 COPY public.m_class_grade (class_grade_id, unit_id, class_grade_order, class_grade_status, class_grade_name, class_grade_desc, class_grade_insert_by, class_grade_insert_time, class_grade_update_time, class_grade_update_by, class_grade_delete_time, class_grade_delete_by) FROM stdin;
    public       postgres    false    210   �R                0    16518    m_class_room 
   TABLE DATA                 COPY public.m_class_room (class_room_id, unit_id, class_room_name, class_room_text, class_room_status, class_room_desc, class_room_insert_by, class_room_insert_time, class_room_update_time, class_room_update_by, class_room_delete_time, class_room_delete_by, floor_id) FROM stdin;
    public       postgres    false    216   bS                0    16497    m_course 
   TABLE DATA                 COPY public.m_course (course_id, unit_id, class_grade_id, course_status, course_name, course_code, course_desc, course_insert_by, course_insert_time, course_update_time, course_update_by, course_delete_time, course_delete_by, kkm_value, course_type) FROM stdin;
    public       postgres    false    214   �T      -          0    16704    m_department 
   TABLE DATA               �   COPY public.m_department (department_id, department_name, department_desc, department_status, department_insert_by, department_insert_time, department_update_time, department_update_by, department_delete_time, department_delete_by) FROM stdin;
    public       postgres    false    236   iV                0    16411    m_education_level 
   TABLE DATA               -  COPY public.m_education_level (education_level_id, education_level_name, education_level_status, education_level_resume, education_level_insert_by, education_level_insert_time, education_level_update_time, education_level_update_by, education_level_delete_time, education_level_delete_by) FROM stdin;
    public       postgres    false    202   �V      1          0    16731 
   m_employee 
   TABLE DATA               ?  COPY public.m_employee (employee_id, employee_status, employee_id_card, position_id, user_id, employee_type, employee_name, employee_working_status, employee_nik, employee_gender, employee_birth_place, employee_birth_date, employee_religion, employee_identity, employee_last_education, employee_marital_status, employee_hp, employee_website, employee_telp, employee_address, employee_photo, employee_desc, employee_email, employee_insert_by, employee_insert_time, employee_update_time, employee_update_by, employee_delete_time, employee_delete_by, employee_role) FROM stdin;
    public       postgres    false    240   �V      '          0    16637    m_floor 
   TABLE DATA               �   COPY public.m_floor (floor_id, building_id, floor_name, floor_desc, floor_insert_by, floor_insert_time, floor_update_time, floor_update_by, floor_delete_time, floor_delete_by) FROM stdin;
    public       postgres    false    230   Cm      )          0    16650    m_kd 
   TABLE DATA               �   COPY public.m_kd (kd_id, unit_year_id, course_id, kd_code, kd_name, kd_desc, kd_type, kd_insert_by, kd_insert_time, kd_update_time, kd_update_by, kd_delete_time, kd_delete_by, unit_id, course_setting_id) FROM stdin;
    public       postgres    false    232   `m      +          0    16671    m_kd_detail 
   TABLE DATA               �   COPY public.m_kd_detail (kd_detail_id, kd_id, step_study_id, kd_detail_insert_by, kd_detail_insert_time, kd_detail_update_time, kd_detail_update_by, kd_detail_delete_time, kd_detail_delete_by) FROM stdin;
    public       postgres    false    234   �m      %          0    16629    m_kkm 
   TABLE DATA               �   COPY public.m_kkm (kkm_id, kkm_value, kkm_a, kkm_b, kkm_c, kkm_d, kkm_insert_by, kkm_insert_time, kkm_update_time, kkm_update_by, kkm_delete_time, kkm_delete_by, step_study_id, course_id, class_grade_id) FROM stdin;
    public       postgres    false    228   n                0    16486    m_lesson_hour 
   TABLE DATA               8  COPY public.m_lesson_hour (lesson_hour_id, lesson_day, hour_to, lesson_hour_type, lesson_hour_start, lesson_hour_end, lesson_hour_desc, lesson_hour_status, lesson_hour_insert_by, lesson_hour_insert_time, lesson_hour_update_time, lesson_hour_update_by, lesson_hour_delete_time, lesson_hour_delete_by) FROM stdin;
    public       postgres    false    212   �n      !          0    16597    m_parent 
   TABLE DATA               �  COPY public.m_parent (parent_id, student_id, user_id, parent_name, parent_id_card, parent_status, parent_nickname, parent_gender, parent_birth_place, parent_birth_date, parent_address, parent_hp, parent_telp, parent_email, parent_photo, parent_hobby, parent_religion, parent_insert_by, parent_insert_time, parent_update_time, parent_update_by, parent_delete_time, parent_delete_by) FROM stdin;
    public       postgres    false    224   �n      /          0    16715 
   m_position 
   TABLE DATA               �   COPY public.m_position (position_id, department_id, position_name, position_desc, position_status, position_insert_by, position_insert_time, position_update_time, position_update_by, position_delete_time, position_delete_by) FROM stdin;
    public       postgres    false    238   �n                0    16454    m_step_study 
   TABLE DATA               $  COPY public.m_step_study (step_study_id, unit_year_id, step_study_name, step_study_desc, step_study_start, step_study_end, step_study_status, step_study_insert_by, step_study_insert_time, step_study_update_time, step_study_update_by, step_study_delete_time, step_study_delete_by) FROM stdin;
    public       postgres    false    208   o                0    16560 	   m_student 
   TABLE DATA               l  COPY public.m_student (student_id, unit_id, class_grade_id, user_id, student_name, student_id_card, student_status, student_nickname, student_gender, student_birth_place, student_birth_date, student_address, student_hp, student_telp, student_email, student_father_hp, student_mother_hp, student_child_to, student_brother, student_child_status, student_photo, student_hobby, student_orphan_status, student_school_origin, student_school_origin_address, student_nisn, student_test_number, student_achievement, student_blood_type, student_religion, student_kk, student_ktp, student_ijazah, student_mother_name, student_father_name, student_mother_job, student_father_job, student_father_income, student_mother_income, student_insert_by, student_insert_time, student_update_time, student_update_by, student_delete_time, student_delete_by, student_tall, student_weight) FROM stdin;
    public       postgres    false    220   �o                0    16534    m_study_group 
   TABLE DATA               '  COPY public.m_study_group (study_group_id, unit_id, class_grade_id, class_room_id, study_group_status, study_group_name, study_group_desc, study_group_insert_by, study_group_insert_time, study_group_update_time, study_group_update_by, study_group_delete_time, study_group_delete_by) FROM stdin;
    public       postgres    false    218   �$                0    16422    m_unit 
   TABLE DATA                  COPY public.m_unit (unit_id, education_level_id, unit_name, unit_desc, unit_logo, unit_prefix, unit_address, unit_telp, unit_email, unit_website, unit_status, unit_insert_by, unit_insert_time, unit_update_time, unit_update_by, unit_delete_time, unit_delete_by, foundation_id) FROM stdin;
    public       postgres    false    204   �&                0    16438    m_unit_year 
   TABLE DATA               $  COPY public.m_unit_year (unit_year_id, unit_id, unit_year_status, unit_year_name, unit_year_prefix, unit_year_start, unit_year_end, unit_year_desc, unit_year_insert_by, unit_year_insert_time, unit_year_update_time, unit_year_update_by, unit_year_delete_time, unit_year_delete_by) FROM stdin;
    public       postgres    false    206   '      B          0    16897    menu 
   TABLE DATA               {   COPY public.menu (menu_id, menu_name, menu_desc, menu_url, menu_parent, type, created_at, updated_at, no_urut) FROM stdin;
    public       postgres    false    257   �'                0    16386 
   migrations 
   TABLE DATA               :   COPY public.migrations (id, migration, batch) FROM stdin;
    public       postgres    false    197   0.      >          0    16858    model_has_permissions 
   TABLE DATA               T   COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
    public       postgres    false    253   �4      ?          0    16869    model_has_roles 
   TABLE DATA               H   COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
    public       postgres    false    254   �4      T          0    17080 	   observasi 
   TABLE DATA                 COPY public.observasi (observasi_id, student_id, step_study_id, observasi_type, observasi_category, observasi_insert_by, observasi_insert_time, observasi_update_time, observasi_update_by, observasi_delete_time, observasi_delete_by, observasi_value) FROM stdin;
    public       postgres    false    275   �5                0    16586 	   parlookup 
   TABLE DATA               q   COPY public.parlookup (parlookup_id, name, value, category, "desc", created_at, updated_at, unit_id) FROM stdin;
    public       postgres    false    222   �D      	          0    16405    password_resets 
   TABLE DATA               C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public       postgres    false    200   �G      V          0    17102    pd 
   TABLE DATA               �   COPY public.pd (pd_id, student_id, step_study_id, pd_type, pd_category, pd_value, pd_insert_by, pd_insert_time, pd_update_time, pd_update_by, pd_delete_time, pd_delete_by) FROM stdin;
    public       postgres    false    277   �G      ;          0    16844    permissions 
   TABLE DATA               \   COPY public.permissions (id, name, guard_name, created_at, updated_at, menu_id) FROM stdin;
    public       postgres    false    250   �G      N          0    17025    personality 
   TABLE DATA                 COPY public.personality (personality_id, student_id, personality_type, personality_value, personality_insert_by, personality_insert_time, personality_update_time, personality_update_by, personality_delete_time, personality_delete_by, step_study_id) FROM stdin;
    public       postgres    false    269   @Q      P          0    17038    physical_student 
   TABLE DATA               :  COPY public.physical_student (physical_student_id, student_id, physical_type, physical_category, physical_value, step_study_id, physical_student_insert_by, physical_student_insert_time, physical_student_update_time, physical_student_update_by, physical_student_delete_time, physical_student_delete_by) FROM stdin;
    public       postgres    false    271   ]      p          0    17403 
   prestation 
   TABLE DATA               �   COPY public.prestation (prestation_id, student_id, step_study_id, type, value, "desc", prestation_insert_by, prestation_insert_time, prestation_update_time, prestation_update_by, prestation_delete_time, prestation_delete_by) FROM stdin;
    public       postgres    false    303   �_      d          0    17273    quiz_per_kd 
   TABLE DATA                 COPY public.quiz_per_kd (quiz_per_kd_id, kd_id, total_question, type_question, description, quiz_per_kd_insert_by, quiz_per_kd_insert_time, quiz_per_kd_update_time, quiz_per_kd_update_by, quiz_per_kd_delete_time, quiz_per_kd_delete_by, step_study_id) FROM stdin;
    public       postgres    false    291   �_      v          0    17480    raport 
   TABLE DATA               H  COPY public.raport (raport_id, course_id, student_id, step_study_id, total_pengetahuan, total_keterampilan, predikat_pengetahuan, predikat_keterampilan, keterangan_pengetahuan, keterangan_keterampilan, raport_insert_by, raport_insert_time, raport_update_time, raport_update_by, raport_delete_time, raport_delete_by) FROM stdin;
    public       postgres    false    309   `      z          0    17546 
   raport_pts 
   TABLE DATA               h  COPY public.raport_pts (raport_pts_id, course_id, student_id, step_study_id, total_pengetahuan, total_keterampilan, predikat_pengetahuan, predikat_keterampilan, keterangan_pengetahuan, keterangan_keterampilan, raport_pts_insert_by, raport_pts_insert_time, raport_pts_update_time, raport_pts_update_by, raport_pts_delete_time, raport_pts_delete_by) FROM stdin;
    public       postgres    false    313   :`      @          0    16880    role_has_permissions 
   TABLE DATA               F   COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
    public       postgres    false    255   Pf      =          0    16852    roles 
   TABLE DATA               M   COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
    public       postgres    false    252   j      l          0    17371    setting_daily_exercise 
   TABLE DATA               �   COPY public.setting_daily_exercise (setting_daily_exercise_id, kd_id, skill_type, step_study_id, created_at, updated_at) FROM stdin;
    public       postgres    false    299   2k      F          0    16932    structure_tematic 
   TABLE DATA               p  COPY public.structure_tematic (structure_tematic_id, structure_tematic_name, study_group_id, step_study_id, structure_tematic_desc, structure_tematic_question, structure_tematic_insert_by, structure_tematic_insert_time, structure_tematic_update_time, structure_tematic_update_by, structure_tematic_delete_time, structure_tematic_delete_by, class_grade_id) FROM stdin;
    public       postgres    false    261   }k      H          0    16953    structure_tematic_detail 
   TABLE DATA               �  COPY public.structure_tematic_detail (structure_tematic_detail_id, structure_tematic_id, total_question, structure_tematic_detail_insert_by, structure_tematic_detail_insert_time, structure_tematic_detail_update_time, structure_tematic_detail_update_by, structure_tematic_detail_delete_time, structure_tematic_detail_delete_by, kd_id, question_uts, question_uas, question_daily, type_question) FROM stdin;
    public       postgres    false    263   
l      3          0    16752    study_group_setting 
   TABLE DATA               K  COPY public.study_group_setting (study_group_setting_id, student_id, study_group_id, study_group_setting_status, study_group_setting_insert_by, study_group_setting_insert_time, study_group_setting_update_time, study_group_setting_update_by, study_group_setting_delete_time, study_group_setting_delete_by, unit_year_id) FROM stdin;
    public       postgres    false    242   ^l      x          0    17506 
   summary_kd 
   TABLE DATA               �   COPY public.summary_kd (summary_kd_id, kd_id, student_id, step_study_id, type, total, summary_kd_insert_by, summary_kd_insert_time, summary_kd_update_time, summary_kd_update_by, summary_kd_delete_time, summary_kd_delete_by) FROM stdin;
    public       postgres    false    311   �~      t          0    17452    summary_skill 
   TABLE DATA                 COPY public.summary_skill (summary_skill_id, kd_id, student_id, step_study_id, total_skill, summary_skill_insert_by, summary_skill_insert_time, summary_skill_update_time, summary_skill_update_by, summary_skill_delete_time, summary_skill_delete_by) FROM stdin;
    public       postgres    false    307   k      r          0    17429    summary_tematic 
   TABLE DATA               *  COPY public.summary_tematic (summary_tematic_id, kd_id, student_id, structure_tematic_id, type, total, summary_tematic_insert_by, summary_tematic_insert_time, summary_tematic_update_time, summary_tematic_update_by, summary_tematic_delete_time, summary_tematic_delete_by, step_study_id) FROM stdin;
    public       postgres    false    305   �      ^          0    17182    tahfizh 
   TABLE DATA               �   COPY public.tahfizh (tahfizh_id, tahfizh_type, tahfizh_value, student_id, step_study_id, tahfizh_insert_by, tahfizh_insert_time, tahfizh_update_time, tahfizh_update_by, tahfizh_delete_time, tahfizh_delete_by) FROM stdin;
    public       postgres    false    285   ��      \          0    17164    tahsin 
   TABLE DATA               �   COPY public.tahsin (tahsin_id, tahsin_type, tahsin_value, student_id, step_study_id, tahsin_insert_by, tahsin_insert_time, tahsin_update_time, tahsin_update_by, tahsin_delete_time, tahsin_delete_by) FROM stdin;
    public       postgres    false    283   ɀ      Z          0    17146    teacher_note 
   TABLE DATA                  COPY public.teacher_note (teacher_note_id, student_id, step_study_id, raport_pts, raport_pas, teacher_note_insert_by, teacher_note_insert_time, teacher_note_update_time, teacher_note_update_by, teacher_note_delete_time, teacher_note_delete_by) FROM stdin;
    public       postgres    false    281   �      7          0    16798    teacher_setting 
   TABLE DATA               3  COPY public.teacher_setting (teacher_setting_id, employee_id, unit_year_id, course_id, teacher_setting_status, teacher_setting_insert_by, teacher_setting_insert_time, teacher_setting_update_time, teacher_setting_update_by, teacher_setting_delete_time, teacher_setting_delete_by, study_group_id) FROM stdin;
    public       postgres    false    246   A�                0    16394    users 
   TABLE DATA               �   COPY public.users (id, email_verified_at, password, remember_token, created_at, updated_at, username, user_status, api_token) FROM stdin;
    public       postgres    false    199   �      �           0    0    absensi_absensi_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.absensi_absensi_id_seq', 106, true);
            public       postgres    false    266            �           0    0 "   class_advisor_class_advisor_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.class_advisor_class_advisor_id_seq', 34, true);
            public       postgres    false    247            �           0    0 $   course_setting_course_setting_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.course_setting_course_setting_id_seq', 502, true);
            public       postgres    false    243            �           0    0 $   daily_exercise_daily_exercise_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.daily_exercise_daily_exercise_id_seq', 51, true);
            public       postgres    false    264            �           0    0 *   daily_exercise_skill_daily_exercise_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.daily_exercise_skill_daily_exercise_id_seq', 39, true);
            public       postgres    false    286            �           0    0 "   employee_unit_employee_unit_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.employee_unit_employee_unit_id_seq', 8, true);
            public       postgres    false    258            �           0    0 &   extracurricular_extracurricular_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.extracurricular_extracurricular_id_seq', 1, false);
            public       postgres    false    272            �           0    0 $   friendly_value_friendly_value_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.friendly_value_friendly_value_id_seq', 4, true);
            public       postgres    false    278            �           0    0 $   input_analysis_input_analysis_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.input_analysis_input_analysis_id_seq', 50, true);
            public       postgres    false    288            �           0    0 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.input_analysis_tema_input_analysis_tema_id_seq', 48, true);
            public       postgres    false    296            �           0    0    institution_institution_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.institution_institution_id_seq', 3, true);
            public       postgres    false    300            �           0    0 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.list_question_per_kd_list_question_per_kd_id_seq', 4, true);
            public       postgres    false    292            �           0    0 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.list_question_per_tema_list_question_per_tema_id_seq', 4, true);
            public       postgres    false    294            �           0    0    m_building_building_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_building_building_id_seq', 1, false);
            public       postgres    false    225            �           0    0     m_class_grade_class_grade_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.m_class_grade_class_grade_id_seq', 1, false);
            public       postgres    false    209            �           0    0    m_class_room_class_room_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.m_class_room_class_room_id_seq', 28, true);
            public       postgres    false    215            �           0    0    m_course_course_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.m_course_course_id_seq', 13, true);
            public       postgres    false    213            �           0    0    m_department_department_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.m_department_department_id_seq', 1, false);
            public       postgres    false    235            �           0    0 (   m_education_level_education_level_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.m_education_level_education_level_id_seq', 1, false);
            public       postgres    false    201            �           0    0    m_employee_employee_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.m_employee_employee_id_seq', 238, true);
            public       postgres    false    239            �           0    0    m_floor_floor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.m_floor_floor_id_seq', 1, false);
            public       postgres    false    229            �           0    0    m_kd_detail_kd_detail_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.m_kd_detail_kd_detail_id_seq', 2, true);
            public       postgres    false    233            �           0    0    m_kd_kd_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.m_kd_kd_id_seq', 8, true);
            public       postgres    false    231            �           0    0    m_kkm_kkm_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.m_kkm_kkm_id_seq', 17, true);
            public       postgres    false    227            �           0    0     m_lesson_hour_lesson_hour_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.m_lesson_hour_lesson_hour_id_seq', 1, false);
            public       postgres    false    211            �           0    0    m_parent_parent_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.m_parent_parent_id_seq', 3, true);
            public       postgres    false    223            �           0    0    m_position_position_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_position_position_id_seq', 1, false);
            public       postgres    false    237            �           0    0    m_step_study_step_study_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.m_step_study_step_study_id_seq', 2, true);
            public       postgres    false    207            �           0    0    m_student_student_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_student_student_id_seq', 2141, true);
            public       postgres    false    219            �           0    0     m_study_group_study_group_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.m_study_group_study_group_id_seq', 28, true);
            public       postgres    false    217            �           0    0    m_unit_unit_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.m_unit_unit_id_seq', 1, false);
            public       postgres    false    203            �           0    0    m_unit_year_unit_year_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.m_unit_year_unit_year_id_seq', 2, true);
            public       postgres    false    205            �           0    0    menu_menu_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.menu_menu_id_seq', 1, false);
            public       postgres    false    256            �           0    0    migrations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.migrations_id_seq', 109, true);
            public       postgres    false    196            �           0    0    observasi_observasi_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.observasi_observasi_id_seq', 3537, true);
            public       postgres    false    274            �           0    0    parlookup_parlookup_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.parlookup_parlookup_id_seq', 92, true);
            public       postgres    false    221            �           0    0    pd_pd_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pd_pd_id_seq', 1, true);
            public       postgres    false    276            �           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);
            public       postgres    false    249            �           0    0    personality_personality_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.personality_personality_id_seq', 639, true);
            public       postgres    false    268            �           0    0 (   physical_student_physical_student_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.physical_student_physical_student_id_seq', 122, true);
            public       postgres    false    270            �           0    0    prestation_prestation_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.prestation_prestation_id_seq', 1, false);
            public       postgres    false    302            �           0    0    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.quiz_per_kd_quiz_per_kd_id_seq', 2, true);
            public       postgres    false    290            �           0    0    raport_pts_raport_pts_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.raport_pts_raport_pts_id_seq', 2086, true);
            public       postgres    false    312            �           0    0    raport_raport_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.raport_raport_id_seq', 1, false);
            public       postgres    false    308            �           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 8, true);
            public       postgres    false    251            �           0    0 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.setting_daily_exercise_setting_daily_exercise_id_seq', 4, true);
            public       postgres    false    298            �           0    0 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public.structure_tematic_detail_structure_tematic_detail_id_seq', 2, true);
            public       postgres    false    262            �           0    0 *   structure_tematic_structure_tematic_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.structure_tematic_structure_tematic_id_seq', 39, true);
            public       postgres    false    260            �           0    0 .   study_group_setting_study_group_setting_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.study_group_setting_study_group_setting_id_seq', 635, true);
            public       postgres    false    241            �           0    0    summary_kd_summary_kd_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.summary_kd_summary_kd_id_seq', 25, true);
            public       postgres    false    310            �           0    0 "   summary_skill_summary_skill_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.summary_skill_summary_skill_id_seq', 20, true);
            public       postgres    false    306            �           0    0 &   summary_tematic_summary_tematic_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.summary_tematic_summary_tematic_id_seq', 24, true);
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
       public       postgres    false    248    3252    218            E           2606    16832 0   class_advisor class_advisor_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_unit_year_id_foreign;
       public       postgres    false    3240    206    248            ?           2606    17703 4   course_setting course_setting_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_class_grade_id_foreign;
       public       postgres    false    3244    244    210            <           2606    16781 /   course_setting course_setting_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_course_id_foreign;
       public       postgres    false    214    3248    244            =           2606    16786 4   course_setting course_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_study_group_id_foreign;
       public       postgres    false    244    218    3252            >           2606    16791 2   course_setting course_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_unit_year_id_foreign;
       public       postgres    false    3240    206    244            T           2606    16987 2   daily_exercise daily_exercise_kd_detail_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_kd_detail_id_foreign FOREIGN KEY (kd_detail_id) REFERENCES public.m_kd_detail(kd_detail_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_kd_detail_id_foreign;
       public       postgres    false    265    3268    234            l           2606    17211 7   daily_exercise_skill daily_exercise_skill_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_kd_id_foreign;
       public       postgres    false    232    287    3266            m           2606    17354 ?   daily_exercise_skill daily_exercise_skill_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_step_study_id_foreign;
       public       postgres    false    208    3242    287            k           2606    17206 <   daily_exercise_skill daily_exercise_skill_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_student_id_foreign;
       public       postgres    false    287    220    3254            V           2606    17349 3   daily_exercise daily_exercise_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_step_study_id_foreign;
       public       postgres    false    265    3242    208            U           2606    16992 :   daily_exercise daily_exercise_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_structure_tematic_id_foreign;
       public       postgres    false    3301    261    265            S           2606    16982 0   daily_exercise daily_exercise_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_student_id_foreign;
       public       postgres    false    3254    265    220            M           2606    16925 /   employee_unit employee_unit_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_employee_id_foreign;
       public       postgres    false    240    3274    259            L           2606    16920 +   employee_unit employee_unit_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_unit_id_foreign;
       public       postgres    false    259    3238    204            ^           2606    17073 5   extracurricular extracurricular_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_step_study_id_foreign;
       public       postgres    false    208    3242    273            ]           2606    17068 2   extracurricular extracurricular_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_student_id_foreign;
       public       postgres    false    3254    273    220            d           2606    17139 3   friendly_value friendly_value_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_step_study_id_foreign;
       public       postgres    false    279    208    3242            c           2606    17134 0   friendly_value friendly_value_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_student_id_foreign;
       public       postgres    false    279    220    3254            n           2606    17256 +   input_analysis input_analysis_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_kd_id_foreign;
       public       postgres    false    3266    232    289            p           2606    17527 3   input_analysis input_analysis_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_step_study_id_foreign;
       public       postgres    false    289    208    3242            o           2606    17261 0   input_analysis input_analysis_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_student_id_foreign;
       public       postgres    false    3254    220    289            u           2606    17324 5   input_analysis_tema input_analysis_tema_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_kd_id_foreign;
       public       postgres    false    3266    297    232            w           2606    17334 D   input_analysis_tema input_analysis_tema_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_structure_tematic_id_foreign;
       public       postgres    false    297    3301    261            v           2606    17329 :   input_analysis_tema input_analysis_tema_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_student_id_foreign;
       public       postgres    false    297    220    3254            s           2606    17295 @   list_question_per_kd list_question_per_kd_quiz_per_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_kd
    ADD CONSTRAINT list_question_per_kd_quiz_per_kd_id_foreign FOREIGN KEY (quiz_per_kd_id) REFERENCES public.quiz_per_kd(quiz_per_kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.list_question_per_kd DROP CONSTRAINT list_question_per_kd_quiz_per_kd_id_foreign;
       public       postgres    false    3331    291    293            t           2606    17339 Q   list_question_per_tema list_question_per_tema_structure_tematic_detail_id_foreign    FK CONSTRAINT       ALTER TABLE ONLY public.list_question_per_tema
    ADD CONSTRAINT list_question_per_tema_structure_tematic_detail_id_foreign FOREIGN KEY (structure_tematic_detail_id) REFERENCES public.structure_tematic_detail(structure_tematic_detail_id) ON UPDATE CASCADE ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.list_question_per_tema DROP CONSTRAINT list_question_per_tema_structure_tematic_detail_id_foreign;
       public       postgres    false    263    295    3303                       2606    16479 +   m_class_grade m_class_grade_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_grade
    ADD CONSTRAINT m_class_grade_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_class_grade DROP CONSTRAINT m_class_grade_unit_id_foreign;
       public       postgres    false    204    210    3238            !           2606    16697 *   m_class_room m_class_room_floor_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_floor_id_foreign FOREIGN KEY (floor_id) REFERENCES public.m_floor(floor_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_floor_id_foreign;
       public       postgres    false    216    230    3264                        2606    16527 )   m_class_room m_class_room_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_unit_id_foreign;
       public       postgres    false    3238    204    216                       2606    16511 (   m_course m_course_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_course
    ADD CONSTRAINT m_course_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.m_course DROP CONSTRAINT m_course_class_grade_id_foreign;
       public       postgres    false    214    210    3244                       2606    16506 !   m_course m_course_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_course
    ADD CONSTRAINT m_course_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_course DROP CONSTRAINT m_course_unit_id_foreign;
       public       postgres    false    214    3238    204            8           2606    25905 +   m_employee m_employee_employee_role_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_employee_role_foreign FOREIGN KEY (employee_role) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_employee_role_foreign;
       public       postgres    false    252    3287    240            6           2606    16740 )   m_employee m_employee_position_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_position_id_foreign FOREIGN KEY (position_id) REFERENCES public.m_position(position_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_position_id_foreign;
       public       postgres    false    3272    240    238            7           2606    16745 %   m_employee m_employee_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_user_id_foreign;
       public       postgres    false    199    3233    240            .           2606    16643 #   m_floor m_floor_building_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_floor
    ADD CONSTRAINT m_floor_building_id_foreign FOREIGN KEY (building_id) REFERENCES public.m_building(building_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_floor DROP CONSTRAINT m_floor_building_id_foreign;
       public       postgres    false    3260    230    226            0           2606    16664    m_kd m_kd_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_course_id_foreign;
       public       postgres    false    214    232    3248            2           2606    25893 #   m_kd m_kd_course_setting_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_course_setting_id_foreign FOREIGN KEY (course_setting_id) REFERENCES public.course_setting(course_setting_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_course_setting_id_foreign;
       public       postgres    false    3278    232    244            3           2606    16677 %   m_kd_detail m_kd_detail_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_kd_id_foreign;
       public       postgres    false    3266    234    232            4           2606    16682 -   m_kd_detail m_kd_detail_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_step_study_id_foreign;
       public       postgres    false    208    3242    234            1           2606    17539    m_kd m_kd_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_unit_id_foreign;
       public       postgres    false    232    3238    204            /           2606    16659    m_kd m_kd_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_unit_year_id_foreign;
       public       postgres    false    206    3240    232            -           2606    17570 "   m_kkm m_kkm_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_class_grade_id_foreign;
       public       postgres    false    210    3244    228            ,           2606    16692    m_kkm m_kkm_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_course_id_foreign;
       public       postgres    false    3248    228    214            +           2606    16687 !   m_kkm m_kkm_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_step_study_id_foreign;
       public       postgres    false    3242    228    208            )           2606    16606 $   m_parent m_parent_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_student_id_foreign;
       public       postgres    false    224    220    3254            *           2606    16611 !   m_parent m_parent_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_user_id_foreign;
       public       postgres    false    199    3233    224            5           2606    16724 +   m_position m_position_department_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_position
    ADD CONSTRAINT m_position_department_id_foreign FOREIGN KEY (department_id) REFERENCES public.m_department(department_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_position DROP CONSTRAINT m_position_department_id_foreign;
       public       postgres    false    3270    236    238                       2606    16463 .   m_step_study m_step_study_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_step_study
    ADD CONSTRAINT m_step_study_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.m_step_study DROP CONSTRAINT m_step_study_unit_year_id_foreign;
       public       postgres    false    208    3240    206            &           2606    16574 *   m_student m_student_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_class_grade_id_foreign;
       public       postgres    false    3244    210    220            %           2606    16569 #   m_student m_student_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_unit_id_foreign;
       public       postgres    false    204    3238    220            '           2606    16579 #   m_student m_student_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_user_id_foreign;
       public       postgres    false    3233    199    220            #           2606    16548 2   m_study_group m_study_group_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_class_grade_id_foreign;
       public       postgres    false    218    210    3244            $           2606    16553 1   m_study_group m_study_group_class_room_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_class_room_id_foreign FOREIGN KEY (class_room_id) REFERENCES public.m_class_room(class_room_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_class_room_id_foreign;
       public       postgres    false    216    218    3250            "           2606    16543 +   m_study_group m_study_group_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_unit_id_foreign;
       public       postgres    false    204    3238    218                       2606    16431 (   m_unit m_unit_education_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_unit
    ADD CONSTRAINT m_unit_education_level_id_foreign FOREIGN KEY (education_level_id) REFERENCES public.m_education_level(education_level_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.m_unit DROP CONSTRAINT m_unit_education_level_id_foreign;
       public       postgres    false    204    3236    202                       2606    16447 '   m_unit_year m_unit_year_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_unit_year
    ADD CONSTRAINT m_unit_year_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.m_unit_year DROP CONSTRAINT m_unit_year_unit_id_foreign;
       public       postgres    false    3238    206    204            H           2606    16862 A   model_has_permissions model_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_permission_id_foreign;
       public       postgres    false    253    3285    250            I           2606    16873 /   model_has_roles model_has_roles_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_role_id_foreign;
       public       postgres    false    3287    252    254            `           2606    17095 )   observasi observasi_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_step_study_id_foreign;
       public       postgres    false    208    3242    275            _           2606    17090 &   observasi observasi_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_student_id_foreign;
       public       postgres    false    220    3254    275            (           2606    17422 #   parlookup parlookup_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.parlookup
    ADD CONSTRAINT parlookup_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.parlookup DROP CONSTRAINT parlookup_unit_id_foreign;
       public       postgres    false    204    222    3238            b           2606    17117    pd pd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_step_study_id_foreign;
       public       postgres    false    277    208    3242            a           2606    17112    pd pd_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_student_id_foreign;
       public       postgres    false    277    220    3254            G           2606    16906 '   permissions permissions_menu_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menu(menu_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_menu_id_foreign;
       public       postgres    false    250    3297    257            Z           2606    17696 -   personality personality_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_step_study_id_foreign;
       public       postgres    false    208    3242    269            Y           2606    17031 *   personality personality_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_student_id_foreign;
       public       postgres    false    3254    269    220            \           2606    17052 7   physical_student physical_student_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_step_study_id_foreign;
       public       postgres    false    208    271    3242            [           2606    17047 4   physical_student physical_student_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_student_id_foreign;
       public       postgres    false    220    3254    271            {           2606    17417 +   prestation prestation_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_step_study_id_foreign;
       public       postgres    false    208    3242    303            z           2606    17412 (   prestation prestation_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_student_id_foreign;
       public       postgres    false    220    3254    303            q           2606    17282 %   quiz_per_kd quiz_per_kd_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_kd_id_foreign;
       public       postgres    false    232    3266    291            r           2606    17344 -   quiz_per_kd quiz_per_kd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_step_study_id_foreign;
       public       postgres    false    208    291    3242            �           2606    17489    raport raport_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_course_id_foreign;
       public       postgres    false    3248    309    214            �           2606    17555 '   raport_pts raport_pts_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_course_id_foreign;
       public       postgres    false    214    3248    313            �           2606    17565 +   raport_pts raport_pts_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_step_study_id_foreign;
       public       postgres    false    3242    208    313            �           2606    17560 (   raport_pts raport_pts_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport_pts
    ADD CONSTRAINT raport_pts_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.raport_pts DROP CONSTRAINT raport_pts_student_id_foreign;
       public       postgres    false    313    3254    220            �           2606    17499 #   raport raport_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_step_study_id_foreign;
       public       postgres    false    3242    208    309            �           2606    17494     raport raport_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_student_id_foreign;
       public       postgres    false    3254    220    309            J           2606    16883 ?   role_has_permissions role_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_permission_id_foreign;
       public       postgres    false    3285    250    255            K           2606    16888 9   role_has_permissions role_has_permissions_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_role_id_foreign;
       public       postgres    false    3287    255    252            x           2606    17377 ;   setting_daily_exercise setting_daily_exercise_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_kd_id_foreign;
       public       postgres    false    3266    232    299            y           2606    17382 C   setting_daily_exercise setting_daily_exercise_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 m   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_step_study_id_foreign;
       public       postgres    false    299    208    3242            P           2606    25888 :   structure_tematic structure_tematic_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_class_grade_id_foreign;
       public       postgres    false    261    3244    210            R           2606    17266 ?   structure_tematic_detail structure_tematic_detail_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_kd_id_foreign;
       public       postgres    false    232    263    3266            Q           2606    16959 N   structure_tematic_detail structure_tematic_detail_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 x   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_structure_tematic_id_foreign;
       public       postgres    false    263    3301    261            O           2606    16946 9   structure_tematic structure_tematic_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_step_study_id_foreign;
       public       postgres    false    3242    208    261            N           2606    16941 :   structure_tematic structure_tematic_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_study_group_id_foreign;
       public       postgres    false    218    261    3252            9           2606    16758 :   study_group_setting study_group_setting_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_student_id_foreign;
       public       postgres    false    220    242    3254            :           2606    16763 >   study_group_setting study_group_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_study_group_id_foreign;
       public       postgres    false    242    3252    218            ;           2606    16768 <   study_group_setting study_group_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_unit_year_id_foreign;
       public       postgres    false    3240    242    206            �           2606    17512 #   summary_kd summary_kd_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_kd_id_foreign;
       public       postgres    false    3266    232    311            �           2606    17522 +   summary_kd summary_kd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_step_study_id_foreign;
       public       postgres    false    208    311    3242            �           2606    17517 (   summary_kd summary_kd_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_student_id_foreign;
       public       postgres    false    220    3254    311            �           2606    17458 )   summary_skill summary_skill_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_kd_id_foreign;
       public       postgres    false    232    307    3266            �           2606    17468 1   summary_skill summary_skill_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_step_study_id_foreign;
       public       postgres    false    307    3242    208            �           2606    17463 .   summary_skill summary_skill_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_student_id_foreign;
       public       postgres    false    3254    307    220            |           2606    17435 -   summary_tematic summary_tematic_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_kd_id_foreign;
       public       postgres    false    3266    232    305                       2606    17473 5   summary_tematic summary_tematic_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_step_study_id_foreign;
       public       postgres    false    305    3242    208            ~           2606    17445 <   summary_tematic summary_tematic_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_structure_tematic_id_foreign;
       public       postgres    false    261    305    3301            }           2606    17440 2   summary_tematic summary_tematic_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_student_id_foreign;
       public       postgres    false    220    3254    305            j           2606    17193 %   tahfizh tahfizh_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_step_study_id_foreign;
       public       postgres    false    208    3242    285            i           2606    17188 "   tahfizh tahfizh_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_student_id_foreign;
       public       postgres    false    220    285    3254            h           2606    17175 #   tahsin tahsin_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_step_study_id_foreign;
       public       postgres    false    208    283    3242            g           2606    17170     tahsin tahsin_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_student_id_foreign;
       public       postgres    false    283    3254    220            f           2606    17157 /   teacher_note teacher_note_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_step_study_id_foreign;
       public       postgres    false    3242    281    208            e           2606    17152 ,   teacher_note teacher_note_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_student_id_foreign;
       public       postgres    false    3254    281    220            B           2606    16814 1   teacher_setting teacher_setting_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_course_id_foreign;
       public       postgres    false    246    3248    214            @           2606    16804 3   teacher_setting teacher_setting_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_employee_id_foreign;
       public       postgres    false    246    3274    240            C           2606    16969 6   teacher_setting teacher_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_study_group_id_foreign;
       public       postgres    false    218    3252    246            A           2606    16809 4   teacher_setting teacher_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_unit_year_id_foreign;
       public       postgres    false    206    246    3240            L      x���=n#1��z|
_ Q���-�l�6�?ǒ#����&AH�W�-׃J-��AG;����!�/
_!?)�TFd�����T��*ڎ�sV߸�0��Ch�k��9��$͉�<'�C�ud�T��f%Q%�R�$K���(��%�R�$[��b)QR-%J��D	[J�tK	�,%J�R�$ZJ�$K)f���M����V6�r�'l�EMV6dIa]SMrMQ�]S��5�5EMsMQî)j�k
�\SԐk�L��蚢&���ɮ)j�k��ꚢ����a�5�5M�}�e�Y�>��C��'M��׼|�9Ii#�+�J�9MI���Y���}�t%igJtd���y|�J���.r�%+!!	&e.��M���W��^17�j�˿rL�MӞF�Ao�.iS��X5!4b2�I����i�AG)�!If5��H����,(�:J�"MGY_<��(�yG��!$#P�{��
}�؇<�Ր��< oM�q>��-�-�y���irzߛ$���� l�����r�"�-�=��ȹ�O����x�Ev2�      9   A  x�m��m�0���]��L�{�N��?GE
���>I�N-(��[�7�%c������}��5���-��[��%<"�7��^����`�V�+��f������^�IP!��1�LW�8&i���GW�p�dp�F�b_i���8�~0�D��z�0���n4[/����a�Z�D�Fwq4�Ǽ�i"�X�<��{E0?��]2��.1Џ�Ѱ���)G���t�������e�9�$��:�ik��`�D���&w�NH,�����y����zՠ��I�zo��ZXcY�֋6h�p�J�}�j�<?��A��_���y�?9��      5   �  x���Kj�@��|���I-��9����1�©.h0xa>��
b���.W׷�[��������}��#���=aR6�Kl�"mS��M�b�I����61r�����	C2��p���cz��a�(��xY��3��D�R�HT
�BEC�P�a)�X
#��J�r�2��*�wϗ��:�>��"P[T$*���J���R��*,����J�r����{��PRP)Tĺ�6�"N��R��KY��.e!��R�D�u�a��I�RH��FO@��Ie5B�X��<D�����F$���0V#�j��-*�ޢ�-J�ޢ�?����[�����PVc<���0V#�j����V#�j�n:*ণo:J�#$o�_�
�t��MG���8���      J   1  x���=j�1��Z�)r���տar 7.�]�J�o�t��"�B/
���K���x??����]`Vp7�O��}`\�]�.�����C��03Bae����0�7L�3d��g�B�� Z�@�U"f9S�D�r�v��L�
=��"b�+5M�6Wj�X$5���F#�HlD�6"�$7"QIoD����D'��A�#�$G$I�Hl���F�# �	'��J�#�$G$:INՈA�#�$G$I�Hl��hF�# �	'��J�#�$G$:I�H���$9"�HrDb��hD7�� I�Fܾ���`�ԓ      `   �   x��ԻAE�x�
7`��|w���8������D@r�+P0�(()_��'���S��w���Ѫff�43+g���3�(�4�)cI�,3șmFs�0�rb�'%K����)�ZX��}�ph�RY4}�,Z�Um+�_+�T|�,��E�eQ�����`Y4|�,�>X�,�Yw�DG����%B�$�,�Z�D=K��%���h�`I�C�$:B��^����w      D   +   x�3�4�426��CC\f`s,2�`,2`3,21z\\\ ��      R      x������ � �      X      x������ � �      b   *  x���1N�0��:9 ywm��Cp�� � ��'�,#!�Y%E�S���t���&�u{ܞ�^^?�-Z������~���u�E{�ڢ��uё���*�����^���j��E-A�,[3V���I4����c��Xc¶�c���c�z2aG,2agL��Zb�	+�Ʉ��d���׫����u��y$eCI�GR:�Hʁ4�r�����0�R�ER*�HJCI�6���lm���ϯ�_�9�Mʁz�r�ݜ��&��ۤTT���f���ؤl�5);jMJG�I9��r�Yae+qVXy{����2N>      j   &  x���1N�@���> ����}N��)I��q�ń��$��On����"��E�������q���h��,�S���U�6n�+�N�k�:c봃�� *B���_/��i��cZe�6�1VJ�C	,�k̃��`p��0��B�c"���G���[*��������%���PM� ��z ��x ��v ��t �S9 z�S%�WĚl�ɉ5�\�k��&'&a�S���2��.��*�S�:R�����֒jPI-�����pZ��p���p���p�qt8qt0=�����>3      n   �   x�M��
�@���W�P�yj��7�eP���+ņ�1L��>#��n�������)�v{U�kV,�`O/��:m�#ۂC:��=�����F�HPj3 � ����([��yhbe�e���u��Ɯ'{�V�ZC��.����A������_�3� ��$��W��T�7�      f   @   x�3�4�B##]C 2Q04�20�25��#.#��Ts�Ԣ�4�24EQiTeD��=... k�5      h   A   x�3�4�4a#]C 2Q04�26�2����C C.#N#"Uc7����E��	v3������� �O      #      x������ � �         v   x�m�;� �N�4첋JG���Xh����'۰�L2ͼb��)Ǜ�����l˞�������0:?$��,�/�E�ز�+�bC�2U��%�����XYV��r˪�Q�(6���[zk���I�         `  x�}�1n�0Eg��@
�i����z�,t�P���4h4����l`�u�~�j0`�tJ�	�$�����5bۖ������>e�.�,��hVt����"�Ѣ�٢���Ţ�-|DY�ݢ�G)8�ܶ[S	j"A<�UQ[S	jj�GtQ��T��H�e�����=q��c�G۴��cP���� �,�5jۼ��r�*�6/yg��Xu���Q%�cU*�^�^�}r��R��?�����5���tT(�tߘG�K�w)?MT�p�R�>T��	�������w�Cu{mT�?�-�k�SC��zmT)n^��P��*�~s��P���o�nP��E�;��m��F�         �  x���mO�0�_�O���<̍w0�C2l�^�%��b槷��Ⓕ����w��#��,d	pՎ 5ON2�ЄC�v[�H[j��r��k���������M�'��P�����O("�4��#B<�[&���%O��bQ]朖��6&���6��T���*^bt8z�Ox�����>�Y-
�#ZA\7�N!C.�[�0��������ک �O���g�8�1��5�å���@q8���@��Sg#Q'�
V
a�G)̰��_XVC�5�H���3��LQ�uw�v'������guE�=Z���+�A�!.GG{�����8��#�;�����^�[Yx2�#ޠ���eB�����-i�������d�G�N7��|�Y',      -      x������ � �            x������ � �      1      x��\]W�Ȳ}&�BO������iDH�C \2gf�ZYVǖ�+Y�8��Vu�l���؜��!c�Qڮ�]��E���?,ŏ���#���Q�yG�\1�(��,ڊ;i�;7_�R;�&�_�$�e��IDc�Rzt�7y��xut��ī)<1"o	�?G�v�K|�֟�r�ˆ�Ü��uމ{>��i��\.\�7�sY/�3^�$9!̹�]F��9<^�?Ϲe��7���<����\�݇�<�Gx�oI�^K�S���P=F��С�)c�~pD���74	lP1���]ە��(*с���D����T�%�*�+�|F]J�dg����%�}�"��V�h�PxL"CO�:�|:�WOSo�^7�FN�������	���gC�(th,с/a���5&��+E�I���$W"���9X;�^�K^�w�y����ht�������̖��MsmZ�@#�F�;%������F�?G-|;��|P�O���0�xP�yS�e�R�x�K(t�������\�|ar�Cr������V^9�$� �,�K�]���.�(1 �6�bP(� ��)D�Wै�Dg��$FB��� i�_
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
m1^i^�4�/R�}�O�N/��* �k�7���~�L�6V'��v��\�aul���V�]���`��.�<�~�O4)��S�:7k�����7�\T�3{�ɩg�s�慶k`�d���k�Cz��hh���Zx��y����1��g��/�r[��Sm@c�fb���u/ cW2�Tu��p�Z�p����L���Z��n���cb���Տ:i�R�_ �B߀\��{�ԭs�Q��K�K��}v���$	���I�օ��Uj$��@��n��-�)�&/���jCZ�+���D���Aɮ�J�ƞ������󺞽�'8��VdC�q���_�\�����]+��#�ER����z����A��8#�7BF`L;��'XW�d��M�O.�^y����nA_�4í0Uֶn��~�#��J㐸��VYS:��r����̈́5.3���.��Z�鮅0:^`�cӤC�I��m�7�p��������}B����kn<�UӮ٠�w.q���=���4�am��k`��԰����I�b?�/�9��k��4�	~8@�õ����UB��Z��3"\_u��$X\��Ý�^�n2����[�֟��?S�ֺ���vlc]AZ�%Z�+�-��.?_JU��s�U~N�7x8���~-�h����;|��*l������r��+��#��$6��ߩ�\	���[zk�����VJ�����ұ��x'r�A�����ǿ�{��si�!��2dU<|dD�!���<Rn�|�W�(�t|�o���|�<����D�������/O"��m�lm���܈�8y�܅iwQ�c?��I�ٹ���zL��3���.g�Y:^���bҫ��[ ��F��]:q>����6unGWw��Q�T����?�F��[���)��ę�?�P��|)2yL���R����^rQG|ƀ~)�Ѵ|�9!�Tc)2��q�ۣ��y~��`�����T,{���͛�� '      '      x������ � �      )   c   x�3�4���4�3�,I-1�SKR�s2s�89��t��D���
��MA��Ȑ��Ę�b�1ĘĬD/ 5/=�$1��A�V��X����� [�!�      +   4   x�3�4�4a#]C 2Q04�"c�?8�2�4¢�����E]� �Ku      %   �   x��ѱ1�U��s�� �
��:,�x���H68��@�c�I 80�|a,�>�17��T��p`	ꆌ�g���\�${H)H�$-��r��d�=g��$=���g��m��w�@�Fc���Z� �p            x������ � �      !      x������ � �      /      x������ � �         r   x�3�4�,N�M-.I-R0�,I-�4202�5��54Af��&&�d���#D�L���,9c���ˈӈ3���58�5h&P��\���44�56��4�B����������=... �%C            x�ܽ[s�J�5���+�i�o
(�}^vQ�H�$(�����$B"̛�{�_�ePA�(������ٶ�����Vf�\��QS�?���X#`m�#.#׬=����`H�(U5S��O��GT��_�־���['�:�Y�����u�����f�C:n���O;�S�4w�hI��x����4Z��O�t�Z���/�x^Z-�_����j�iY�b�}���Ë��Z����EU�����j���R����6X0����n6�XCJ'�An���x�1_�HLTJ�+�*��j9�/u�y�J�	��x�_��~���R�R�Q�����h��7fmº=Pb���x�fύy�m����-�)���nM</Ūk^�vQ�f�,���8z���vU'Mթ���S'='[��X�� ��H����H�Q�l����%�K���P]U�h�b��rn�5	��U�=���n�e΍nY�nh���a)���>}��]F� �.X��@٩��{�]�C�<�4F,�x~�!��.�{BDW(@�u��H��$Z����j���j�����K3ݢU��%U�d��p��#����]�{���J �u�Q�4G�����$0���娬��}}>M�����im��!��UJ�ǠC:v�������M����v=��(��*C)9@�U���uF��F��؃��7���Հ붉� b�6\��T���ċ��)q�pt���&�qjMx��n��� ��{`�L�$��-�[�t���G�<��ûu��z>�"���>����Fqz�����¨���l�2+�WF>*z����Zp��w�C�e����E��2�����������[-/�8-�FQ޳]ǫ��lU'�r��^M�<[�5��U��.�u��f��>E���eI)a�������~�u�p�TZ���yO�I_�ˀ�鎦���� �6�y�K��`�<��I�1��9���[�`Q���0�+RXZ�<�~�����Z���Cl����EpB]�u\�k 3$�Q�<#��)=>ھ�׎h���B
�{dN-�'l 2�7r�:Dn����[�m��x̺v{���
r�y�K4��oz�����zR�2���h�P��QPF]�u 7�r�oz��p�5O��%e֐�e.��_�)�
��Տx_ [�d�� ��Q�6&�p��5�@c_�F��,%�qݫ��`��H
��iG���u�'Ρ����#`����Zo9|�5	k�i��i��l`r�9+��z�}��\�5��'F��R����1|�m ��S�,vl,j�Ԯzl�||�֭�� "v��Ip��Q�Β��a��$-`E�����p!��p5|��O�Zƕ�Y	u�7�.r���O�	^�I�,���2������Z��c�/.	�#��s����F�>TX �9��s'�#�-k��k�������j&���˗�]��N���n�_ů�2�>Pd]U����֝� �??�p{�@T��pԻ�;��%��	�b�ݯ�ބ��s\0B�6�ժ��A���7�\r;����w��<�v�# ������������C<�M����a�	L�M��jn�2T6�(D�6����,mHڙ�bL��1&��l�<�?�V&�3����d�A+Vx7�����mSL����6��Z�Զ��l W�-�I�8Ҥ�ې��&h1F���ъ���Ɠp��A&�ժFo+����znX�2����:�7���4+�lIǳ�/X(�^��\D��x_�?�6u�2����D	.5a�����OO#S����,���Szz��V�p�'��W�?��TSQ�%	>��7�Z�^�f�|�ֽ�!ɑ>�_�{ւ�L� ���1�O�I��b��M8��e���؎a*���o���n�
�b�� ��1[kb�-�'�/=|�Q���-� ��u�8��j��0$&"P�	!-,��vs����9��2h�Z�n)�v�I�$R�����3�����3 �AI�|�z�'����h_x1�����8�f�a���R|�ֱ�_5u��$h���:��]�=xs��V29�׬�'�^��)�\���+�[�;�xu�Xi�����x>߇��}�f��V.�J�ϼI1��1B���u38H�xώ8/��.?J����XƱC
Yg�2'��L���&�zS{K���P��'D$���|�L��d�oȖ�Vrb�H"vZmC�ܒ%���m� �?��&��!�X�S�0Y��ە�#���X=21z5�y@�ycU�A6����[I�@�_�����O�5\�4���l�3E��H5\?�#���wk��=]n�)�nR�Q�;�=p��FT���~�1���UIa�6w�9-V��;��8�঵���baRT��2Q��K�	�f����W�H)��#x�#�b���Ϻ�Y�ϰ2�+�X� `��f�Ӗ��������.BF(�$=���޺��e���e)xǡ�m;G7淎�~
��Y���qD���k>p �m�����^3�.�� ����v�����^���C�IndO�8]_BQ�x*�V��Ǔ��q�;`��k��T�X$Q^T�M�滐�A@x`�&i�Y�yQ3K�gk��G]�!��`�u�T8��#m��>��G(���Jt��y��d�#ܖ�K��o�zl}9)�P|c��V%�Nl�"=xJ��N���Ep��a��f�fz	��o�X.�I/�@�5���vS�Q)M���F�~�&Q7-��z�8nF����:�<�-��>/X�y���3�^�!���E)ltC�*�4%؈\��J�pD�����лɢ#O��o�̔pZv
Dr^{��#zZ}�Lo-����K�]=�� "�_x� �0�2qe����	�Q�6O�>k!�Fx<x�=����y�i�X��(�O:(:oڭ�^�Rz?Ǣ�6>��ZJ���ۏ��&�s�J��"m�y?IN��~��'�p�Ke'�oW�����Z(,�w�y��,��πqAX������uҊ��q�M1¸w����/�����g�f6���V1�Ք|�Dnk�k'��`�	���s�Jr�qZ�=��x���ń%��/���lW��86�1���D�ki5�iY���6טudO�U�A�u�A��(��j�j��\+��X\�RM���5͂�j/D�`�$h]��`吵Q����:~]���k�j�9'����8#M�>��_ة �8$?�%����z-��SSq�BF�g�(8�vc#��l�%�,ӷ��j��Z�Σ�ċ8$7�w���V�A��љ�����x��k�܆��iV�i�*�D$��([����@�� *y`�H*I�2��v;|����q����[����$��k�%J�M�l˪ږ��!�e��CEl}877^#8U��T�}��Ձ^��B�f�c&ZV�U�2h!��Zn΀������9�J�ER�v�e���w���i�L0��|�m����4��e�����xu��p��p:l9�6P��o�},��f��zIm�"-8	@�Qn�m2 G3>���%2���{r�R��s</U�W���|,��������L�`��2�4��/��a�g�ުVH���X�M�2]1U��S�,!G�b�w{0b�Q-�}�q��rV�T%�!2m�z"�T52��D;�#�d��0�������j��5je��z;]Gѷ��iVjDF��}����'x�Mk�6$�/H�G��DA[(���n�אm/��|��Fk�]mw�]hO��]�v�@�E�C��s�m��M8AN�3\��.T[�*U��$���հ)�b�1k�����z~@� %Ճ��j+���G$��q�Gv��ݯpY��W��NF�����1�zNN�!5d-^��p��1�R�ۦ��9"�0���Y��g��h9�F�G�QjT��4A�m㭩W, �{�I�Uy��V����o6Ez��ؐN��~O�<�^�0h膣ӪYi>FTPf�L��p�:^��d/���|"@��ÐI�
�;    ������|Vy��p��2�`CMr���Y����6*��c|�pvz�K��3�����x~ dn�8����<����%���tn:��r���@�^�[(CG0hۮ���
 �`���ֽ7Ȁ��nW� �4h"�/\��+y,�x�>�V��ɰtN��}��H���}g_��s�6���o�grl��쓹�BS���W�=.ի�[7�*�d 	b�(�A��s!$�/I_w��G'�f�J�����'-������O��DO����G8{K>��/�9v�:�b�z�W]��`��9?$� ų��=�2lz�Т�oA�A$�1�0>z��f�&b<��@�^2%��X�%��xSRf樎n�U���&���f�;w������Qe0p���f4�abE��_�@汪$�^)�E������^8g!ܪu|v��1���mH���:��\�����M�(P�v��i���8>v���L��^*P'��+e�$�Ӭ��C�ۿ-6߸���o��^�����U˰��v��y�n��lge�:��� �at�7��h���ԥm�I�k�_+����ikjU�-�FnǨ��`�ݤ��Q��ˇD�5�Ēƨ��ò8��EWn/)��i���!���Ks8 ��J��U
A�c��w�r��(���Аn߽�ᨴx=t�0��$#DD�wx8����"�7S]����p^�$`;r~��T�v,p��
�g�<���a��x�aw�7u^�����CË$��ˈ�5�Q4G�Z	ɵ�05����V*(�5�`|Z�פ�㮏����k>���������<���
���r�h�`(pd�	8�v;8���� �{��Vd�El=���v��oJXb�M�x�Khۥ�X�5�*�����m[Qj8��_���d]�<�CJ/&|n���uo]���P{����,2d�i�z�Y�t�ʽ1	(� Eř>́ehw�,~�aB��]M���Fop��Sl��|�c�J��p��Zc�5ܤ����n	̳d5Z�i��V(� �Ѽ=�󼳍s�,䃈s����h��<t��{i+�w���<ڔ��9*�?K����F��pN�Α3��f�\p�[���E�a��e��L�e��8{�N���u���p	1��̣�9�f��F���',���l��� �-8s�l�C�.d����	�!o�a;څ��'����p�X��3��jeu�G�b�|v㵂6K�/�POz@��=��
(4w7����9�B�z�R%�Y�SQ�(�DW&f-HN��Mv� #�t@�Ї�*��ړj(E��{�h�z�� u�K��8��!P�*�6`]T�r�Y�M�l 7^'�t)iN&[�{�Kn/���w�ʍ�1��v���%P�20{V���&��
�l�C�#��������n�9�.~�#7��2u����f��9XH���r��I���Ὣ��R�)8q� c����	��ZRɹ��tR�ե��l���'p@������6i��������u�ݓO��(n�����wM�������]��8r��z�]�Jm<���u���� �Ȳ[���KT<8��2V����s���ζ1D�2|.�Y��*�����V���]�eB��&��1��N����n_���|�1�$.�����h�el^���x��$~�[��~��tV�G71'�Z�є��	p���TȆ��k"a��Z׻ɞ1i������D��G�`T_�>��ej�*|_Չ�A�U,Z���?`(�	��]��[����+=ă�8M���/D��!�K������ �x	W�4J1�tt�j�H���*���M8�q�]����Dʮ�}�$�msú��*��1�+��I���(eJiR]E�J��2�T���[I��Y�k��)�y%7��D��%�!mȈ�`[WT��+�Q��B���k4	gG���9����>������O�@�1(;�	Yv�6�+M�*�'sMWLCQk�討��/ȆvC^��E�y�%��u�9�-VS�b�z���@�J��sˮL�$p©�̘�$��I
�*ٓ�CZ�Eh�!��ÿ�X���Z�vG��n���(@J��w���*/Ԧ��9J�d��8H�f�F�k6��q$�C2�cx�_��z6���d>��K�ja��Z���$�%��8���&�n{4�|���(_<)��Y�d�]����\2�� 
������q�JUŮʽ%	VI���������Ǥ����ȇ���wO�u���.�ߋA3���>�~�v2��n��!��H)J�����h�:��.K���̼~�[�'�3��^�ml��k��|Y�aGkyx�&Sx�JU 0*��%��H5�&��6�Q�?8��1���W���M�˰-��ܯ���`�=ң�l04!Y��a3��#��e��P�����uЙ�5`�e�_���=�u:���,��w?˩�4ա�$�&h�D�b�����!�k����Q9	V�h>	n����s[�h��x",a-E�D�$\�������wʫK�����K�f��z����ʏ\>|�`��L�	 ��k(m��@d]��� ��}[�8h���%Z����#�pnε]��$���+r	�s���㲾����� b�R9� &(6�Z/��\��#��Ҕ����D��$�B��K��\�]��Id5�'����wG��vK`������9���h���Y|>I�,����$�7�kh=?f��b^���Ƞ%�Jpɑϸ��K���Tl�e~ĥ*q��SK�<F,�Epoʝ/P��҇��Aj��DZ�}s�8�����, Ҷo��~�w#cJՅ!Z�Ӄ)(��Ԁ_�|�3␵{j�������8����(^;��9�w�M��;��Ż�8E�h�eT�߹pY���u����@F�6���ce���uĽ��޹y��X��~�؄�~� �f�2I��}��g�#���"��~���'_�W<٦�V�	P?��j6��T8VN�K�p�m�z�ސ=d��4p����0������>�����,��]�3��
��LU����B]��ҙ�B~��G�.#�vn�I<����f���&bo�j*W�Q�P1*�(�.����k������%y
gk��ߑ$�*B�d8d�Z��I����5����ݚ׶%cY���$~]��h%�Y����`���W�T�`�,Zk>x��ț�+��!M�� v��U��
|�h�`�����p�W]�(x�t�v�J�Y�% �j7ؤ��p���"HU  .��L�KR�Ʋ>��-��AiD�p-;'��n7|����Z�u���e��&��2X4Y��j\h��t	��<��;�8��w����p2/�n�r��9��G�a��^��IW��T_�@_e�Y��I�,Y��JV�Zq�;��&��;�a��÷x+�cc�:\����uG�^Fbd����`(�RwE4<=������Y��_��b���c���&K`Y V���[<�T�h��<���SЕ�p@�Dky%(�����8y�Jj�5�~U��A�U���v��f �������p�)�@|���y�|z�Z~�~;�ZC���o�Y����p�����$x���|L�S�UvA�ad��~k|4�w\+,R8ܡ�s�m�������N���hr,�
Z߰.���W��9�S�c)�AB�&����`���|E��b͗p/����g�||�K�$R���j���>L��-:��ⶮ{�ܞI�CJ�K��E�����t��3M�g���$H�K)*a]���/�j�0<�꾹�Iڣ!��9�
8���ܷAm��j��Vh&|��ǮE�j�2�@1�-I���2O��_��6v�����
��b���*h~�٭W�U񢰆��nW���aT��5�-�j0���z7'鐼[sc�a�u���7|�y��� 
e���xK8~W��Z�N��}�QV��1�*Ҟ�aF��K�s�4]��p^�z��Z�g&�㛂�R���{}�L溛١eÐ���,�'w^zu�)& ��?�-1��@L�t���3���    B������S	��J��o�?rCM���pQx�l����V&n�q�N�u{^����z�F�?OВ�1���s"ĨK!j�~]7Z<����n����6����M���T
MH�j�N�Y���2�Ӕ��ix���� żg��R�Ybغy�F������O%SлPϛD�����2љ���n$ 	v����p��y÷�?�.�TH3�cV��g�G��knn"�N�pˑI���[[~��N��A��[6��Բ*����#�����1&�� wC���),����+;�M�ÀTG'����-\�9�l�^r\,�̴�@[W�-��"؎�c���C�DGxs�܆��k�91�c��r~��Ś�����z'o��(��J��.�jU���e
����m8��%��FG�l�����"ol����/�Ln�E�ի�t�bt�_�ʴW�n�(U;��X�i&�2D-��7-��S�3�L�����Ѽ�LT�/�`
���ѷy=F�Ώ	a��"9P�iVg,��o�J�c�,�2~����<I����Ӡ��1��e@�!&MWLG�f()F��4��8�� �?{�Kfߓaɷ�G��_��*ρ׉�OԕpٸC���i���Z\w��.E��ʝ)	P�*j�ѐ�Z������Z�ԏ�t�f�	��	�Ԇ�K7?&���P���iy��M&s8��e�����i6���&��qp�|�&�İ�2	��~��-�`����k�`�$���O;�?�[���9GSk�����杙-�q��N)���\�ms�
ѥu�Zƥ(Æc��Z�z�mf�1ʹ2j#2ɑ��잵I��O�M�%����	�M�iπV}�ByN��F�W�g%�Y�6�]��q뒎�� "��G�.Z�6�Je��Z����]�%�6�e<6"��C�u��qUf	����J��O�K��������6ڬ��yv�ݔ�����p�Z$�~�����%��	���'�ZN���r����ѱ:zk=FZ�?�zFi�T�R����|(�{U����p�^� ={�MN^��vW�9�F�?��w$i���@�yI���р̨�<���Q�%�ܤ�	<urG%�Ǿo��B>Z�0K�����T;������nf�T�ގ�+��2���hmgm6@-�`N��_�
F5E5�����Q>V����M�<x���S����jk�#��[��Y��f���wv�n�7>��3�,�'����J��e�Q�]k 繆c�]��n�%�]�w�d�B��P�|m����z���R�ه��n[e��pY6��IV�&�q0�wQ�MF�l< M�R3���ԂG��Z`��)��W��=>�{�<���7�����6�"7NI�JEy���
m�J�г��x=�L99MR7@|����߻4I*"���o�+k�����h_�u��UT�v𣊃D�"��V�� ܺZC[�:�����蚙�v+��Ub9v�� e�u^6�i���H���GG��$�����@�⚦9�0T��e 	����y"F*�sxg�0ݒkꤽ�54i��$	p��um�WĊ�x�$\���b5+%ÄdΪ��H��\�j���es|/J�S�V��˺�ZbQ�l��/N����Mu��.93�k����|�⵵ŪT��WLW̊�0���z�7[#�E�t�Y�i�'N��!hoBt��EC���p�;ģ�g2�o���⵸�7=t�����\F�r�j��X��:e�ϴﺕ�5��F����C�'���H$�WB�/_�%aԧ�Q{��:ޔ���R�fx��ق���[%r0f�4B��H\F_3�����dU|I(_OR��`�w4�#�-.���3=j�RU�-
�RoiDU��>)%1�êX��� (��{�q�˗&'%�����d�X�1F����x>L��g}Y���t5���<�� �d����
9J����z������ض�WtΔ# �������n:�bnz�:�w[*�(֓i��*��*q �:(f�M{r8�5ԚX/̺c8������-�-w�d��S��b<e�{R01��k7F�	h;�۱�BJ0^��>N�n�O4�^�wƾ X!��<�iI������+��//���e�j�mSE� ��5�^+1�.0��ٷ9F�;���n�
x�k����$��ɉ*v�p�Z�UYN���+��ۈ��o+j:l�h�J����V{�����-'ü��ci�V�:u0��!Ϝ����n�p���RA�P-U��H���0j���6�qo0�̠qQ�҉p������ [��GƠ���3z�+F	w'��¤�U���G���0�.:���.�ߣ[o?[w��sk�7/G�kZuzE����`Q_��h=Y՟��tUj�3�:`T�E\����������X�4�����\��&��$�$+6E_��S�M�3֕q�u5�9"��v���c�GD���Қ25���4׮��x�;�T�N������X�ղ�ٮ�2���4M��Y�3A���� �=�e�qvM�sɻ��b�|�.&�Q����7�w�6S�O�B5��:]���:�B�
`��9ȣq��ϖ��,}��):%�-�1��O�RcZ�JU\8,BPB���(W�y�;>D��Y0�+T����a��;799�F��u��|a:/5�鵥�.��D�?S��ԟ�	w������QǑ
�Z�ːt��d`<&�e�+��{���f��{q}�p]nJ"�nT[/�J0>�
�,	C���v30Y��9��'�ӸN�u��(1vC#�F��R#(���J�-)r�4�Z�k ~p=t5�ٌ˱/t`�c����˯Y7�'���,�yK;X~�4f�u��p����x�W�E�8|E+��2jۚfUU�+��yE�EӬ�ـ�6�Ց�d�sq
,���^�8����p�EK �/����9;fVs�3�q)A�c�T3��\L74�ڗQ��áK��ŀ;�95�/�,�>Y&�8S�r�c��㞋E�9m%'�Ḯ�%���j��f+�S��V�WI^�J--���ʃ2��4�Z7:p�|_�Z�ͭ��,���tt��ǏM�z��/����tM)_��A	�h:5�ۚϟBH?q<P�\���|�FG�h�XVT���C`�Rp�jxQ�-��)Y��ny��p^v��SֱVe~P��UK=��{}(s0�W���Y���9o�i��L�+G)��۸�*��W�+�3[M#�V�͇�B%��|��#%��+���;���p�C��y��k���ݨ��]��˖V�:��aLF/�V1��J*�"�,×�<�q���z�X�Z�d4�@�n�ˏI@E��m�`�Eg��˵5q���UÌ=A�-�VA�/�`�N�A���a�l��h|Q,V�C�f���W�	ܨgRSW?�	�l��������]$хb*|n�謹��_�M����U�_cd���ꃭ�^t��~7�����r�y�8E+#���LUj�ĝ{��<n'�����^�l�u��u���Mh}��%ӹ�=!�TN^%`&mY�{�������[g4�G�v2LPU$	�]��G[�4.Y����E�C��\)KZ��6&��ݎ��P�~���ʃod�e�W��Aq��^��窂>[v�5Yw���ƅH��˼3H�0F� ,��>�b\^c�p�KեjiNՖ���-� x�8D �fc��}���腥	�8`b��/6���7v2��VunY� ��Zc]4�y�q��u{���\�YS�永��)�Op������i�5W�Vn{I����Q����ꎁ?s{O ���PFUJ_�nJ&1����>�&+�n�:�Y��pn�G
�B�S1-j@╷^������:}�.�-�$%�!n']a�]�OQ�m1)��u�]�ȋ��O1����E?Bx�6e/���Vu�Y�Ő���6k���=1\�1�T	�(����7�����|����+��>�6�=R���y�+�:�M+�6K    `ϾmL�j"#opz֨t��p��2^���5�޴���{p��˫��u�7����x�m������\�q2���Y2Zd�{&ܷP��X�Ie�u�/���:~��]�.�e���� ,ݩZ%��% ƞ7��!�.ܾ��e��h����@  �Ņ�D?��~�"��֓��#MW�2&��1,���C�54Gy+����"/��^�9D¸3�]�чT�f�$v&�Bn'�����n�j��k�3eh��\��_�
���ܐ,��k~a_�G�:��ӽK��Fn��Uy�A�zT�d�Ǻyv�TʠpI�����stG.a��Ák����@����4~� T&���Ze�o	���h���eAc���y|3���J�n�տ�pQ_�6�^n��tW��(D����o�^?p��0�`!kA��b�o���X��К��۪�}�H�1����Y�6	�q�M)�q׿v�-:���+�S�4�K1~G�4�;�o�������1�F�J�B����Y�inC�M?��~�&�P����1�cw'��tr�+Q`�8���z���WܵoRb���@\՝
~��:N���M�,4���Y�*���y诐Y#���%�=�{�+��3	\=��X�v��7�fH��*�B�">z��� >c�9,H�Q�iS%;�<���@CV<:|����>i�G��_-2����U	��o�e�����P1��~�d�1|�N�z�y�q�Щ7��%|i�U�fE����z!$[�::U��[&Hʩ	��Y?3A�T��m��:�7�{��=���K���,%��[@�����V�5F=O��r}������ m�a��I�,�<^��;�(�	,��)Nn�!n�
7,� b'1!�E���k����IT�w��;�m��Dӥ�G���klx�;������%ƟlbhJ����;��n4�.���IK��ѭV"}����z�Z�'��h[d���r��6�=�Jl˶�
�֋�X-�<D�:���GY2$�ہ3��^U~r� Ҹ�!�"�|�G�2�H�H{�
��.�b\��j�db ���3&�3wy���C���w���qA�=yy3'�ߟ��E�Է���)�H�*�y]D�h�uQ��0�P�"�v�~����o]<h�/ �����D�˱�!EM���p�����%�b��ʊ���R��{����s�ȖoϬ��"^�e@����n���k��M6�����Y{c�-��^�U�m�u�mR��6:��~��"�"�����l��S��9g�cT�HP��S���)q�+��^��b�ٗ(��K���|D.#�0ˮ����'X��ۣL���׏�����(�ub�Z�'j9ه�zqVğ-�T��y���Y�e
�}���\8/~Wg��6��6�n�-��IJ����8\���'e�a�YaE�ED�e+�� =�8	D��x��ìę�I2���܀���A��$-x@�	�l�u�B�-��4J5��1�rk�*Ȳ�&����4��Z�U/�d�n��c��1�xã$�,O厴�_+��F�շ�:�����v/_ʜ0j8�Ya��"|�.�w�]�!�7?���ђ;� ����ak���pZXn&�w[6H� HWh�\�G�g[��y��;��½n��`L�(��ᴷEՋ<:���^y�7-f�����o��jV�st˩���"@�E�z�=�������2�d����dISZ�W_u�;��{8-Q�W5�:UFR.""��}Xހ����?�nw�=*ruf�$I�M �&=!�E�5��._�x�J�-�l�X�ez*�m&`��Q�uQ6x���ݛa�]��J�n����V>Mx�z���"*ܰ�_ʙl
�q�\]����p^ܕ��!��~�">�=�<�xX�a�ОOܗ8i�!2~�w�5y����T�
P�P���eׁ���@-]3��&L�jۮ��*�+Y��j�X7�ER�f��>`w���$Z[��ρ���!���%:?*�]Ѫ�b2p���ڍ��n7�m�};��"�t��u Y�+�m-y͔��u���ti�~�׋p		ٴ�/�j�RQɡ�^*��d8	��(�/���.���Y��^6/�R�Uq��f����Zr���!�r���� N|�U_�?���©���G(׉V��o;j��
�6� .d�G��c��J/0n��h�b��f�����ʈyt�0ժ�C�9�g�p7`�λ��`�i�Ej @���&R|�o���t_�`��EO���7[�Ԋmf@�:;Z��Ϫ�+���$5`�C��=`������������]4�A�� [ʤ�j���WW�2g�v�
2�������B�!�����_<�d4�{D%��R	Xb�,YӔ7tm7�m *e�/V��&�>���:�1��	���u�ǆ`.�E��nF�@~7a��^�u}.~��_�I���h�S���"��Ɏ��q]_�D �:�mPG�t��-��ֵ����
��|���r�\�a���.�#h�sTdFg]�;`��k2����KfQ��������p�[o��Tֵ�.�;�.7��6�Ƙ�݀�#�)��f������w��>�=�֟��M��m�gp�p�W���/�bqG�mG�� �"\�;�q��,�c� ��񑗝O"ܯD�_�&�暬[,`�����,�@����zW��\WH]K��(5)�]Ѹ�
��L7G�2�!�L�+��/��=�.�٪��ˈ�U˱C�zf$H	�����vV?ղL���ہ��M���Lgs>`\\�3_�F�H�;I���\�����
���Q�I�N#B�
q��_�	ʀ%/6'��| oLS�	�_\>mw�z�`���E��<�@[DOO�m��g(�B����:K@�a�����ķ~pz�.���%���b����u�^�V�m�*�j��W�Q���Q�cb�x���_�j���y8�k�%���G�J�}�?T�)��2>���ÿ����g�~��ç��O�"��OG�]?�ae�٧���ç����9�N���t���0�r���O��Og�|:����h���3�?�">�y��4����ٸ�T���Og���X���&>�QH�+¯�ɟ��-�.�4�ݻ�yE�x�AL�7G�������z0(#İm����>\��Y�2@ٟu��v8�op�.=]]ʚ|o���?��n����^#������F� xJ�~�?�L��f�3.C�G7�� հ�O�3>siB;K�Y56��_�S�:j�g�G��fNF��]�T*^��<����v�\��2�uGQ_-�����)�u�
��7���]d0j�K�$Y�wvE!�m����P'�^�b�\�n�����}|�JY�[K� ���c�	���u�������du��E4��<'�����%}B.r[�o�Aڑ�H�[�]y�����j�چEAstC��$�ٟ��DJ�w�%��6���橤���Z������PJ:���َ����p�6S�TqJ�G��a�Ua3�a�i�	l�8kf-�?���1r�nQ��y�;�'�5���g@M<��Q*�Hr�#%��}�3�ַ�����\D�I�+�Q�Y��V��ߓ�w���
<����ȏU�����|m��3�T�o#�_Vބʑ��K�W��"�x�u���"�V}J�S��ϊz��`m@[���g=����Q����cȰ�����jC�	���&���DZ���a�D/�$J�7��&z�F%V��b���yU���u�qt΢X���q��L�V�o1�>��_o��]�-\��D�ɾ��-�IKӶ���S�]g�9=\����\3/�>.����1�`�����N��zɠDa�������X&����jJU��S��=8����jr�<!$%��׬���_�S�`*M��(h\ԎW���-K!g�ڱ|�� ��e��TK������
77�$�w8xv��q������o�"�b��*LGU�!p��:#���b'���wQ8�����X�:v��*���w�i�%��C_ކ�"����sr
��&���պs�Z�v�    b�f���ѷy=Fe
H�LS��4䀗����R��a]��w��}y]w��]�?�s)	I����
���O��X�J( 9U'���� ��e[�� Q5�D��S[Yglj䫡�߇��d�o%zC���k�6\R_��Am�<֩�R�)�Y9M�s)�uܤv�w���z�͓����:A��>�� �
�eZRj�߃jiӺ�πHN���i��>S쭖a���2�
���%�.�+7�H'L$�a�a ƻlWH}{x/�H�k$�M�Ď��z�M8#�	j���H;-�pd�K�Z7�#�6]>�9�nɥ����%;1���>���b�n�fk���z+�A%�.�	`�՜_��4'�������ڐ�J|�b�Ua���[?�J-�R�� ;�l�1?�t�7�t��ٍ��� 2x4����v5�a�d8��^�G(��W�_ፕ6Rw�j�p������L�u)�F3Eϧ�[���n)�m"8u�!׸�2q�!Q� m������
8�Yb�5^S�P+��������^wPs�<���滤Q��|D˾�É�2�n��\���}�!���s���K$R�b��k��)>�Q��Q��N-]x'OZ,f��w:N};����
5Uf�r��SE-���AO�{D�q���)ؾ����Fn�Λ�1�Ny����2X�@K�?������9�0��,��������'�r�T����n��� �v�.n�"n�Z�W%���Q�FT���S#���~Vς�!\xL��PE�2\�[m`�v����ĚĊ紏�,��S��ƾp2m�{+J�I���(e���iԮ�*�l��>�gl��=���p�`�4=Tz�����ĸ��[����I��.6a�;< ����'6t�9�16?qf�n��C��؎����SL���3��A�'G�����t?�d�|B֬c9����O�4�(e*A۠U�O�I��y�-N���h�� 5�7�wS��=sҎ�/��9����e߄�yX�XkA��[5�Af�Cf�X[d��k���R�mkb�tj�LOv�,Ong��5аϙ'��U�*�`nW�Qb6ZO�Q&mB+K��=��s�ZR��4�2�1�~܈�w٣�n�yȘ�^�������&�Z܆t����gGq���Tv[5k:EMS�:� ��J��x�=YӘ<
�;�+YB<��ٰw�	�l������������������oͻ�b��b��:W��O��C��r�_-�T:�C����y�IL)����);E�׬���{����b+�����j^b�_C��M�в��2�;}�(zC��%��%@N��cznw�τB�d�a�v�Z|qr�e7	vZ�>�"Z��(.��)�Nqi��M?����&�	d����E�.P[4=�d��,����YZ�R�4��?KyQ����a3>+�IGP�C�����g�z�Ƈ�G�ڞ
W]N��d��z�i8�K��b$��N�F��r$Y��'����R�&�ecػ��$��J�6D�D_�<�������5D���w��v�zթf��l����1�Z����˙p8��`fP���O8�i�J��$
7�܋W��I����~ ZzNZ**�&_��CYw��X����3�58`LU�FG��D�J���p�\=�O�B85jT}�S4��2�(������Ұ��qǾoh�4�WN^Ю׹�C���\��`�N��[��Ʃ?�2*�M�\�4��M���Ŧ�gK[��[����o�8ܹ �Gw�`��P�>ă����Cf��d�}XΟUst=�Q����Z�s8���� ���b $�������=m��W=]���T�f�m��p�{�m��l�8L��!�r8��ֆ���oQ�{;D[���V?�x��.S͉��KY�}:��<Ɏ^L�o��qnC���\u;O��;��t㳞#(Y���6���	b��Ƞw�&[���Ʊ[U�'z���|��^Ǳ���ޙ���PX�)��wǭ�F8bt�H���2P��i�$����&K�2�Zak��j��v�h�o�ji�5C�LsP�Yׅ.醡�-��z����=2���q�uAw�8�-_&Q��[�mS1�jF΀S��і �:jF��7���+��qV�j�[��ե�U��O�	�N���B�vč#d�F��l���W��p�����̞!G�lA���$�Xn��]׽�O�6�G~�d�(�`���3����d� ��p ����g��*-���l�r*�Hr �ydm���G�?��Z�a�.SJ�w�̝k�y��\���h�)�r��#����_q8]�½�����j���i������B:�۵�Z�ch#M��Z�t��d`{w�23z��V�]~vOq4��ݶT�̱Mx �?�y9���B��o����>��<\�8
���vySd̐�}>G�W��x=xĭ�O�tÅ(�Hx��=�/q��K��(���z����{[T����A�O���
����Y�z�0�@�.:o.f֓l��|��e�ʸ_��U߁��e|Vs�H��`=h,?5���{�O�~7��Y���lV�����c���u��?���UK��*ϝf��$U��I�{��Y��>�0E��O9=X�Z��.�U�g��|)%jX��:ce�"�1�s>kp�V��L���W��<@�fV�����~��2��6U�ӳ���-��ya� Z*_�8�c�ʵ�4�ؙ�A/������@�\�;��q�Vl�&�i�O�z[����Q�����>���x�F�����]�rhx�̡1/q������8^ O�Y��8j�t�����P��}y����'m��O^∸�:|���⼷�QӤ����8^@COа�%����$�,q���!pQ,q�4)!�߽���� �]�i�G-q� �%��
,q�4)y�O^�x[�����Q�����8"F>���(��Q�.-��]�(�HWD��K5�"K�_���|���zg���_Xx����>T�c^��y��G9@b��	�d��`�3-��$d��* �t�у�������u��?2.�y�'�i�qj9�:g|>h���ab1�i��&�tx���Y��)ِu.��w��Od�>
͋�WV�����Ћ�VԪ���ќA3C,�6-�a��n��T}�c�Y�Sٸ6�?�E�[�&&��k����G՗��S8ݗeێ�R�V,���r�
G˩����JZ�X�����d�&��e�M�����6��%t���?�q�5��}��,PZUEF�Š{HC��6m�(�c�e�f`�q�Bb��V���EL�m7�C�n�����0��F��R@�M��4�s/Cl�6m�x����$�웠���raOO({�����@�c�z�����Ǣ�O��� �}yHgY���SN9F}WŘ9_��%�g�篛��:.��a*�Z�Қ��N�m��Hu�����t���x'm���<F�n��?��I�n�n�U+����2��X�m�:dMhj�^x�a��O�#�Pd�2�k��'����hh�6`�TgLy;�,,��F�t7��be�t�nY������bY�icrA�{@�x�n7ݻ�7{CO-r�y���X�ΐ	/����L����=G�8&��n,;���4|!D'�B���e��̈́Sō���eg��i�]���2\�������{�P�?�3��!VR��]�/�E=6����-D{���(�3��X T����s�X)5�g�m���G�z���j�v�*�.ö`������&�]}6&5�ŲI�*��t����]��7C�o�i�+.e��(
5�
=����ņ����Sc@w����Qdj4�����y����U�*}�1�NKms��U;@��茩��	� �?�nw�-��'�JK?�meȥH�	ޤ'ͱ"��%$P˗�&��,����LUW>���v$�,t��.ZB�{C�}�f�I��Kk��n��V�M��{�1���s�R
�0z����E����z�y
�Q�e����s�1���0ȴ�f��RY������%��&Rq�)�w-p^���    �ɘz���h��u���CK�LǬZ�� &�d�f�� ���Us��4�b����9����roU��A}���uvS�Y�7~��R�YZs����+�m�x����+$<����/�Zf5D%��YU#�I�� ���y�c�<��c�������F�q�p�f;ٍ��~1�+&kV��nOF�r���Q���� ��!C�� )��%����\��7���C�eJV/�+���Q~X��L��1��%��qO�a���@ D'�c��pc���⤪>�(6���Ok�c�ъWGIb��t_wnȾ��I�.�I�u��U��H�� �M�θ1j7�è{��P��G���ۡ�3���g�l#�Ң����.Ξ� �g��^��M� ��PW�2g�)�UY�A�գ�߬;d�^=<��g2ڐo �ᒯzY�k4�Y%-�dUz�xUzN�im7�m *e�JU���C��U�Y�H	�۽�>M�"�_�ы-A_�됁��뿦�RaׁhgW�5DO�GU�À�����D@o蒤���}^����ռo�˫i����[3eF���	w�c�4���&�����������'+���}��0
�+Z�����b����I��k�����Q����S�͂Ƙ��=����2UHCJ�����{�#w��krff���$F��\o&M��(\�-��˾X��m�ɬ��-��|�?������`
q����$kr"�/�W�Z�RM�	���� ���=���,]�W�J��z\A���4�(NV8�q��^1�5~�y�ߕ���؊�}̙1!���<��䁝題��4~.8+��?���ⲙ��k�,Wu�&��ⵎ7f�z�> "~J�if>-[塦e��a$�2������0p�CM��O�1X�e���D|��7� b	� @�h���A�|����>����5�)�/��'�ѫuT���h
u*�[���_�J��x����̼ #�4JŊ$[���u�^ri�]�e@Em��+U��\0,>��׷v�$�yt�A����c�/��q�|��\j�v�TŦ�_4Q���hh�@[bœd�o�YΤ�A�s�p���qGz�&�N]>J�<����' yyY�U��8XJ1.V'w��-�����:�����x�kL���c�'��c�=@h�%�t�/��$�4�ܥH��Bg��s�g+a���xMͬP6�pa��oz�Aʶ &� ��n����޲�.A�?IJ/���n
pO��<~��c��T3��?��&P�mAxN��|mbW0h��S�XC>V:-�6`�-/��S7�
���X�	�� �=�?�I��Y�NC���?���yO��C�4��,�p���a���Y��4���o�M	Z�ip��
s�1<j��k��|9�_s߽G���F���d�):�s�}%���H;�q�W�:���>S Ck��s�<1h�y:����6.�w���/r���aI<4���7�C�|'�b��?DڍwN��Ө`i����z��{��8�6�įc�����޳�J���̺;��t����_�B�бŧ�8
�����f\|���ސNߢl���Z��1i�f���8s#�^��Zؗ��"�)$�˗���#�K�]mK���(�^��H@rH��.A���&n?���v�T}�/Q-�G�7�mv�g��L�0TW�q��z��.��~�[�!1�iYf�f�%|tE�c�?�dkV~�pa�8���wk����Nрa��.CZB����bV������Ƥ�[���\�4`��7�f�ي:�q��e�]}"-��E<�l9�z���&�,J����9V�, I��"�c�t�V�,AZ��d4��͊K�W������?��_�pF�He����MOTU)���oȶ�ʹ@~�m	ꢫ ���ߥk��ɺ$�9���� �Ŋg��k�Z��X��	N>���G�o�~H��{>!N�y~+ȴ��Bo�N��n��^��ا"��ʕ�����k��[���m�@�*G	j�� ��:rQ+3D�Xׅx�0f��ߧqt���^ѣ����Xi�,\oC�H�ݺh��.�a}��E	�=Z�|r�S��`B:J�on��>_�vR�z��	x��͇��n��w:i�r!!/U�3�	��Dm"�*�����h�}2��8/᯦��#��tғ	�t��x��a��xױ����s��h=����pCᇡ�fUƓ�-��;2�V� �=l�e@���]x��1��9��ؕ�B�~���և� {N������3����nn�EI�Yr)�E�T�X�Ԃ�l��v�˴�[�x(_�I�X�p1/�O�RS7���Jx���)>��83�uѯ�4�R�k/��j����| i���
�n%'������ZiX�,��bںC�>Y�S��5IB���y|�л���mO��d=�H�Z���u��t*	�W�}�(Εb9�"�ӵH|�.d/��*�5t۩"XN0�t[|)*ǐ`�?{��� $��6\8��Z���3K�:}�_���%����5")�S�+E�'�夥�����OD�
I�����W��2�/�Vq
�c���Z�/'���8Jp�3��Uގ���'����ƙ����R�ߖ���2�*����}����R��,b �ӆ����g��-cZb�q�ƕ��\�Dq��D1�.߳E�٫_lS�~7��C��U�'OũWxq+X��@Ԩ�x���=�P�`6��/���� �ދ���������n(�Gt�J�M��� .aѠ��m��1'��Os<M�g���Cp#�~��S����\!�ű�Jy��%,��}�
Kv&�&�{�'1�?��#&�Ue�2U��ȴX��G�'ґv������H��i�����Ƿҡ�9�(
�	��.�g�)}zs�8~�P���s��r��/w
�-s5K�z��\ݻ�P��<t�C�K,�H�݇l��d��o�2��}˓S�j�*��ם���d�t5��h�tp��O�� �	D�7���$/9٧,����hOr2B ^�JϘ���1�YN�Y���������b�:�"�1��A"4d�Ѷ�J;���p�Iz��w�nɰL�LsVi�^����p:��������f��Hvp�2 �#��� V8f�A�^���1��U��Ψ&�T�+�1c8�s�E��l��n�_��l�R��#� �D�c҃��x4���h�������*�������U�ך:�.���Z2����7ܔ�&7SAUp�w.���Q,�2π�])ER̘��oN�"�:r1z}��f���Lxg��y�[���GR�>F��1����d�rg�����@��������H������Y��x��K�p�^M!��F���Q����Y�y����@(G{؍�[�`8��)�L��#�_�0 �Rgu�x[����o=�@��8�@��ڕX��B�lWWV��h+"1͚���?
xE���vEǋ��uޡ��*�ɉ|��G�ǥ;����YX���1v}ʅR�W.�I@ɉi��a���c]�B�cRm*'IE%�OJ���,�x������<ůh�B�:�w�U�e�����i���#*rӮ�k������m����g.����b�h���s;�cC�rŇy������Lm�6Qd�!�VDbb:5��K�e�@���7�X�����*�{�����z��:D'�;��nL���O}���2��ş���Ԡ�F�eW�p	aM a���Te����N�:��wJ���ޭ;me�}��z:�%�*ݕ�)�ldn� gAۭ��F6��x	�?���%Va
T�rkg��מ3�=���jT��/ߥ�,��u�
E?��I��㿷�2��$T�n[z�i��tT���_�^�_�7��C��˓;m8P������,B~���Z
�-��)�II�˞l"8��JEN�1qĭځ<:��,+�Im��3�����11K'����7q
ԅ�\+�K�� �[`�/�i�Pn�]��sޟ�-#�A*vREP���j{M���W�ѓxҤ��    �sW�!��3"d������ƿ��١����z#�_�w�2L�v�HYBi�Y�1z�Q�K�5�c���������}������di�j��q���?�i�H����tw�1U��p�P�E�8V�<��B�
�����>�=h����a�=�+7�m>WM{�q�}Qz���nN�6�-�M W�(u*�hC݀W��0by��S�CZLléÙG�0�W���ImY�P��ӎ
�.Z�u�p���D�����ӣ7�$^޿��S��k\�&\g�kn3a��m�rM78{�?Ak��E͓y"��̥u1��:�L��TJXj+d�Mw[ :�Z=ն-Sտ�X�������SM�#��f�������п/K�Ï�����ۘ[�Q�k�,%мֶ���n��9�其S�Fe�Ho��ԠE�zDt~��ר��!i|D��+��ʔ'�D��2�mNC����)� Q���n����O^�M{e0���U����tQOj�MOhEt�������@OIR����h�#U�W����/��e:�Z���� B�m�<*���O��F���v�م�G-��/��K��00L"��R�r�XYj��5��G!86���E��nX ����uZ��kg
���J�؊_&��l׻:�HӬW!%�d�^��&���@���ᘙ��v��:��t�n�~o�¬�qC��-�n "�x�=��3`H���^��\+M3�[�j?Q�$�| N_��k�'���v$�$���b�-���s9�G��S$���d����>�-ﯢ4��s�f7䕪U^��ԳCX����N-�Vixμ.N��х�I��\�֥�>�������׊}��T2����z�6�-�A���9Zf�)�m�D�����m��
�v]����I�X6䘵+�Ҙ*R�;���g��O梘�6h�<dxƅ+���r�?���D�b)j��H�TpH>��������x��R�Vp�3�aؿ.��AS�/2���5f�ʾUX�o��l�'lR���"�X2o�U��>��1]��$ ���v�ÅVxH�s�j���ZO�ʶzY�'ۡ{�,ZR�:)\�c�NՍp�,�q��uˣ��v~�5qBC����lR��ڃ��d=��;|s����eGzf�^�����z�A�,�qp�C}E�[�Ae
�S��~��2�ѐ����@�p�Q3D%�b���HK�u�3�v�k��U�5@Y
�5� P�ѝ�C�b\[�F�|󊊖Ə�e�	C6� �E��}�+�8�bg��)�S���&��� +��H��'7L4g���Q�/Gc��K�-vډE����a�|Z��1�B��O�H"�S')�;��W�fD4��o=��I�`�М�T %�`\��X��|ٝ�|3g��́*\��b���'���3�J�v%�=&�[� �}������6u�4*�<��%1��f,J�*B�1D��l&}��z���߻aI�BS�z�A'�ډt���Έ2^ā?��V\��ǒ7��=���'[�?��Z�:�v��|?T�1;��;u/�U?���&�l�2���f�7�r��Ҍ�j���X�4�5k�4=-��P���N!�Ҵ���#�ȔI�˦�q:O�Q�vp$)��*�j�G��Β�vq:��:o�Ruǫ�X�H��uc�Z���|��J3s�iN��%rk2�ޯ51r/��Ż2�x��Q;x��j;����������tשy�f菩�ZF��0R��\�~6��"]H�3g0���-d�WW���<�=�ߍ�gD�K��X?F�%��^'�%�ZCp!H��/��QN�M�AN��O�w^����	G�GV,HȏP�lBH�S����Z��K���)�#��̎�>�6��v:U��]ݨ�4	�5��y�]y�xB'���	��p;���#,��壩��~X�,y?��Y��y��I=їU<�Im��c�~�_����j~m���Z�O�	�ɒy��H�/��_�:�蹞n��i�]'����`-��Q�K@��X0&��2�n5��3�)�z�3Ʋ��dS;8��8�шdqH%��V-S�|st�A��1����N0Qp;�W��t��מ�F�n5d���B-�53�ֿ��4j߲����A�J*U����(˗�(����_З0�%��86�|	�.CѬ� �n`>oI�~0�EGaU���7��*m����MJ�b���8+���!��+��5^�>� PCe�Z���^�a�>�)�p�>�ʵ�u�n���uV �G��S��k��eA� �w}����K�=¶�a����LB5zy��ʄS��ӓ��!���j<�J�6���25V�Z���M7�G��<��N:U)N
��pt�7�d�\b�!@�q�"��fU=Z����
�
�SZ��
I�&$�X���C��w>0s<npή(���E΢�5�
�s4�B+�_�x�
x��4���d@��Jf�����T���3@�g�s��6�&gYK�gˡ��<>�$u,'���:�/$,A�f�k�V�q&��L�c�L��5H$�[lІ��a���CG��%�fE�^��:yr޸����BՐ�C�8��>�队;�ϟ�Χ��פ��b٤���IYNCH-�7��}�y���a"n����cG�������~-�ȇ��$soƴi�1��߸/(��J�d����Tnpxmg�� -��/:�,�!Z&^ɸ� �:\;�U�3N���}���礩��+��Y&�U���RuH�!a�:�!��%:��4��&�ۿ�����1�/���ں8�r�%)�$\{�����X�<�A*?���0@���W��0��2m�����׭�������c�tFm��k���B"�W��~�,"fm���A�-��X�FtU���D�#Og8�k�ȼ����8�-/�/�8��$<<L��o�<�%�ܫ�q�ʯ�Q*�d��jw��xz�p$8��(���!�yU��g����ZI�?�K���G��d���W��F Ko�]���=�I�솉���v��z����R���F_i��yrE����O�|���Z�^uzW%Kn���6@ �HN=�;��1[��!���3A�|+���Q��!X��42�������[4����2H$�����K��'Ks4�������M/S���d�A�h�[:�Y�7t���_8R�Ce��"�-��.S�D_
۩�$yO��h��Z�8���N3�2O����?B�����q0H����}�2S��ԞN��S��BM��R��-:�u�B���<<�|�S��頨P/S�H��w��-��ɾ�ܞ�Y_ǯ�4���ӃH`*/�� e)��׼I�fu�/(^�@�SM�1F��Z�r�f3���A��̸��r7?N�Q}�ɷq�<xMۨN��TH3�?N��;�1v�/�!}��ubS�񓘗�BVY�.��Q� �CѐG6�cF�H-�C�T��_���\f�X�IT틐eI�f���?=���t��c
[C��}���C���}W)�9���q��N׉ciVU��K�4�51B RX���!yr]<_&�����
��IˋΌir���� -���tME	�/A��B�͔;{T6�j^���h��u��y8|��~�r�:�
�����h�͊J�o��(� �Sy3\����& �oO�� HN�7*� Ğ"�l�������+���6]��ڊ��kD�z#��cK���L�9��4 ���8e@1����>n���@,��Ƚ�ɨ�����.���Sf�$UA3,bWM�+~Y,U��Z��Na�8��f���cѓ�0��+�q�~V�.���m�E��9�KO�Ԫ:�"4ٵ����A�T±���Հe�����s\�U
{�]��ݴᰒ����Q�&��] R�z�ʤ K���=�^�_ͳN��ed���y�+n_��²��~�!�8I�!���2X��T�!�R@]���G�W�/tR�9X,�,o�g�N�R��
���A"X�VY6iYϷ��K�J9ᩆ�����%��4P�kT}�"��ӭ�}�D
���[�rS�mq��%ʼpgQ*;~o���Z��	@`i�n�    �~������~ا����!��(g�u��Z����(9=@n��e4M"���溺�VD9��d�lM7�5��|�O��
k[�I����m��"��k4��_Y<׳.ySg��0}�d5]�r{�8�6K�t��-��^IN�,�U8�ǖ��$ta�&_N:�ݒ�[�HBI*�[�XUQ�$K�t�6�:�͇橸������3[8�wDR��;�Dǫ��J4�#��u���e�<�U���^� �9��ź ��G���-ޕ�ciz���t -i�5�@�?D���Ӭ�o�c�[�9��{��4A�y�Z�㘕[��X�t3�vb^�?���Ot��CMe
Ri��g�C4��T��L3-ױ*+P`	���v�S�A�T����l���u'L�1������!N��X(�C�@�$p�\(��S�=���e���d&��Z���|� ;.dd�,� ��@/Ȗ��F�u��фr�J3��y���-ˬE��x)���b�|��D]s��kDXv`h5\��w&n�-`o�y�Sq��Na�<�o��㼔N�̢�J�u����]�j�.@�|C�y�	���w��M8
���[���Sx]�Nc�'��<z��0���V�����Lo��u�,�jU/��j-g�z��"���Xf`��/��l� �d���5��+!�t)hџw_@|ˀ?��e�ʹ�G�)dO��4ڭ��*�����U)�qxFI�F�<�?�����VZ~��]=��p�F(��M���V����j���U��3ÀGD���s��8�^B��M���`HB� >*;� 	�E��M�4,��y�.�ߑԃ���IX��a�@��ʢ��.�?�Ԅm���¿���]�onXڡ�E��e��u�~C�l��"F�J�,F
��Q�pf>�vFu�+����x�$�C�����^������+|*i?�=Dq�����J7��h.#�A�Tv����"|��2�=eo0�w��wN�qJ�Gѻ�����x�T�tO�:�o�,:<b�n��ۗ ��Ij>��#\���G�u�,���d�y/��Tn�yD�-�͑��<���a�v����5 ����a���jWAEAi�wL�w&��'c�P�(o�P�m����ε�w�omt��Cq�f���B�5��-��庚A���<.Q�0i굛 @�/�c�N|�Dl���h�*?��l'4��Sn�����S�\�?H�hnoV%�"hI4�Z'��y�ߥF��N0��W��Ц_^IM�5j@�r��ܽ�Э�w�ʾ�I;�p6%׮�A��`r@�,�B��;���c>\�h�%_��d�q2����,�1����\ƗM+3���_��<u�������� s�F=O��-��<M]�7�!c�#�go�Hil�l�-��"��,k�N�Ne�,���f�~�fV!�G!�c�3���@n��Io�J�l���֑��&ެ�DT���]��ЦS���g��C����a<߾( �k �X�s�i=�����T*캺�V�`!�x�Y�v�gX[y�	R����vE�y]z|VL/K���Ԡ~r�}1�nf��N�FLӂ;X��SE.c}VaԠ��A��nyac��9�6=�jn��/�f���w�U�ʶ�PSVNCgK7�?/ v-���8}ޕ܄�B����x �M�Of�e�%�ѯ��1W,tp��)x�.�b)��D�N�{��$���Mn�O3VU�#@�1AHWP�ӣ����W�+��<DOA�с��Wz��w�Y$/���_������ e��3È�e 7� ��2�$��ރ�o8+�I��N���XY��4���t�,�⍙�^�R��әl5�u˩*�'qB+��}�.�Y�CM߿�Pˁ%�h����� �#%�XB����ߛ�M�m����"~|��Jc��]�Uͭ�W��pU��ׇ����&4G�S��Ĩ6����}5�\��^��j�;r��mUwzE`�ko"n�k���\��+���z[Nt2���|��� Q�+gs���ÁY'�RYA�Rm������f���Q�՚�Ӈ����CS�v?�*pH����'n��ש�V�p=[-�/��f"ᩮ���V�Tcc2lH-�m�=L+:��('����v~V����):��7��h�0���!���<S�aԣ�����f��B%�(�b�h5�������&�[���_�]��{"+~}'c��yY�f�d)����k �Ѿ������)��ឱ��܎�Q���h0�CE������ 励�K��f��P�K����UJ���I�K�O)>�T�'�;�
P�,!�-ȼ�lxC/��{�~��}'��)�"��9�?D	0��n���u��eC����R�L��ː�����*��K�=�'l����� �� {�nGo��n�Vg�x�L~xO����]>'�߱�����3�VsbE]M)VV�Ƈ��)�`��W�f�!��x`Bĺ<��=P��|�Q�t���4��iVߢW=z,'l�nU*�1"#�v�C.�׻�y��h�G��=�g? %��wAh^'{6T��H����덤u��ۺjT�C�1�`~���9N����MN�U��>�A��I�Յ�|���8Zo���mB�jV�Bd���ZS2j������>��I�\���ɿQ���Ї��"�4�w��z�Jw���u�ث�����K�v�a�� EvQ�N�n�!�Bf��l#3UCe>mx��O�-lv��x�^���ݠ0�egb��z����P��.���х_A�ɓ&r�����|��\dfEۉ�hy�/PbRn��5�jy1Z�l;�Zc�c�s1=*�rcS��ٳ�7���l�x��ۍl�����"���F�틜+���ZIV�ގ^,�NP������b��L2�w�^_�pKO�?z�b�H$\PwLx�!ƾ,@6� �W��¦�K��D�y�$23iMJ*�!|�x���M=~��̌�i��W�&�U��ժ-�qb��1k�!�� ��-v��6pRT�� f���M	K J��sDj����~�M6�2S��ٕ�:^i��v��fk����}��k�Dآf����ԕF�ni�B������<�4z��{l����qd q,�P�u�Ā0��صЧ:� F��'@��hhB���8+�tmvn~��]rt˿B���|�n��r�ő�j��bh�v�Z����|z>$xb'~i���k+� 9F�K��t�i��o�C[��P�C5]'�J�0r����g�(�����F�"�>mu��^��__�n�0;T��YS�٭��4�+�(`Z��U���x5�v�8�A�}��U��p�	y��Ii���ە�v��*�̧r9+pC�ھ�Ƥ]R�Ç���$�M4���IME����-`:T�t���S�����i��ir�Pu��"�ήV�:~���bHy�%Ё��91~����]G�m�����I��6bx�O�qR�>C�<��_̐��� ��"®Ƹ��ײ�~�à���<H�D��3퓏jn�+V��$��Rj�A����Sxblkv����#4��e�.6>XN�����{��O����D��6
T�2�>)<C�$^B�^&k��M���iv͚�9ss�B��#��@��,���|@5��0}���΢_#��E#d�x߱JkBxtF�ѳq�`4�4�M� �K�5����*r�$:�D��f9����0��ڵ��$�٣B�\��~ҋ~��s��d�p�� %��r�G���,���)QS'߫�DJ�;�d^��S
Ej������FȘ��B.�)�\��2h)�ϷQ
���3���p��税�������sx�Yy������s�STuJ��SW�ˋ��^_x��K��.$�U�� �!C����}��lym�S��}[�E|j�uΈ��Y���!�09���QU#� �A�eZ���>�;�DPl������/_!F��'ԧX��D��R���j�;b\l�����a:N�L� �x����I.S��ڔ�DW�VͼM����1rt�W���M]��!$vjă���    �j�z#ǩ���K�|����e�n�k)�t�q�jۧ �Q�NWwLf��t�W�΁p |ڠ�eR �^��Ut;����2y����I�T:�a����yuy�Rc7����i�o�F�!	�������w�jMgR�U�5y�TN��3T��ńc����/@�ONu!3D���TxwqE��]B���^�O��R5TáT�K`!�_���a��r��!䃜�Zn����/���ii�&ݕ�i��J���08ǩA:b9��QS��⨠���'/��`c�|z���{���z������hovR�GwU����֨N����H��1*D��R|9�֣J�� Xg�pl�C�G���b�z�\}�o�"�'Zo�h�N��?\�6��6S���&*��z���`�Lx�V�89��+ގ�C��4�3��i���DBE �/�v�ʳt��΄��9���hG�����9�2��K�.�M��t���%��}W%G��c�ŧy�����Ljf����P�k0�G%����f�w��K�*_�&�AW��(��Ϊ���QQ�:��I��z=I�A���V_���8�kCȷ����#8RA3N����& k����;be�c�E)�&��а��%�02N��]0��n�j�r#��^G]1�#�8GR��Ά�&��V۩��X7$/�@�Fz��t?a�'8lx�ͷTQ/�_�Qf8q�n��h�Hrh�p���9&�Ѐ���F���O\G}��w<��?b�cƒי�V�D�P����v\��U�LS3����V�e_�#0u�r �) $6����
s	T��t��;��t��.��h)��J�M�jA䨰�k2或qa����[jAL�o8��/�OSN����t+]���(]F�R���5����(F�жl��1���������-c�zݚ��~�'�%B��˨��hW�2C¨��a�j�����s���c�h̆~�Iz���y�_�R�ȪO5փ��b4=���B�~M��f�K�п����ub�ߓ���)yV6�oT]D��u�.��Q�HCtM�i4�
E72�^�y�S���wJ>ZY��t�c2M���j*��@�vͪ}F��hf�����/�^��pܡ��_�p�v��_���s��K*Ox�%��cEć-jB�%ӕ,9��Qw*�n�b����$���O��)-���3�s�<��|7=l !�RI���m�0P��ʮ�X�é̥2ڼ砋x��	dVR�̴,�r�U��<�]�\Y�Cԥ�����-�8f�or�D\�,H�6��e��E�N	QM�b���j5]
1D���98�OZM�-7�jl�i�iG�<
e#v�0���ɽgrG�[-M��7r�I�;��t+o>KG�haޥm�Uok�0k�-65��+��'6��-��r6j��r'�@��ic���P�����L1d&Y!�p�\��zf���
�P���,F�5�q��E�6��%�j��u���![5�[�]�ͫ%�$Q��YJ��}U;ė��]���b��Q''���2F��L�<��9���b!�5ps�z���G�P��.ⵔ�j�N�<_;�\o��C'�BMC9U%� 9�n� �V�xnh�y���*MW����JhWL�E �D�
��X͌�(���IY�D#�k�z���c|f�0�>E���T�1��7*֜E��5.#���E�Q:��{������J3��K`�i�<�؍���ܬ��%�Ըj�z�,ë��#~Q�Z�mb�};�_�w�ЪF�e0��}�i�Ԩ��;ZU�#��e:jN]��\�A����[��"c��2s�_��f�0v�޾�ع���$J`�d�QZ�gQ�Y-%�TH�t[��$D�f��nr!���/5����uRn�YS��'lC��S�Z_F8|����N\���v|i�f��F��J0���'<Z��-�ӨB��N�2z�n�H�6�:(52���g�,�z$�Y�D9=M3�Z���aI��d�+,���Cޢ۶Of�15le@���ݭ~�PD�����F�RA�0��vD�0ά�5�L�>2���a���O��x}j&��T���Ɣ���!*HmC�B=�ŮOxjz� B����C�O����&���e�I�v�dϪ*^"B��BC���w��Q�޶MA��z���a���F����_�b�K� �B�;�٢J����o'�� ͨX=���"���3�I� n���Ĭ���b��en�f��Q�d''�Y�
�H5)@��6��X#�eٻ7�D�@���9�h�Ga��,0r=y
���!��`ֳh�� XD����YjU�- �qI�dU�_t���
�^{���KP�A�#��'�
�\��4Z�זڀ����U�'�8�,����~�naÌX�O����� l��r'&�7@�_7�V7+7p��2Kw�6�Dx0~h�5�A�`������^�����>^+��ϡ� ?�^"RC?�K������o�^���h��r�<�����7��jhVY���e6O�)ZQ���mؚeZ�3B�+n���tWy7>�D{��q���؉�n�^#�sK���F�4�[i6`�N�ps|��at�T�G��Y�n7�:4 5����D���C(7}�^+�c-����J&�ϳ�����1��i:�h_+�����t�b0 @|�C-v�b�����u8m�����K����Re4���Vu�E��&���2�xP,P�
¦7�ē��2�m�p!�1�R�f�� &KxЖr��aC\u�Fn@�S�(��h�Iu������ ��������|�u�B�,^&��d��v�Ӭ�m�E�/��j˰���A�-Oi����n�2���'���7���z�j�Li���>f�o�(մTU�*(]6M�"S ��ŀ*�qBGX{�^�<<l�Ө�F����]�\�XUU�q����X���Y��܄�ڛP��[�cŎ����߷����7�X3�KvQI�=ڜ�����VN4��,�T����سi�B�7�����c����og������<������ko�Xv'~��fd�&R&תc:�aWe��6�����|�0��R�oX��A1׽�Nr�)��wy�L��\ƁFk�(�����q��NK$���[P"��6�� �qU�7�'?��pO�����o�O�K�y�� �*y}��d:��`�ZzՇ]���p�����hp˧�X]a�1���I6�Z�/=B�]C"����L}CVuZc��MF��z�D�;d/�M��Y{��.tq�<O��V�D`�r��8��5!ܠ;up�,TӞ.�%�C�FmAz��υ�#��������9�Lr��aؘ��������5�6y?&,{��옠����&}�x��|�;������d����s�I�u<Od�: �2Р�j�y\r�ei������`J3��p��q��G�`^�xz}�?4����N�X���5��D�ټ[=K���џ���qeˬQ'Gl��%Ԭ�� .�r�P� ��B���)�2e��rݫ2R�aٺV�+x�6���7���V�8JoE���&d^��P ����{������\����ƌ-;3�oQH�������p-G=)���sf�� ��[���)K�Ġ�UE���d�&�7��1*?��I��I��?��S�����58�N�#(C��s��&��.�](("U�����Y���*ݬ����;�4�vP(�>��ޱT��q�o����2z��wÃ#^���콢w��K�)��^�O�9!�x��鮲��m�[U�_�ȶ�-@!\t{P�n�'�9�N)����(��ȢR���b�>9���\j�G3\C՝��S8�"ۤv�C��yW��8�����ح���F����*V�h۹�ާ$]d�:�|�֤����r�]��@%n:��X��I�n�!�l�ih��2�o��f��O�r��$3�vu��!�
H�1H�yy4�$�:��d#c��w���L������.+�g�{�?S:�aՍ    S��l5T���9�źf��Q�qr���	�Ip&��n7J����&�/��:2'�r��n� Ɨm����-����dԹ
�I8�A��2׫��z�2�[��A�O�7��X8�9>�x�DJc;ݧ��Yd��Bv
�s*��c: ��ӈm�:C߫�ui��q��g2�y�ĩo�J�l���֑�M�Y�����_�j vգ#��Qh�(?�9VrZ]oX��9�w9�EZO��ߤ�w&�߮��3�|	"�'�/���i
�̭@Jŷl"�r袭��bzY��*��}Y+��/���L����eTެ��h�����¬+�v~f�!?j��rK�Q(^���v���t�K�r��:�|Q�al�)a�����y��1�,��}\{w���L��J~G[��򚝙��g�*g�'�z�(��|�CG���2N�w���8.�������]���K:��/^��9�vy�~)�)޸ �Ҏ���%� ���w�7)#Y��p���c:�cȎ�;�H��F����9�x�<5�^~�r��-�h�H^V�x�w;8�'�����H0B���M7���k���{0�ge!�W�I��$V�/Me�����Z�����W��7�H�l�?f�\ж�ʣ��Wv���k�>]��ӣq���7�q`��. �v���k y�B,Q�yUӇ.7�(�e6�f+��z����GE���h�*�����j���E�1호���y�;B�59<`'lЀ%�'�J�����u�.�܎cI�Vu�0��V
���UzMC}.�9�r0 ǚ��a]=U$��*����g���d=��џ�x��󨸦������ �qU1�*=G�Rk^����n�_�4��Ae�2�E�g��4��|�X��N9���/V�TZ媨��ɴ���]0�x�F�[hE�r���ץ�K?Mi��w�O)N��h��5h��^��m���-J�3�*���}A���4������!Qh�T�Bx+���$e�xѻjO��3���v�	�����f�9p,�^h浽��Ip[{����>��؞ �3Ǘ��s��yZՠ��%{��r�ΒOO2�&H�l���@�HFͿ����?�������#GM�8��[�q�]�qH�G��� ��Y�U��\�pSv��o�/����BE��}�қ������/A�a��R0��N�؊�7�[j�� ������wB(�1��0��>�n"e�@�M!�a���Di�^F��<A��X����1<�.�Ъ]�p=;�̏��LH�kp+�Z����w���k�m�ֹ�����0<y
)�r�~,ǌ �O��ox7����'q %Q�Or�3�Q) ��lBǌNЁ\߻�9CB]UOj���!�*�
Avt��,� �R��p�u��o����ƧeT��Re�l����9��˩�3�J�O�Gڹ�E��p�5�eS�����Zm�1-�z�6v�+N0���C4�d&}i-V���*:�t[n��[�}�Ső��8���W��X�Q�h�rS���b����'�g'z�%�W-wv(:�E)��o[�e6o��2��6��墰zQ��[)�]p��n�1��7]-��{@m�]�2�.��mW��$�9P�I-�6������C�'��r�=4B�
���T�ڤ��(]��G�d���T����cbc��䶖��2;˟�G9]%��`��l�f�Py�v����R���E&���j�-����q[�J�%�t��4��r�5��-�czتo�QW	_�ܪ��$��O�o�Rfu�k#�Q����l��D�Lb#�U��]?�V~��e�KW��O��q���H��җ�r�x��En$�/toI8�a��)~ ��|�5�5\�Cw�0bdѶj�}gV!���	���	5�����P�"P#B��PD;x�K���i�CT�HW����m���$�]['��i;���(�m�B �k�wA��t�>�,B�2Τ�P/��M؉#�@I���!�֝2l�)��3 ����L�uU��jkB�B���e��~/raZR�!ܣ��^Ӑ�]&���K��7K�����'����L��j-�k�9�nX�'��Ρ�H���&�`�����E���S��@(:ʁ%���� ^���V Qj	i��RB8X��z)͛�I�&��W�|�@�\�%:jm��^v߼^#���ŷ�J8�y00=V�-L���7���5Ű%����ܯ���E�`Qߣ���x[h<�xV��˶s,��]���ߜ�%�����b b���Ѳs�0��h5/�L�N$ްK�3�5q�v_�HK� �i��Ȝ&���x�i���A�ȁD�0���5t����c�	B�����<�c0W%^Y��?I}������L۰?;�G�x��
��Q���Z^#h�5y�aP�Ա�-�e�X�a��KD���;�p�E��W��C�MR���|�	���gˉf�$�	�Ĵ�E���E�1N혵|�}�/{��Lϻ#���!W��NhȌ��KF�ؤ^( ��V�@ 1!t�Z���5�Np�"��8(�eC����%)v�/�כ�v��:LZ��4�s��O>{~g�
x2������mN�h5���c�i!�7�j+������Z�P���g�����E����m=ڞ?:����;���b\�qk@'�J�Y�Oktam�]�n�N���M<�)յ���cy�ZCN<Q�ej�di8xz7@Gw$��ӣUR:�Ҥ�E7J�J��eR��I.�خ�V�U��� ��7�w�T�V���P:�UO�������.��i���4N�"�r�B�I^d����Z��Y��s�0���z ��PaxM��Q�?1B��~����Y[4;�:���iR_D��v��_�t��[ *�:}��z]ީ�2մny�kZ�b��9�[8	n/��A���C���B�U-b���F�\c�gs��2��b]�a���(��j�d�s���C�L#�_����\H�F�(y&�|���*^J�bo� ����:��\����dt������BUx:�'6sp�ǣ�1;x���n��9��E8���k���.���j<P����C�(*6�ۣ�hX����؍�!���r��ꕦZ��vn��I7� ˾�9ү���o�\�o�`����� .��c)d;~��ۗ�wO�Gx���f'ՀA�V���b�90�u��ƚ�?�P�O�q�%
��P���-�RU��q�4��2+��^�JU"'��1Z�E�\�n�Ĝ��Z<�3�|�_n.�&I^~� u�Kv���ަ;��걢Ua��]]UkT�os��
�~I�j�	��^����3]�͞E�n�\�ˌ�Æ���]�3�PWh� ��ݠ�����=�6d/��^�^%�۞+�x��BYO���r�C� �p��9Y*�:M�Z'���}����|W7��|�帅�$��SH���|�TT�5�h[����NAI���2Ф}r��ɺR���
�L��F	�ԗY"����(><QFaWC�B�����n��p�j\��)x�ST[{#���tr�w�w��xDݒ�:�s�z���&��VJ2ôLW��*��c�V ��`�qc%i�TҲ��P�?8h��w���#�y�+6֕��Aݹv�����Bd�z�%�-ծډ�c3t��Ļ�G��P��|�	G��B1�x��u�Xt@�-��㗢a�z��ȍ���K��S)"���Y�a7�˨�I�i�^�2��$��-�J+����v�iQGFX�oT�T&�H\	�nM߿���w��`"�NW0��K4�A��iPW��n|B�(MV�o��.�2��L�H?��t8[e�ٵ��q�_5���������_�4Z+t��jm���z������%�GM�4��	$�A�Ԁ]����1pȦ�
aiy�E\̓:Y���{,��3/��+s�29#͒�}j��`Q�Z�5�l���֮�l��*ҿB+3��a����# ��*J�yw
1�Z���뉞"8C�{�}/���S�8��~V$�2,!j�:��c"OǶ!�Eƣf+qMaBB���U��L�+��Ϩ�����Lͥ�_��ЄԮ!�{m�.�    �v���O��[�ӿ��>��ߍ���XS��w%��<Q�q3���y��QyNn-�6u��dk&6i�M����_�m0��.�ӱ%��-��d���t��L9�R��n���O��h2 ��[�Zu�]c�D���v��Em��t�y�L�D毠���z��D���~���*y���}V��;��Q1�`8�gšl���Bȝ��p� �<ŒS~�G��__��Țm��Vyn���X31�[ĊjF'Z:v7��fܿ�L��`�����n�VZIv��Nw��+�a��U�*@��hb�hRz���Tk���ױ�!�fD��[%X�:��h��R9��pP��+pp'&6k|fN���3|�S�8��*����8}K���#_��+��h0:L�Z�:�=��
7��#'��9�st��'٤��.��n[�n}���֥��}Z��W����-�E[��FJ��G�~�k���j7ߢ��O�����!24�D��W�0��}�P
��Q��=V�[�q�%d�����ȳ!�����Z�	6;���{�X���=d�q�l�����=k��\� ؔ���ٰp�M�`�@t�Ǐ��6ѺN{y� �������Uϊ �m5���q *���/���rO�~�^�,����%������I�e�����9$��P�)ȥkz-o��<��F���\�j^ϲ�|n������tA��[2�F�zT�Ek�* q-�8�g
�0
��w6��ֲ�����VnT�#t¼�n+�eV)]��4�-���Ԛ�뢞��8/�aX����(�t��Ş:��	ǈ�qY�!���B�$@� �[-V��M6�y���%p1�ݠ'�g�=��%�ސ��N)Z1%e����"I����[��_�l���!�q�.KD�\ƅ��8h�*��Q�Gw��/['��Y�Y�帯���Q/Y�\��)���jŸ�k���>#�����]���Z���v�{�岅ub�4P���YIh#1�K�hZ)�Wy4/�{��o��(]OV�}A�C��k8�V�5�16��5�CǼ��L ���K�b���@��؉Ʉ�����ɯ��//��h�s�yJl����� F�u5Ǥ��P���`4�P%��E;Bi}�}˕�*]m���yq8�)W��ǛY�G�1�h�IL�����Vk���-o�=ѧ��t2�����-W�tʵ�Q)r�x�L�V�]׶�ʃt�W�]Fu�Z��ȵ7��Ћ")�Q���^7�����j��(�e �h́?��� "Y��2� F�m���6)7������yB����:|��rSHG��"9ʤ�.)�ĩ�v^��)�@�&����|SV7�t����� >F2u���9;��8�6��)��I�_�
��xذ�u�@����p��M-G��n�,z�'>�*������%�1��[�Z@k�8��֐�)��\i|�k�]�F��M*V��bu�l��I�:��t�ԣ�R��iڮ�WmlE����B�Ԅ����0[L�y7�ՅM��b��о~0~�n�΢i2���N*Gq��T.��`�IG�+t z�� J9b��y>��j�����t5zT��PYCn4��=�(+6K�MĊ�[�z���i��]1��G7��ʈ���ZP@����n��Ή�|�x������2�G/1����?����ؖ�YY�s����Aj���a��~������.:i(���>��?�|+)>z�e�dyL��x��ͧ�����1,ײ��w"|�4�Z7s���ql��.8'%.�o?Ej�b�4�	���c��h�\F�Y��D��V	��C�8,B�PC���p��-`X�����#ޟ����J��'�~6Ͳ_) ���ĭX׏����M�(��ТA����LZ&�X��0����w4���2`f��,��Qk��e��v�鶃b�_㙆I] C�⬏p���6|�M�9�NH#ԕ�Q��w �?r�6��v�t�|�2����)�I)?G�-���)�-�,�IY�c�=�CB�Z�~�b��cf]9/��ߎ�> �c��&�%}�n�SVo�f?d5�T^�V��g���Y�3��(��
H��^�v�^6��%���Q����b6eN��Z�J$	8n/���)]쐩�qL�"	A�
����%����N�+ �륤Q��E�,.j>�KE,�����9�6p�B6J����j�Q�1nN�o��<y���/d@��B�A����\(��<���b����v(���N��M�6�x�`G�|	a��Tk����Î<I����@�����y3~�Pɸ�"z�5L�~T/VKx�$M�\LпƮMRc�˝IЇt��p�p},7x=%��bx�"�\T6,�5*�RD�0^mj5�9A��[HɆ�髼��e��Xx�.o^�1ܓ�h=�j���\d}�;�*�\	fk�ɽ�jU/��j-g�z6�i��>=��צ^�f��U������|�櫻�8��E�}WVO
���LBu���V�rK1�j�&��Q"������-N�{D�.h�� �������9��1K:��X��_�F��2N� ���/q�?#F�y'x��'k��}N���a�*��UX��/w���ttS�0-|>�������9h��8��D=Uu����9 X��*���C���9�XY�*������9hi�J;��D���9����YY��y'x��'���%N�{D�.!�K���B��a�m��wN�ŵ)�M���F��)8+
���4ʤ�O��2�WedMòQG�"*�!D~���!ã��lBwj7~g� Co����u����ɥ*����}��q�6�P#����]��32Kpg�يj�I��~��������_-&�mϣ�'VE�*8J�a����f-%��J;6ͷ��&��h��QuDpϘ�$(��0}�v�W�O���^�+�r�y�>�p��6*�d�M�pGn�J�|��M���*����v�[^�c���8J0�zA�G,W�e�ݷCoKa'��'Hhz����0����e�>�J�28�K�
1��b��M�+Y�}�-�E�서>.>ap�2I�K�Xl�����$���Mrj݀ nTn
�b�����3w��5Z��P�S�ᨑ�\u ���;~G�E򲪣�n%�>�:�Y��B�ˬl\>���P�	>�z�8��0�T�	N�(V>�b���(/X��3_��ߨ������L�\�Y�U1:�Kt�t�x���!*\�hj����������/��A���~g���2��]���'u��{��RM����*��
c(��VN�бt�6Q ���&����������Æ�K �V���o��M�tL���j��\Y��(Ĥ�E��ۦ]k�^s�dK��-6.
h�=�\��[�E_��Ts�m���k�A�w~zt��-����Q�}*�鯣�?)�ɰJ�5
uj���󃺀qx:9��MHO~�Ǳr��F#�Na��X�OBr<����l�,����-��R�C׶��#y��Q��j�z��M0v/p��(�êb_AiJ�j>��
X���X������������lW�P�3^���
|o�`��n����H9�Y=�i4[�I:*��~RP��1� o����v��6� eF�U/�
k�S��3��|/�(�o��dU�n��Ʃ�˃��,��A.���A�T��j�Q�R��Z����0�{�B��[�_7��] o�7��p0�&�x�9x
��8?�qͤ�e<[hy�o��_
�x�>��ũ$jY�DB��j�^ɱ�%��u�H��U����/�����n�GΙ���Q�5n6/��Z+�ƃ�ص���m�� �ʉ��(�_^;�T�7�q���U/�3T��w����:��ͽ���U�F!�?*aS5�Cɣ�i!�����<��ᡶ!��Pm�#�3�����n�k�� ϝ^�'��j��kA�D�O^Vv�>\V����7:JIq�s�L$ W�����y?z�7M0�<>�8VYb����fJ�52    [s>�Hf�U=�Ο��i3�:{:��Aݘ��*e�ѵ�/�];�s�N_���Lx�N���k�F�'��d�m;_)���]rh��Q}�MGtP��-%*�UU<mP^���$����sV�i=>���;Vs�q�sS� (��MZ��˽I��UU�hL1]��u�9�TE��<���m�G�E�pLw��
9�k�=SÖ���1����L���fV�R�nF3�<慵LW�]-��@^%60�5�ԕ�t�9~��L:�J9�4�\��篼`	ï_�D��4R8V�/ x��~X^���/��ͷjv�jc�{(�.�M���Df����n�bN����>Q��~����@�`�1xox`����#$��b[�����^��f0<��y��ys$ԽwR�/��R ��Ag8�H�<g��,�_��B��F0ੜf�5�p;�� [8�#��(R.�m�8�dTrUGCl��;�����ٌ�A��;l��>C
�+B&P�88j�w���Y%��>Q��VWv����#{8"��Ipq�4Q���k,/�e�iY.�W��<����~ q>���&�x�d�?����w��;s����06w��LmK�"� ������O-�y���W�kW�����C�Po2L�$\�G]Pp�,��oz���k}�"��)�=����APq*���we��;[}�-(����vQ�� �L�a�8*��'g.|��b?��~넽*�I��q���g�7���oz]꤭��[%�_����y}��o�O�&���jY�	��ah�b� &��&pi) +��n;�`�P���p�`�Ė_���w@�3u�} �T�~�6���qZ�*��x��X#�út����D��rl�Z���,�P�t�0ߠ3?pB��-�����
��G��n������U4O�$�qS�H�0Ca��k�tXA��!������{K�˭D���q�k�1���a��}*H?R6h�гT�6�~R]�>��7`�m.
��A�Q���0�	 �CY7/p�嬟X�پDZyHj�FTC����6v�� A:��0?vp�����<Z	����z��*��AD�Xb��4p8��W��p�۩X.'��P2?^B���3R�z=o���f���8^_O89/��ZB;���Z����'�Ղ>��D��C�X�zqp��������j\����$
�-_�lx��	Ҏ��qb����I��w��`���`���w|�����A�U?u�Z��}>��zTV;���M�O�������'`9�         �  x�u�=n�0Fg��@
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
	ꭁ����Q((�R�'��]�/��F/maĹV���x�� �}������� ��      >      x������ � �      ?   �   x�u���0�h��OR�Xf���T�]���@��gK�J���<�|~����u��{V�Pۖ�����K�pF����k�	$� ����急r'@I��9y���7�̃̃̃̃222�d�p>�iv}#�	P������\d.�\Թ�s���s�)1�J��(+� ��(+�)1��(+�i7�0�08�*�P��
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
��"�*#�$�j!AbR����I�bV��*Ei�]̣��)f@�*DP����- �z�uy�~>�h���̬f!�U-d��ELU.dL�B�U/d���̤�!�0d�*�̬�!�U2d�ZFLU3dL=C�U4d���̤�!�5d�ʆ̬�!�U7d��v��,O˭��Q�c�T8�\�c(�qM�CQ�c()s��CY�c��t��	��'\�n�p�{��E\n�q�s:\����p�o�E�	��&\�n�p�g�E����a������      p      x������ � �      d   D   x�3�4�̜JΒ�bNCN##]C 2Q04�20�25��C #.#��Ғb�:�M�t��qqq �/      v      x������ � �      z     x���R�8���S��L9�?w�،�m�x���Sɀ�$P��)�~Z�v�"�]˰�eFE	V��A��C{��Zm������r�ã�d�e�x͢�Ø���s�I�W0F�2����6��r���_�"��P�nV��6[g(�mV�W�|���7���|y�e��:����W3.�9�p�\�u>��N��y�9w:�/��ϳ���+pm�Y09��A�$���*�]�@!sO�M���$B����L��G��N4�Y����)B��bL �.0d�`W����F
Z��'�;�DCGtQ��s䍠V����$�[�[@��)��B�^�fh�b������)�KLb�}�X2��4ds�Xx}h��68���S�1���Tx�l�jU+�����5�h4�7r�M���3󚲳U��>��B7:Ec Om�,���y�hU���K����%�i�q�� ������f�k�K�N����%p�-�4&���ސӠZ���)�0Ը���/}j|0��N;���:o� �0M�x
T��7�y��cVNb�q	Z��s��D��A#hV,�>4�$�'A�n�0�ҙ��W�|�24(�6<��n��iWP�t�s�=��4R�&�E��F 4�@}��/�[��5��I���&̧��r���#s2�%�h,�3�	dpE&z���p���c�(lSF�Ӊ��[�7���e�ׇ�U�t{]�"���c?�aCn�T��>���M#L��8�FTF6P�lQ�P!�i����f�lGa�i�4�laM��F�aS~����[�iD5\�%�4��r	6���L��F��iDG9	�F�@SN¦5�uK?aӈ�A$ѱi�2W!�i����fӈ�
�M#�����l��/��8�FTF6P�lQ�P!�i����f�l=Ga�i�4�laM��F�aS~����[�iD5\�%�4��r	6���L��F�iq�Y9	�F�@SN¦5��K?aӈW@t�~�E�,5�2_�ʑ�!�s�ѡ���Q2�Y�W��|լ��ׇ�Z>{�6�4�e������nŁ����v��΁^�M� N�d��߯��ɒ���\��QO�?����oT�{�ۊ�e�������C!��l/'Pз��y��?�=l2y��aG���^-z���庝�s�{�]�<�{�����L�22j��n���j�MC��KH�s���	���_BH��%�.�M{+vS8��/!w�P��5f�c*�:�2�Xv������l-�.6쳲�[��}�n`�*�����6���d[WR��\�������E��1�&-��F����?��:��;�UaO-�\۷(����`zG�h��U��*'~�\ި`���\�$���x�o!7[B���U)��QT���:e�l�(�!������HJ��"�|=�q�B~�`,��O�fK��4�`J���ф�C�T�#�w�<�ǭ��,�\J���r��%H�!}�e^�!I�t�zﱕ1��)��ٔ��I���	^�T����`(f�q��:K+~������W�      @     x�-�Q��C��Ƽ�ظ/���xax��R���5%�O�ݟ>�ߣ{������2��̛�?<�Ok<�c<ƿ���i��.z�f��S{�e�2b���C�!�{�=�RO�$v;���Nb'6b^�܎��^�^��!��,p]���ʑ�O~?�G�#��o���#�H���u*橘�b��y*ƙ7μq�3�g^ϼ�y=�zV�Y���*�Ͽ맛���i���ڣ����i�4�?���ߣC�8�y-=s�=�7�袓���X9V���sҿ����y����N}tӛ^��s����S������?r�;<:~�硋��~�9��~������/���ed�?�Ƈ9������M�7-nZN���r���.nZܴ�iq���M��7-7��iq���M���[�q������R�v����=�s�C��~�o��C7Ջ������;;;��b������r��p��M�W�ϱF��_�|����t���!�.:)/_k�n~���C?�����S?\�����o��j�ڭv��j�ڭv����o�����jo���[���V+�*�*�*�*��H��������īȫ̫Ыԫ�;�3E�d�)r�ș"g��9S��O͟�T� ���o^�������o���[�m��Gm�Fm�Fm��x(���x(���x���!x���!x���!x���!x���!x��\~_�o�����e��:�u�<�C�<�C�<�C�<�C�<�C�<�C�<�C�<�C|S�_���'�Ip�'�Ip�'�Ip�'�Ip�'�Ip�'�Ip�'�	LP�@!��ڪ�L��,������ݚ��o�/�>_�c�2N��S�)�q�8e�2N��SF(#��v�]`���jt5�]RRRR�X�X�X�X�X�X�X�XA]A]A]A]A]A]A]A]A]A]A]A]���S_L}����;_�|��Ŷ��m��n��m��N��n��햶[�ni��֯�������ٷ��nc����6D���}>���8š      =   �   x�}п�0����)������tq`���rB���D�����o~�\r.��hB�h�����<Z	Y;]:%������A]qK8v�8�����&L�H�0�=x\Z�a���x~�]�e�Z���;�a��u�Gmk�Sh#%�����jW���NJ��u��Z�Z�      l   ;   x�3�4�5�B#]C 2Q04�20�2�����2��7���o2��=... �S      F   }   x���A
�@E��)r��_'��,�lW]���h��Ea@D�>�R����&k���h߲�Φ��d=��˙�B����	�W���X\|?亦��]��==U�>x9{ڽ�r�mϨf��&"�UH�      H   D   x�3�46����4�4202�5"C+cC+S����̜J.#\:��L��t����s��qqq �
      3      x���K�-9nE�/G�HCR�{�T�Ͽi-�u��.P�x+O��EQ�(����8�W������?��������j���?K����ϯ����Gk��W��
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
K)7�Yfm-�-Ј�P�V�5�z�{�S�VXF��l)�}�w��p4��[!ew� ���cMk��$��\7=���'�`7����"���6�I�e�-�j�m�V|�?������η0�      x   �   x���;
�0��Z:LЮ+_"'pcHp����b!�Y��b~I�����n�}%)%�׿�l��Y����S*��{�J�L6�4`X��9��:�z���8S�sռQ�c5�Q橈�^���C�+-މ(�JD�7"
��^�����_u�����A      t   ~   x�u���@C�3SL���D*H�ud�-�%n<��a0�5-�v�kA�$�)� (	��`��$$(��`'��)���-���c�5S�s�S��}�$�%`�r	�� sVH���֬�����.�P�s      r   �   x���1
1��zrɼl2�Kx�ml;����c1�R~L�?��>��*��|y��*������ಹ4.�����P�C��M�\�K�r����ƥ֐�~���ʧ!|
[��%dOa�S8B�Zh������� |����1�|����1�ulep;�R����      ^      x������ � �      \      x������ � �      Z      x��][s�8�~��
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