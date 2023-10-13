PGDMP             
            x            SIMAS2    11.1    11.1    }           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ~           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    64835    SIMAS2    DATABASE     �   CREATE DATABASE "SIMAS2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "SIMAS2";
             postgres    false            �            1259    64836    absensi    TABLE     �  CREATE TABLE public.absensi (
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
       public         postgres    false            �            1259    64839    absensi_absensi_id_seq    SEQUENCE        CREATE SEQUENCE public.absensi_absensi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.absensi_absensi_id_seq;
       public       postgres    false    196            �           0    0    absensi_absensi_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.absensi_absensi_id_seq OWNED BY public.absensi.absensi_id;
            public       postgres    false    197            �            1259    64841    class_advisor    TABLE     �  CREATE TABLE public.class_advisor (
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
       public         postgres    false            �            1259    64844 "   class_advisor_class_advisor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.class_advisor_class_advisor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.class_advisor_class_advisor_id_seq;
       public       postgres    false    198            �           0    0 "   class_advisor_class_advisor_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.class_advisor_class_advisor_id_seq OWNED BY public.class_advisor.class_advisor_id;
            public       postgres    false    199            �            1259    64846    course_setting    TABLE     �  CREATE TABLE public.course_setting (
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
       public         postgres    false            �            1259    64849 $   course_setting_course_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.course_setting_course_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.course_setting_course_setting_id_seq;
       public       postgres    false    200            �           0    0 $   course_setting_course_setting_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.course_setting_course_setting_id_seq OWNED BY public.course_setting.course_setting_id;
            public       postgres    false    201            �            1259    64851    daily_exercise    TABLE     D  CREATE TABLE public.daily_exercise (
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
       public         postgres    false                       1259    74825    daily_exercise_skill    TABLE     +  CREATE TABLE public.daily_exercise_skill (
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
       public         postgres    false            �            1259    64857 $   dialy_exercise_dialy_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dialy_exercise_dialy_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.dialy_exercise_dialy_exercise_id_seq;
       public       postgres    false    202            �           0    0 $   dialy_exercise_dialy_exercise_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.dialy_exercise_dialy_exercise_id_seq OWNED BY public.daily_exercise.daily_exercise_id;
            public       postgres    false    203                       1259    74823 *   dialy_exercise_skill_dialy_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dialy_exercise_skill_dialy_exercise_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.dialy_exercise_skill_dialy_exercise_id_seq;
       public       postgres    false    287            �           0    0 *   dialy_exercise_skill_dialy_exercise_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.dialy_exercise_skill_dialy_exercise_id_seq OWNED BY public.daily_exercise_skill.daily_exercise_skill_id;
            public       postgres    false    286                       1259    66552    employee_unit    TABLE     �  CREATE TABLE public.employee_unit (
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
       public         postgres    false                       1259    66550 "   employee_unit_employee_unit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_unit_employee_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.employee_unit_employee_unit_id_seq;
       public       postgres    false    285            �           0    0 "   employee_unit_employee_unit_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.employee_unit_employee_unit_id_seq OWNED BY public.employee_unit.employee_unit_id;
            public       postgres    false    284            �            1259    64864    extracurricular    TABLE       CREATE TABLE public.extracurricular (
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
       public         postgres    false            �            1259    64870 &   extracurricular_extracurricular_id_seq    SEQUENCE     �   CREATE SEQUENCE public.extracurricular_extracurricular_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.extracurricular_extracurricular_id_seq;
       public       postgres    false    204            �           0    0 &   extracurricular_extracurricular_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.extracurricular_extracurricular_id_seq OWNED BY public.extracurricular.extracurricular_id;
            public       postgres    false    205            �            1259    64872    friendly_value    TABLE     �  CREATE TABLE public.friendly_value (
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
       public         postgres    false            �            1259    64879 $   friendly_value_friendly_value_id_seq    SEQUENCE     �   CREATE SEQUENCE public.friendly_value_friendly_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.friendly_value_friendly_value_id_seq;
       public       postgres    false    206            �           0    0 $   friendly_value_friendly_value_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.friendly_value_friendly_value_id_seq OWNED BY public.friendly_value.friendly_value_id;
            public       postgres    false    207            !           1259    74890    input_analysis    TABLE     _  CREATE TABLE public.input_analysis (
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
       public         postgres    false                        1259    74888 $   input_analysis_input_analysis_id_seq    SEQUENCE     �   CREATE SEQUENCE public.input_analysis_input_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.input_analysis_input_analysis_id_seq;
       public       postgres    false    289            �           0    0 $   input_analysis_input_analysis_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.input_analysis_input_analysis_id_seq OWNED BY public.input_analysis.input_analysis_id;
            public       postgres    false    288            )           1259    82996    input_analysis_tema    TABLE     �  CREATE TABLE public.input_analysis_tema (
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
       public         postgres    false            (           1259    82994 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq;
       public       postgres    false    297            �           0    0 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.input_analysis_tema_input_analysis_tema_id_seq OWNED BY public.input_analysis_tema.input_analysis_tema_id;
            public       postgres    false    296            -           1259    123960    institution    TABLE     �  CREATE TABLE public.institution (
    institution_id integer NOT NULL,
    institutioin_name character varying(191),
    institutioin_desc text,
    institutioin_address character varying(191),
    institutioin_telp character varying(191),
    institutioin_email character varying(191),
    institutioin_start_time timestamp(0) without time zone,
    institutioin_end_time timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.institution;
       public         postgres    false            ,           1259    123958    institution_institution_id_seq    SEQUENCE     �   CREATE SEQUENCE public.institution_institution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.institution_institution_id_seq;
       public       postgres    false    301            �           0    0    institution_institution_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.institution_institution_id_seq OWNED BY public.institution.institution_id;
            public       postgres    false    300            %           1259    82970    list_question_per_kd    TABLE       CREATE TABLE public.list_question_per_kd (
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
       public         postgres    false            $           1259    82968 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq;
       public       postgres    false    293            �           0    0 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.list_question_per_kd_list_question_per_kd_id_seq OWNED BY public.list_question_per_kd.list_question_per_kd_id;
            public       postgres    false    292            '           1259    82983    list_question_per_tema    TABLE     /  CREATE TABLE public.list_question_per_tema (
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
       public         postgres    false            &           1259    82981 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE     �   CREATE SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq;
       public       postgres    false    295            �           0    0 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.list_question_per_tema_list_question_per_tema_id_seq OWNED BY public.list_question_per_tema.list_question_per_tema_id;
            public       postgres    false    294            �            1259    64881 
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
       public         postgres    false            �            1259    64887    m_building_building_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_building_building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_building_building_id_seq;
       public       postgres    false    208            �           0    0    m_building_building_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_building_building_id_seq OWNED BY public.m_building.building_id;
            public       postgres    false    209            �            1259    64889    m_class_grade    TABLE       CREATE TABLE public.m_class_grade (
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
       public         postgres    false            �            1259    64895     m_class_grade_class_grade_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_class_grade_class_grade_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_class_grade_class_grade_id_seq;
       public       postgres    false    210            �           0    0     m_class_grade_class_grade_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_class_grade_class_grade_id_seq OWNED BY public.m_class_grade.class_grade_id;
            public       postgres    false    211            �            1259    64897    m_class_room    TABLE       CREATE TABLE public.m_class_room (
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
       public         postgres    false            �            1259    64903    m_class_room_class_room_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_class_room_class_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_class_room_class_room_id_seq;
       public       postgres    false    212            �           0    0    m_class_room_class_room_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_class_room_class_room_id_seq OWNED BY public.m_class_room.class_room_id;
            public       postgres    false    213            �            1259    64905    m_course    TABLE     )  CREATE TABLE public.m_course (
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
       public         postgres    false            �            1259    64911    m_course_course_id_seq    SEQUENCE        CREATE SEQUENCE public.m_course_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.m_course_course_id_seq;
       public       postgres    false    214            �           0    0    m_course_course_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.m_course_course_id_seq OWNED BY public.m_course.course_id;
            public       postgres    false    215            �            1259    64913    m_department    TABLE     �  CREATE TABLE public.m_department (
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
       public         postgres    false            �            1259    64919    m_department_department_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_department_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_department_department_id_seq;
       public       postgres    false    216            �           0    0    m_department_department_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_department_department_id_seq OWNED BY public.m_department.department_id;
            public       postgres    false    217            �            1259    64921    m_education_level    TABLE     9  CREATE TABLE public.m_education_level (
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
       public         postgres    false            �            1259    64927 (   m_education_level_education_level_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_education_level_education_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.m_education_level_education_level_id_seq;
       public       postgres    false    218            �           0    0 (   m_education_level_education_level_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.m_education_level_education_level_id_seq OWNED BY public.m_education_level.education_level_id;
            public       postgres    false    219            �            1259    64929 
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
    employee_birth_date timestamp(0) without time zone,
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
       public         postgres    false            �            1259    64935    m_employee_employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_employee_employee_id_seq;
       public       postgres    false    220            �           0    0    m_employee_employee_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_employee_employee_id_seq OWNED BY public.m_employee.employee_id;
            public       postgres    false    221            �            1259    64937    m_floor    TABLE     �  CREATE TABLE public.m_floor (
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
       public         postgres    false            �            1259    64940    m_floor_floor_id_seq    SEQUENCE     }   CREATE SEQUENCE public.m_floor_floor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.m_floor_floor_id_seq;
       public       postgres    false    222            �           0    0    m_floor_floor_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.m_floor_floor_id_seq OWNED BY public.m_floor.floor_id;
            public       postgres    false    223            �            1259    64942    m_kd    TABLE     �  CREATE TABLE public.m_kd (
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
    kd_type character varying
);
    DROP TABLE public.m_kd;
       public         postgres    false            �            1259    64948    m_kd_detail    TABLE     �  CREATE TABLE public.m_kd_detail (
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
       public         postgres    false            �            1259    64951    m_kd_detail_kd_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_kd_detail_kd_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.m_kd_detail_kd_detail_id_seq;
       public       postgres    false    225            �           0    0    m_kd_detail_kd_detail_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.m_kd_detail_kd_detail_id_seq OWNED BY public.m_kd_detail.kd_detail_id;
            public       postgres    false    226            �            1259    64953    m_kd_kd_id_seq    SEQUENCE     w   CREATE SEQUENCE public.m_kd_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.m_kd_kd_id_seq;
       public       postgres    false    224            �           0    0    m_kd_kd_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.m_kd_kd_id_seq OWNED BY public.m_kd.kd_id;
            public       postgres    false    227            �            1259    64955    m_kkm    TABLE     �  CREATE TABLE public.m_kkm (
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
    course_id bigint
);
    DROP TABLE public.m_kkm;
       public         postgres    false            �            1259    64958    m_kkm_kkm_id_seq    SEQUENCE     y   CREATE SEQUENCE public.m_kkm_kkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.m_kkm_kkm_id_seq;
       public       postgres    false    228            �           0    0    m_kkm_kkm_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.m_kkm_kkm_id_seq OWNED BY public.m_kkm.kkm_id;
            public       postgres    false    229            �            1259    64960    m_lesson_hour    TABLE     z  CREATE TABLE public.m_lesson_hour (
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
       public         postgres    false            �            1259    64966     m_lesson_hour_lesson_hour_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_lesson_hour_lesson_hour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_lesson_hour_lesson_hour_id_seq;
       public       postgres    false    230            �           0    0     m_lesson_hour_lesson_hour_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_lesson_hour_lesson_hour_id_seq OWNED BY public.m_lesson_hour.lesson_hour_id;
            public       postgres    false    231            �            1259    64968    m_parent    TABLE     �  CREATE TABLE public.m_parent (
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
       public         postgres    false            �            1259    64974    m_parent_parent_id_seq    SEQUENCE        CREATE SEQUENCE public.m_parent_parent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.m_parent_parent_id_seq;
       public       postgres    false    232            �           0    0    m_parent_parent_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.m_parent_parent_id_seq OWNED BY public.m_parent.parent_id;
            public       postgres    false    233            �            1259    64976 
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
       public         postgres    false            �            1259    64982    m_position_position_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_position_position_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.m_position_position_id_seq;
       public       postgres    false    234            �           0    0    m_position_position_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.m_position_position_id_seq OWNED BY public.m_position.position_id;
            public       postgres    false    235            �            1259    64984    m_step_study    TABLE        CREATE TABLE public.m_step_study (
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
       public         postgres    false            �            1259    64990    m_step_study_step_study_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_step_study_step_study_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.m_step_study_step_study_id_seq;
       public       postgres    false    236            �           0    0    m_step_study_step_study_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.m_step_study_step_study_id_seq OWNED BY public.m_step_study.step_study_id;
            public       postgres    false    237            �            1259    64992 	   m_student    TABLE     ~  CREATE TABLE public.m_student (
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
    student_delete_by integer
);
    DROP TABLE public.m_student;
       public         postgres    false            �            1259    64998    m_student_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_student_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.m_student_student_id_seq;
       public       postgres    false    238            �           0    0    m_student_student_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.m_student_student_id_seq OWNED BY public.m_student.student_id;
            public       postgres    false    239            �            1259    65000    m_study_group    TABLE     '  CREATE TABLE public.m_study_group (
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
       public         postgres    false            �            1259    65006     m_study_group_study_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_study_group_study_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.m_study_group_study_group_id_seq;
       public       postgres    false    240            �           0    0     m_study_group_study_group_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.m_study_group_study_group_id_seq OWNED BY public.m_study_group.study_group_id;
            public       postgres    false    241            �            1259    65008    m_unit    TABLE     �  CREATE TABLE public.m_unit (
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
       public         postgres    false            �            1259    65014    m_unit_unit_id_seq    SEQUENCE     {   CREATE SEQUENCE public.m_unit_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.m_unit_unit_id_seq;
       public       postgres    false    242            �           0    0    m_unit_unit_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.m_unit_unit_id_seq OWNED BY public.m_unit.unit_id;
            public       postgres    false    243            �            1259    65016    m_unit_year    TABLE     ;  CREATE TABLE public.m_unit_year (
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
       public         postgres    false            �            1259    65022    m_unit_year_unit_year_id_seq    SEQUENCE     �   CREATE SEQUENCE public.m_unit_year_unit_year_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.m_unit_year_unit_year_id_seq;
       public       postgres    false    244            �           0    0    m_unit_year_unit_year_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.m_unit_year_unit_year_id_seq OWNED BY public.m_unit_year.unit_year_id;
            public       postgres    false    245            �            1259    65024    menu    TABLE     R  CREATE TABLE public.menu (
    menu_id bigint NOT NULL,
    menu_name character varying(191),
    menu_desc character varying(191),
    menu_url character varying(191),
    menu_parent character varying(191),
    type character varying(191),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.menu;
       public         postgres    false            �            1259    65030    menu_menu_id_seq    SEQUENCE     y   CREATE SEQUENCE public.menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.menu_menu_id_seq;
       public       postgres    false    246            �           0    0    menu_menu_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu.menu_id;
            public       postgres    false    247            �            1259    65032 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         postgres    false            �            1259    65035    migrations_id_seq    SEQUENCE     z   CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public       postgres    false    248            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
            public       postgres    false    249            �            1259    65037    model_has_permissions    TABLE     �   CREATE TABLE public.model_has_permissions (
    permission_id integer NOT NULL,
    model_type character varying(191) NOT NULL,
    model_id bigint NOT NULL
);
 )   DROP TABLE public.model_has_permissions;
       public         postgres    false            �            1259    65040    model_has_roles    TABLE     �   CREATE TABLE public.model_has_roles (
    role_id integer NOT NULL,
    model_type character varying(191) NOT NULL,
    model_id bigint NOT NULL
);
 #   DROP TABLE public.model_has_roles;
       public         postgres    false            �            1259    65043 	   observasi    TABLE       CREATE TABLE public.observasi (
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
       public         postgres    false            �            1259    65050    observasi_observasi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.observasi_observasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.observasi_observasi_id_seq;
       public       postgres    false    252            �           0    0    observasi_observasi_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.observasi_observasi_id_seq OWNED BY public.observasi.observasi_id;
            public       postgres    false    253            �            1259    65052 	   parlookup    TABLE     A  CREATE TABLE public.parlookup (
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
       public         postgres    false            �            1259    65058    parlookup_parlookup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.parlookup_parlookup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.parlookup_parlookup_id_seq;
       public       postgres    false    254            �           0    0    parlookup_parlookup_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.parlookup_parlookup_id_seq OWNED BY public.parlookup.parlookup_id;
            public       postgres    false    255                        1259    65060    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         postgres    false                       1259    65063    pd    TABLE     L  CREATE TABLE public.pd (
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
       public         postgres    false                       1259    65070    pd_pd_id_seq    SEQUENCE     u   CREATE SEQUENCE public.pd_pd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pd_pd_id_seq;
       public       postgres    false    257            �           0    0    pd_pd_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pd_pd_id_seq OWNED BY public.pd.pd_id;
            public       postgres    false    258                       1259    65072    permissions    TABLE     
  CREATE TABLE public.permissions (
    id integer NOT NULL,
    name character varying(191) NOT NULL,
    guard_name character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    menu_id integer
);
    DROP TABLE public.permissions;
       public         postgres    false                       1259    65075    permissions_id_seq    SEQUENCE     {   CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public       postgres    false    259            �           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
            public       postgres    false    260                       1259    65077    personality    TABLE     �  CREATE TABLE public.personality (
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
       public         postgres    false                       1259    65080    personality_personality_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personality_personality_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.personality_personality_id_seq;
       public       postgres    false    261            �           0    0    personality_personality_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.personality_personality_id_seq OWNED BY public.personality.personality_id;
            public       postgres    false    262                       1259    65082    physical_student    TABLE     A  CREATE TABLE public.physical_student (
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
       public         postgres    false                       1259    65088 (   physical_student_physical_student_id_seq    SEQUENCE     �   CREATE SEQUENCE public.physical_student_physical_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.physical_student_physical_student_id_seq;
       public       postgres    false    263            �           0    0 (   physical_student_physical_student_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.physical_student_physical_student_id_seq OWNED BY public.physical_student.physical_student_id;
            public       postgres    false    264            /           1259    123974 
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
       public         postgres    false            .           1259    123972    prestation_prestation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.prestation_prestation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.prestation_prestation_id_seq;
       public       postgres    false    303            �           0    0    prestation_prestation_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.prestation_prestation_id_seq OWNED BY public.prestation.prestation_id;
            public       postgres    false    302            #           1259    82954    quiz_per_kd    TABLE     �  CREATE TABLE public.quiz_per_kd (
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
       public         postgres    false            "           1259    82952    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq;
       public       postgres    false    291            �           0    0    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.quiz_per_kd_quiz_per_kd_id_seq OWNED BY public.quiz_per_kd.quiz_per_kd_id;
            public       postgres    false    290            5           1259    140405    raport    TABLE     i  CREATE TABLE public.raport (
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
       public         postgres    false            4           1259    140403    raport_raport_id_seq    SEQUENCE     }   CREATE SEQUENCE public.raport_raport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.raport_raport_id_seq;
       public       postgres    false    309            �           0    0    raport_raport_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.raport_raport_id_seq OWNED BY public.raport.raport_id;
            public       postgres    false    308            	           1259    65090    role_has_permissions    TABLE     o   CREATE TABLE public.role_has_permissions (
    permission_id integer NOT NULL,
    role_id integer NOT NULL
);
 (   DROP TABLE public.role_has_permissions;
       public         postgres    false            
           1259    65093    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(191) NOT NULL,
    guard_name character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.roles;
       public         postgres    false                       1259    65096    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public       postgres    false    266            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
            public       postgres    false    267            +           1259    123942    setting_daily_exercise    TABLE       CREATE TABLE public.setting_daily_exercise (
    setting_daily_exercise_id integer NOT NULL,
    kd_id bigint,
    skill_type character varying(191),
    step_study_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.setting_daily_exercise;
       public         postgres    false            *           1259    123940 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE     �   CREATE SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq;
       public       postgres    false    299            �           0    0 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.setting_daily_exercise_setting_daily_exercise_id_seq OWNED BY public.setting_daily_exercise.setting_daily_exercise_id;
            public       postgres    false    298                       1259    65098    structure_tematic    TABLE     O  CREATE TABLE public.structure_tematic (
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
       public         postgres    false                       1259    65104    structure_tematic_detail    TABLE     �  CREATE TABLE public.structure_tematic_detail (
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
       public         postgres    false                       1259    65107 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq;
       public       postgres    false    269            �           0    0 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.structure_tematic_detail_structure_tematic_detail_id_seq OWNED BY public.structure_tematic_detail.structure_tematic_detail_id;
            public       postgres    false    270                       1259    65109 *   structure_tematic_structure_tematic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.structure_tematic_structure_tematic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.structure_tematic_structure_tematic_id_seq;
       public       postgres    false    268            �           0    0 *   structure_tematic_structure_tematic_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.structure_tematic_structure_tematic_id_seq OWNED BY public.structure_tematic.structure_tematic_id;
            public       postgres    false    271                       1259    65111    study_group_setting    TABLE     '  CREATE TABLE public.study_group_setting (
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
       public         postgres    false                       1259    65114 .   study_group_setting_study_group_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.study_group_setting_study_group_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public.study_group_setting_study_group_setting_id_seq;
       public       postgres    false    272            �           0    0 .   study_group_setting_study_group_setting_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.study_group_setting_study_group_setting_id_seq OWNED BY public.study_group_setting.study_group_setting_id;
            public       postgres    false    273            7           1259    148589 
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
       public         postgres    false            6           1259    148587    summary_kd_summary_kd_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_kd_summary_kd_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.summary_kd_summary_kd_id_seq;
       public       postgres    false    311            �           0    0    summary_kd_summary_kd_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.summary_kd_summary_kd_id_seq OWNED BY public.summary_kd.summary_kd_id;
            public       postgres    false    310            3           1259    132187    summary_skill    TABLE     �  CREATE TABLE public.summary_skill (
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
       public         postgres    false            2           1259    132185 "   summary_skill_summary_skill_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_skill_summary_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.summary_skill_summary_skill_id_seq;
       public       postgres    false    307            �           0    0 "   summary_skill_summary_skill_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.summary_skill_summary_skill_id_seq OWNED BY public.summary_skill.summary_skill_id;
            public       postgres    false    306            1           1259    124000    summary_tematic    TABLE     /  CREATE TABLE public.summary_tematic (
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
       public         postgres    false            0           1259    123998 &   summary_tematic_summary_tematic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.summary_tematic_summary_tematic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.summary_tematic_summary_tematic_id_seq;
       public       postgres    false    305            �           0    0 &   summary_tematic_summary_tematic_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.summary_tematic_summary_tematic_id_seq OWNED BY public.summary_tematic.summary_tematic_id;
            public       postgres    false    304                       1259    66532    tahfizh    TABLE     �  CREATE TABLE public.tahfizh (
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
       public         postgres    false                       1259    66530    tahfizh_tahfizh_id_seq    SEQUENCE        CREATE SEQUENCE public.tahfizh_tahfizh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tahfizh_tahfizh_id_seq;
       public       postgres    false    283            �           0    0    tahfizh_tahfizh_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tahfizh_tahfizh_id_seq OWNED BY public.tahfizh.tahfizh_id;
            public       postgres    false    282                       1259    66514    tahsin    TABLE     �  CREATE TABLE public.tahsin (
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
       public         postgres    false                       1259    66512    tahsin_tahsin_id_seq    SEQUENCE     }   CREATE SEQUENCE public.tahsin_tahsin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.tahsin_tahsin_id_seq;
       public       postgres    false    281            �           0    0    tahsin_tahsin_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.tahsin_tahsin_id_seq OWNED BY public.tahsin.tahsin_id;
            public       postgres    false    280                       1259    65116    teacher_note    TABLE     �  CREATE TABLE public.teacher_note (
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
       public         postgres    false                       1259    65119     teacher_note_teacher_note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_note_teacher_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.teacher_note_teacher_note_id_seq;
       public       postgres    false    274            �           0    0     teacher_note_teacher_note_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.teacher_note_teacher_note_id_seq OWNED BY public.teacher_note.teacher_note_id;
            public       postgres    false    275                       1259    65121    teacher_setting    TABLE       CREATE TABLE public.teacher_setting (
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
       public         postgres    false                       1259    65124 &   teacher_setting_teacher_setting_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teacher_setting_teacher_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.teacher_setting_teacher_setting_id_seq;
       public       postgres    false    276            �           0    0 &   teacher_setting_teacher_setting_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.teacher_setting_teacher_setting_id_seq OWNED BY public.teacher_setting.teacher_setting_id;
            public       postgres    false    277                       1259    65126    users    TABLE     �  CREATE TABLE public.users (
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
       public         postgres    false                       1259    65132    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       postgres    false    278            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
            public       postgres    false    279            s	           2604    65134    absensi absensi_id    DEFAULT     x   ALTER TABLE ONLY public.absensi ALTER COLUMN absensi_id SET DEFAULT nextval('public.absensi_absensi_id_seq'::regclass);
 A   ALTER TABLE public.absensi ALTER COLUMN absensi_id DROP DEFAULT;
       public       postgres    false    197    196            t	           2604    65135    class_advisor class_advisor_id    DEFAULT     �   ALTER TABLE ONLY public.class_advisor ALTER COLUMN class_advisor_id SET DEFAULT nextval('public.class_advisor_class_advisor_id_seq'::regclass);
 M   ALTER TABLE public.class_advisor ALTER COLUMN class_advisor_id DROP DEFAULT;
       public       postgres    false    199    198            u	           2604    65136     course_setting course_setting_id    DEFAULT     �   ALTER TABLE ONLY public.course_setting ALTER COLUMN course_setting_id SET DEFAULT nextval('public.course_setting_course_setting_id_seq'::regclass);
 O   ALTER TABLE public.course_setting ALTER COLUMN course_setting_id DROP DEFAULT;
       public       postgres    false    201    200            v	           2604    65137     daily_exercise daily_exercise_id    DEFAULT     �   ALTER TABLE ONLY public.daily_exercise ALTER COLUMN daily_exercise_id SET DEFAULT nextval('public.dialy_exercise_dialy_exercise_id_seq'::regclass);
 O   ALTER TABLE public.daily_exercise ALTER COLUMN daily_exercise_id DROP DEFAULT;
       public       postgres    false    203    202            �	           2604    74828 ,   daily_exercise_skill daily_exercise_skill_id    DEFAULT     �   ALTER TABLE ONLY public.daily_exercise_skill ALTER COLUMN daily_exercise_skill_id SET DEFAULT nextval('public.dialy_exercise_skill_dialy_exercise_id_seq'::regclass);
 [   ALTER TABLE public.daily_exercise_skill ALTER COLUMN daily_exercise_skill_id DROP DEFAULT;
       public       postgres    false    286    287    287            �	           2604    66555    employee_unit employee_unit_id    DEFAULT     �   ALTER TABLE ONLY public.employee_unit ALTER COLUMN employee_unit_id SET DEFAULT nextval('public.employee_unit_employee_unit_id_seq'::regclass);
 M   ALTER TABLE public.employee_unit ALTER COLUMN employee_unit_id DROP DEFAULT;
       public       postgres    false    285    284    285            w	           2604    65139 "   extracurricular extracurricular_id    DEFAULT     �   ALTER TABLE ONLY public.extracurricular ALTER COLUMN extracurricular_id SET DEFAULT nextval('public.extracurricular_extracurricular_id_seq'::regclass);
 Q   ALTER TABLE public.extracurricular ALTER COLUMN extracurricular_id DROP DEFAULT;
       public       postgres    false    205    204            x	           2604    65140     friendly_value friendly_value_id    DEFAULT     �   ALTER TABLE ONLY public.friendly_value ALTER COLUMN friendly_value_id SET DEFAULT nextval('public.friendly_value_friendly_value_id_seq'::regclass);
 O   ALTER TABLE public.friendly_value ALTER COLUMN friendly_value_id DROP DEFAULT;
       public       postgres    false    207    206            �	           2604    74893     input_analysis input_analysis_id    DEFAULT     �   ALTER TABLE ONLY public.input_analysis ALTER COLUMN input_analysis_id SET DEFAULT nextval('public.input_analysis_input_analysis_id_seq'::regclass);
 O   ALTER TABLE public.input_analysis ALTER COLUMN input_analysis_id DROP DEFAULT;
       public       postgres    false    289    288    289            �	           2604    82999 *   input_analysis_tema input_analysis_tema_id    DEFAULT     �   ALTER TABLE ONLY public.input_analysis_tema ALTER COLUMN input_analysis_tema_id SET DEFAULT nextval('public.input_analysis_tema_input_analysis_tema_id_seq'::regclass);
 Y   ALTER TABLE public.input_analysis_tema ALTER COLUMN input_analysis_tema_id DROP DEFAULT;
       public       postgres    false    296    297    297            �	           2604    123963    institution institution_id    DEFAULT     �   ALTER TABLE ONLY public.institution ALTER COLUMN institution_id SET DEFAULT nextval('public.institution_institution_id_seq'::regclass);
 I   ALTER TABLE public.institution ALTER COLUMN institution_id DROP DEFAULT;
       public       postgres    false    301    300    301            �	           2604    82973 ,   list_question_per_kd list_question_per_kd_id    DEFAULT     �   ALTER TABLE ONLY public.list_question_per_kd ALTER COLUMN list_question_per_kd_id SET DEFAULT nextval('public.list_question_per_kd_list_question_per_kd_id_seq'::regclass);
 [   ALTER TABLE public.list_question_per_kd ALTER COLUMN list_question_per_kd_id DROP DEFAULT;
       public       postgres    false    292    293    293            �	           2604    82986 0   list_question_per_tema list_question_per_tema_id    DEFAULT     �   ALTER TABLE ONLY public.list_question_per_tema ALTER COLUMN list_question_per_tema_id SET DEFAULT nextval('public.list_question_per_tema_list_question_per_tema_id_seq'::regclass);
 _   ALTER TABLE public.list_question_per_tema ALTER COLUMN list_question_per_tema_id DROP DEFAULT;
       public       postgres    false    295    294    295            z	           2604    65141    m_building building_id    DEFAULT     �   ALTER TABLE ONLY public.m_building ALTER COLUMN building_id SET DEFAULT nextval('public.m_building_building_id_seq'::regclass);
 E   ALTER TABLE public.m_building ALTER COLUMN building_id DROP DEFAULT;
       public       postgres    false    209    208            {	           2604    65142    m_class_grade class_grade_id    DEFAULT     �   ALTER TABLE ONLY public.m_class_grade ALTER COLUMN class_grade_id SET DEFAULT nextval('public.m_class_grade_class_grade_id_seq'::regclass);
 K   ALTER TABLE public.m_class_grade ALTER COLUMN class_grade_id DROP DEFAULT;
       public       postgres    false    211    210            |	           2604    65143    m_class_room class_room_id    DEFAULT     �   ALTER TABLE ONLY public.m_class_room ALTER COLUMN class_room_id SET DEFAULT nextval('public.m_class_room_class_room_id_seq'::regclass);
 I   ALTER TABLE public.m_class_room ALTER COLUMN class_room_id DROP DEFAULT;
       public       postgres    false    213    212            }	           2604    65144    m_course course_id    DEFAULT     x   ALTER TABLE ONLY public.m_course ALTER COLUMN course_id SET DEFAULT nextval('public.m_course_course_id_seq'::regclass);
 A   ALTER TABLE public.m_course ALTER COLUMN course_id DROP DEFAULT;
       public       postgres    false    215    214            ~	           2604    65145    m_department department_id    DEFAULT     �   ALTER TABLE ONLY public.m_department ALTER COLUMN department_id SET DEFAULT nextval('public.m_department_department_id_seq'::regclass);
 I   ALTER TABLE public.m_department ALTER COLUMN department_id DROP DEFAULT;
       public       postgres    false    217    216            	           2604    65146 $   m_education_level education_level_id    DEFAULT     �   ALTER TABLE ONLY public.m_education_level ALTER COLUMN education_level_id SET DEFAULT nextval('public.m_education_level_education_level_id_seq'::regclass);
 S   ALTER TABLE public.m_education_level ALTER COLUMN education_level_id DROP DEFAULT;
       public       postgres    false    219    218            �	           2604    65147    m_employee employee_id    DEFAULT     �   ALTER TABLE ONLY public.m_employee ALTER COLUMN employee_id SET DEFAULT nextval('public.m_employee_employee_id_seq'::regclass);
 E   ALTER TABLE public.m_employee ALTER COLUMN employee_id DROP DEFAULT;
       public       postgres    false    221    220            �	           2604    65148    m_floor floor_id    DEFAULT     t   ALTER TABLE ONLY public.m_floor ALTER COLUMN floor_id SET DEFAULT nextval('public.m_floor_floor_id_seq'::regclass);
 ?   ALTER TABLE public.m_floor ALTER COLUMN floor_id DROP DEFAULT;
       public       postgres    false    223    222            �	           2604    65149 
   m_kd kd_id    DEFAULT     h   ALTER TABLE ONLY public.m_kd ALTER COLUMN kd_id SET DEFAULT nextval('public.m_kd_kd_id_seq'::regclass);
 9   ALTER TABLE public.m_kd ALTER COLUMN kd_id DROP DEFAULT;
       public       postgres    false    227    224            �	           2604    65150    m_kd_detail kd_detail_id    DEFAULT     �   ALTER TABLE ONLY public.m_kd_detail ALTER COLUMN kd_detail_id SET DEFAULT nextval('public.m_kd_detail_kd_detail_id_seq'::regclass);
 G   ALTER TABLE public.m_kd_detail ALTER COLUMN kd_detail_id DROP DEFAULT;
       public       postgres    false    226    225            �	           2604    65151    m_kkm kkm_id    DEFAULT     l   ALTER TABLE ONLY public.m_kkm ALTER COLUMN kkm_id SET DEFAULT nextval('public.m_kkm_kkm_id_seq'::regclass);
 ;   ALTER TABLE public.m_kkm ALTER COLUMN kkm_id DROP DEFAULT;
       public       postgres    false    229    228            �	           2604    65152    m_lesson_hour lesson_hour_id    DEFAULT     �   ALTER TABLE ONLY public.m_lesson_hour ALTER COLUMN lesson_hour_id SET DEFAULT nextval('public.m_lesson_hour_lesson_hour_id_seq'::regclass);
 K   ALTER TABLE public.m_lesson_hour ALTER COLUMN lesson_hour_id DROP DEFAULT;
       public       postgres    false    231    230            �	           2604    65153    m_parent parent_id    DEFAULT     x   ALTER TABLE ONLY public.m_parent ALTER COLUMN parent_id SET DEFAULT nextval('public.m_parent_parent_id_seq'::regclass);
 A   ALTER TABLE public.m_parent ALTER COLUMN parent_id DROP DEFAULT;
       public       postgres    false    233    232            �	           2604    65154    m_position position_id    DEFAULT     �   ALTER TABLE ONLY public.m_position ALTER COLUMN position_id SET DEFAULT nextval('public.m_position_position_id_seq'::regclass);
 E   ALTER TABLE public.m_position ALTER COLUMN position_id DROP DEFAULT;
       public       postgres    false    235    234            �	           2604    65155    m_step_study step_study_id    DEFAULT     �   ALTER TABLE ONLY public.m_step_study ALTER COLUMN step_study_id SET DEFAULT nextval('public.m_step_study_step_study_id_seq'::regclass);
 I   ALTER TABLE public.m_step_study ALTER COLUMN step_study_id DROP DEFAULT;
       public       postgres    false    237    236            �	           2604    65156    m_student student_id    DEFAULT     |   ALTER TABLE ONLY public.m_student ALTER COLUMN student_id SET DEFAULT nextval('public.m_student_student_id_seq'::regclass);
 C   ALTER TABLE public.m_student ALTER COLUMN student_id DROP DEFAULT;
       public       postgres    false    239    238            �	           2604    65157    m_study_group study_group_id    DEFAULT     �   ALTER TABLE ONLY public.m_study_group ALTER COLUMN study_group_id SET DEFAULT nextval('public.m_study_group_study_group_id_seq'::regclass);
 K   ALTER TABLE public.m_study_group ALTER COLUMN study_group_id DROP DEFAULT;
       public       postgres    false    241    240            �	           2604    65158    m_unit unit_id    DEFAULT     p   ALTER TABLE ONLY public.m_unit ALTER COLUMN unit_id SET DEFAULT nextval('public.m_unit_unit_id_seq'::regclass);
 =   ALTER TABLE public.m_unit ALTER COLUMN unit_id DROP DEFAULT;
       public       postgres    false    243    242            �	           2604    65159    m_unit_year unit_year_id    DEFAULT     �   ALTER TABLE ONLY public.m_unit_year ALTER COLUMN unit_year_id SET DEFAULT nextval('public.m_unit_year_unit_year_id_seq'::regclass);
 G   ALTER TABLE public.m_unit_year ALTER COLUMN unit_year_id DROP DEFAULT;
       public       postgres    false    245    244            �	           2604    65160    menu menu_id    DEFAULT     l   ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);
 ;   ALTER TABLE public.menu ALTER COLUMN menu_id DROP DEFAULT;
       public       postgres    false    247    246            �	           2604    65161    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    249    248            �	           2604    65162    observasi observasi_id    DEFAULT     �   ALTER TABLE ONLY public.observasi ALTER COLUMN observasi_id SET DEFAULT nextval('public.observasi_observasi_id_seq'::regclass);
 E   ALTER TABLE public.observasi ALTER COLUMN observasi_id DROP DEFAULT;
       public       postgres    false    253    252            �	           2604    65163    parlookup parlookup_id    DEFAULT     �   ALTER TABLE ONLY public.parlookup ALTER COLUMN parlookup_id SET DEFAULT nextval('public.parlookup_parlookup_id_seq'::regclass);
 E   ALTER TABLE public.parlookup ALTER COLUMN parlookup_id DROP DEFAULT;
       public       postgres    false    255    254            �	           2604    65164    pd pd_id    DEFAULT     d   ALTER TABLE ONLY public.pd ALTER COLUMN pd_id SET DEFAULT nextval('public.pd_pd_id_seq'::regclass);
 7   ALTER TABLE public.pd ALTER COLUMN pd_id DROP DEFAULT;
       public       postgres    false    258    257            �	           2604    65165    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    260    259            �	           2604    65166    personality personality_id    DEFAULT     �   ALTER TABLE ONLY public.personality ALTER COLUMN personality_id SET DEFAULT nextval('public.personality_personality_id_seq'::regclass);
 I   ALTER TABLE public.personality ALTER COLUMN personality_id DROP DEFAULT;
       public       postgres    false    262    261            �	           2604    65167 $   physical_student physical_student_id    DEFAULT     �   ALTER TABLE ONLY public.physical_student ALTER COLUMN physical_student_id SET DEFAULT nextval('public.physical_student_physical_student_id_seq'::regclass);
 S   ALTER TABLE public.physical_student ALTER COLUMN physical_student_id DROP DEFAULT;
       public       postgres    false    264    263            �	           2604    123977    prestation prestation_id    DEFAULT     �   ALTER TABLE ONLY public.prestation ALTER COLUMN prestation_id SET DEFAULT nextval('public.prestation_prestation_id_seq'::regclass);
 G   ALTER TABLE public.prestation ALTER COLUMN prestation_id DROP DEFAULT;
       public       postgres    false    302    303    303            �	           2604    82957    quiz_per_kd quiz_per_kd_id    DEFAULT     �   ALTER TABLE ONLY public.quiz_per_kd ALTER COLUMN quiz_per_kd_id SET DEFAULT nextval('public.quiz_per_kd_quiz_per_kd_id_seq'::regclass);
 I   ALTER TABLE public.quiz_per_kd ALTER COLUMN quiz_per_kd_id DROP DEFAULT;
       public       postgres    false    290    291    291            �	           2604    140408    raport raport_id    DEFAULT     t   ALTER TABLE ONLY public.raport ALTER COLUMN raport_id SET DEFAULT nextval('public.raport_raport_id_seq'::regclass);
 ?   ALTER TABLE public.raport ALTER COLUMN raport_id DROP DEFAULT;
       public       postgres    false    308    309    309            �	           2604    65168    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    267    266            �	           2604    123945 0   setting_daily_exercise setting_daily_exercise_id    DEFAULT     �   ALTER TABLE ONLY public.setting_daily_exercise ALTER COLUMN setting_daily_exercise_id SET DEFAULT nextval('public.setting_daily_exercise_setting_daily_exercise_id_seq'::regclass);
 _   ALTER TABLE public.setting_daily_exercise ALTER COLUMN setting_daily_exercise_id DROP DEFAULT;
       public       postgres    false    298    299    299            �	           2604    65169 &   structure_tematic structure_tematic_id    DEFAULT     �   ALTER TABLE ONLY public.structure_tematic ALTER COLUMN structure_tematic_id SET DEFAULT nextval('public.structure_tematic_structure_tematic_id_seq'::regclass);
 U   ALTER TABLE public.structure_tematic ALTER COLUMN structure_tematic_id DROP DEFAULT;
       public       postgres    false    271    268            �	           2604    65170 4   structure_tematic_detail structure_tematic_detail_id    DEFAULT     �   ALTER TABLE ONLY public.structure_tematic_detail ALTER COLUMN structure_tematic_detail_id SET DEFAULT nextval('public.structure_tematic_detail_structure_tematic_detail_id_seq'::regclass);
 c   ALTER TABLE public.structure_tematic_detail ALTER COLUMN structure_tematic_detail_id DROP DEFAULT;
       public       postgres    false    270    269            �	           2604    65171 *   study_group_setting study_group_setting_id    DEFAULT     �   ALTER TABLE ONLY public.study_group_setting ALTER COLUMN study_group_setting_id SET DEFAULT nextval('public.study_group_setting_study_group_setting_id_seq'::regclass);
 Y   ALTER TABLE public.study_group_setting ALTER COLUMN study_group_setting_id DROP DEFAULT;
       public       postgres    false    273    272            �	           2604    148592    summary_kd summary_kd_id    DEFAULT     �   ALTER TABLE ONLY public.summary_kd ALTER COLUMN summary_kd_id SET DEFAULT nextval('public.summary_kd_summary_kd_id_seq'::regclass);
 G   ALTER TABLE public.summary_kd ALTER COLUMN summary_kd_id DROP DEFAULT;
       public       postgres    false    310    311    311            �	           2604    132190    summary_skill summary_skill_id    DEFAULT     �   ALTER TABLE ONLY public.summary_skill ALTER COLUMN summary_skill_id SET DEFAULT nextval('public.summary_skill_summary_skill_id_seq'::regclass);
 M   ALTER TABLE public.summary_skill ALTER COLUMN summary_skill_id DROP DEFAULT;
       public       postgres    false    306    307    307            �	           2604    124003 "   summary_tematic summary_tematic_id    DEFAULT     �   ALTER TABLE ONLY public.summary_tematic ALTER COLUMN summary_tematic_id SET DEFAULT nextval('public.summary_tematic_summary_tematic_id_seq'::regclass);
 Q   ALTER TABLE public.summary_tematic ALTER COLUMN summary_tematic_id DROP DEFAULT;
       public       postgres    false    305    304    305            �	           2604    66535    tahfizh tahfizh_id    DEFAULT     x   ALTER TABLE ONLY public.tahfizh ALTER COLUMN tahfizh_id SET DEFAULT nextval('public.tahfizh_tahfizh_id_seq'::regclass);
 A   ALTER TABLE public.tahfizh ALTER COLUMN tahfizh_id DROP DEFAULT;
       public       postgres    false    282    283    283            �	           2604    66517    tahsin tahsin_id    DEFAULT     t   ALTER TABLE ONLY public.tahsin ALTER COLUMN tahsin_id SET DEFAULT nextval('public.tahsin_tahsin_id_seq'::regclass);
 ?   ALTER TABLE public.tahsin ALTER COLUMN tahsin_id DROP DEFAULT;
       public       postgres    false    280    281    281            �	           2604    65172    teacher_note teacher_note_id    DEFAULT     �   ALTER TABLE ONLY public.teacher_note ALTER COLUMN teacher_note_id SET DEFAULT nextval('public.teacher_note_teacher_note_id_seq'::regclass);
 K   ALTER TABLE public.teacher_note ALTER COLUMN teacher_note_id DROP DEFAULT;
       public       postgres    false    275    274            �	           2604    65173 "   teacher_setting teacher_setting_id    DEFAULT     �   ALTER TABLE ONLY public.teacher_setting ALTER COLUMN teacher_setting_id SET DEFAULT nextval('public.teacher_setting_teacher_setting_id_seq'::regclass);
 Q   ALTER TABLE public.teacher_setting ALTER COLUMN teacher_setting_id DROP DEFAULT;
       public       postgres    false    277    276            �	           2604    65174    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    279    278                      0    64836    absensi 
   TABLE DATA               �   COPY public.absensi (absensi_id, student_id, absensi_type, absensi_total, month, step_study_id, absensi_insert_by, absensi_insert_time, absensi_update_time, absensi_update_by, absensi_delete_time, absensi_delete_by) FROM stdin;
    public       postgres    false    196   �      	          0    64841    class_advisor 
   TABLE DATA                  COPY public.class_advisor (class_advisor_id, employee_id, unit_year_id, study_group_id, class_advisor_insert_by, class_advisor_insert_time, class_advisor_update_time, class_advisor_update_by, class_advisor_delete_time, class_advisor_delete_by) FROM stdin;
    public       postgres    false    198   s                0    64846    course_setting 
   TABLE DATA                 COPY public.course_setting (course_setting_id, course_id, study_group_id, course_setting_status, course_setting_insert_by, course_setting_insert_time, course_setting_update_time, course_setting_update_by, course_setting_delete_time, course_setting_delete_by, unit_year_id) FROM stdin;
    public       postgres    false    200   �                0    64851    daily_exercise 
   TABLE DATA               A  COPY public.daily_exercise (daily_exercise_id, student_id, kd_detail_id, structure_tematic_id, kd_type, score, daily_exercise_type, daily_exercise_insert_by, daily_exercise_insert_time, daily_exercise_update_time, daily_exercise_update_by, daily_exercise_delete_time, daily_exercise_delete_by, step_study_id) FROM stdin;
    public       postgres    false    202         b          0    74825    daily_exercise_skill 
   TABLE DATA               H  COPY public.daily_exercise_skill (daily_exercise_skill_id, student_id, kd_id, skill_value, daily_exercise_skill_insert_by, daily_exercise_skill_insert_time, daily_exercise_skill_update_time, daily_exercise_skill_update_by, daily_exercise_skill_delete_time, daily_exercise_skill_delete_by, step_study_id, skill_type) FROM stdin;
    public       postgres    false    287   J%      `          0    66552    employee_unit 
   TABLE DATA               �   COPY public.employee_unit (employee_unit_id, unit_id, employee_id, employee_unit_insert_by, employee_unit_insert_time, employee_unit_update_time, employee_unit_update_by, employee_unit_delete_time, employee_unit_delete_by) FROM stdin;
    public       postgres    false    285   6'                0    64864    extracurricular 
   TABLE DATA                 COPY public.extracurricular (extracurricular_id, student_id, step_study_id, type, value, "desc", extracurricular_insert_by, extracurricular_insert_time, extracurricular_update_time, extracurricular_update_by, extracurricular_delete_time, extracurricular_delete_by) FROM stdin;
    public       postgres    false    204   u'                0    64872    friendly_value 
   TABLE DATA               <  COPY public.friendly_value (friendly_value_id, student_id, step_study_id, friendly_value_type, friendly_value_category, friendly_value_value, friendly_value_insert_by, friendly_value_insert_time, friendly_value_update_time, friendly_value_update_by, friendly_value_delete_time, friendly_value_delete_by) FROM stdin;
    public       postgres    false    206   G(      d          0    74890    input_analysis 
   TABLE DATA               A  COPY public.input_analysis (input_analysis_id, kd_id, student_id, number_question, value_quality, total_value, input_analysis_type, input_analysis_insert_by, input_analysis_insert_time, input_analysis_update_time, input_analysis_update_by, input_analysis_delete_time, input_analysis_delete_by, step_study_id) FROM stdin;
    public       postgres    false    289   �(      l          0    82996    input_analysis_tema 
   TABLE DATA               u  COPY public.input_analysis_tema (input_analysis_tema_id, kd_id, student_id, number_question, value_quality, total_value, input_analysis_tema_type, input_analysis_tema_insert_by, input_analysis_tema_insert_time, input_analysis_tema_update_time, input_analysis_tema_update_by, input_analysis_tema_delete_time, input_analysis_tema_delete_by, structure_tematic_id) FROM stdin;
    public       postgres    false    297   �+      p          0    123960    institution 
   TABLE DATA               �   COPY public.institution (institution_id, institutioin_name, institutioin_desc, institutioin_address, institutioin_telp, institutioin_email, institutioin_start_time, institutioin_end_time, created_at, updated_at) FROM stdin;
    public       postgres    false    301   �-      h          0    82970    list_question_per_kd 
   TABLE DATA               @  COPY public.list_question_per_kd (list_question_per_kd_id, quiz_per_kd_id, number_question, quality_question, list_question_per_kd_insert_by, list_question_per_kd_insert_time, list_question_per_kd_update_time, list_question_per_kd_update_by, list_question_per_kd_delete_time, list_question_per_kd_delete_by) FROM stdin;
    public       postgres    false    293   .      j          0    82983    list_question_per_tema 
   TABLE DATA               ]  COPY public.list_question_per_tema (list_question_per_tema_id, number_question, quality_question, list_question_per_tema_insert_by, list_question_per_tema_insert_time, list_question_per_tema_update_time, list_question_per_tema_update_by, list_question_per_tema_delete_time, list_question_per_tema_delete_by, structure_tematic_detail_id) FROM stdin;
    public       postgres    false    295   �.                0    64881 
   m_building 
   TABLE DATA               �   COPY public.m_building (building_id, building_name, building_desc, building_status, building_insert_by, building_insert_time, building_update_time, building_update_by, building_delete_time, building_delete_by) FROM stdin;
    public       postgres    false    208   	/                0    64889    m_class_grade 
   TABLE DATA                 COPY public.m_class_grade (class_grade_id, unit_id, class_grade_order, class_grade_status, class_grade_name, class_grade_desc, class_grade_insert_by, class_grade_insert_time, class_grade_update_time, class_grade_update_by, class_grade_delete_time, class_grade_delete_by) FROM stdin;
    public       postgres    false    210   &/                0    64897    m_class_room 
   TABLE DATA                 COPY public.m_class_room (class_room_id, unit_id, class_room_name, class_room_text, class_room_status, class_room_desc, class_room_insert_by, class_room_insert_time, class_room_update_time, class_room_update_by, class_room_delete_time, class_room_delete_by, floor_id) FROM stdin;
    public       postgres    false    212   �/                0    64905    m_course 
   TABLE DATA               �   COPY public.m_course (course_id, course_status, course_name, course_code, course_desc, course_insert_by, course_insert_time, course_update_time, course_update_by, course_delete_time, course_delete_by, kkm_value, course_type) FROM stdin;
    public       postgres    false    214   0                0    64913    m_department 
   TABLE DATA               �   COPY public.m_department (department_id, department_name, department_desc, department_status, department_insert_by, department_insert_time, department_update_time, department_update_by, department_delete_time, department_delete_by) FROM stdin;
    public       postgres    false    216   �0                0    64921    m_education_level 
   TABLE DATA               -  COPY public.m_education_level (education_level_id, education_level_name, education_level_status, education_level_resume, education_level_insert_by, education_level_insert_time, education_level_update_time, education_level_update_by, education_level_delete_time, education_level_delete_by) FROM stdin;
    public       postgres    false    218   �0                0    64929 
   m_employee 
   TABLE DATA               0  COPY public.m_employee (employee_id, employee_status, employee_id_card, position_id, user_id, employee_type, employee_name, employee_working_status, employee_nik, employee_gender, employee_birth_place, employee_birth_date, employee_religion, employee_identity, employee_last_education, employee_marital_status, employee_hp, employee_website, employee_telp, employee_address, employee_photo, employee_desc, employee_email, employee_insert_by, employee_insert_time, employee_update_time, employee_update_by, employee_delete_time, employee_delete_by) FROM stdin;
    public       postgres    false    220   �0      !          0    64937    m_floor 
   TABLE DATA               �   COPY public.m_floor (floor_id, building_id, floor_name, floor_desc, floor_insert_by, floor_insert_time, floor_update_time, floor_update_by, floor_delete_time, floor_delete_by) FROM stdin;
    public       postgres    false    222   �1      #          0    64942    m_kd 
   TABLE DATA               �   COPY public.m_kd (kd_id, unit_year_id, course_id, kd_code, kd_name, kd_desc, kd_insert_by, kd_insert_time, kd_update_time, kd_update_by, kd_delete_time, kd_delete_by, kd_type) FROM stdin;
    public       postgres    false    224   �1      $          0    64948    m_kd_detail 
   TABLE DATA               �   COPY public.m_kd_detail (kd_detail_id, kd_id, step_study_id, kd_detail_insert_by, kd_detail_insert_time, kd_detail_update_time, kd_detail_update_by, kd_detail_delete_time, kd_detail_delete_by) FROM stdin;
    public       postgres    false    225   �2      '          0    64955    m_kkm 
   TABLE DATA               �   COPY public.m_kkm (kkm_id, kkm_value, kkm_a, kkm_b, kkm_c, kkm_d, kkm_insert_by, kkm_insert_time, kkm_update_time, kkm_update_by, kkm_delete_time, kkm_delete_by, step_study_id, course_id) FROM stdin;
    public       postgres    false    228   J3      )          0    64960    m_lesson_hour 
   TABLE DATA               8  COPY public.m_lesson_hour (lesson_hour_id, lesson_day, hour_to, lesson_hour_type, lesson_hour_start, lesson_hour_end, lesson_hour_desc, lesson_hour_status, lesson_hour_insert_by, lesson_hour_insert_time, lesson_hour_update_time, lesson_hour_update_by, lesson_hour_delete_time, lesson_hour_delete_by) FROM stdin;
    public       postgres    false    230   �3      +          0    64968    m_parent 
   TABLE DATA               �  COPY public.m_parent (parent_id, student_id, user_id, parent_name, parent_id_card, parent_status, parent_nickname, parent_gender, parent_birth_place, parent_birth_date, parent_address, parent_hp, parent_telp, parent_email, parent_photo, parent_hobby, parent_religion, parent_insert_by, parent_insert_time, parent_update_time, parent_update_by, parent_delete_time, parent_delete_by) FROM stdin;
    public       postgres    false    232   #4      -          0    64976 
   m_position 
   TABLE DATA               �   COPY public.m_position (position_id, department_id, position_name, position_desc, position_status, position_insert_by, position_insert_time, position_update_time, position_update_by, position_delete_time, position_delete_by) FROM stdin;
    public       postgres    false    234   @4      /          0    64984    m_step_study 
   TABLE DATA               $  COPY public.m_step_study (step_study_id, unit_year_id, step_study_name, step_study_desc, step_study_start, step_study_end, step_study_status, step_study_insert_by, step_study_insert_time, step_study_update_time, step_study_update_by, step_study_delete_time, step_study_delete_by) FROM stdin;
    public       postgres    false    236   ]4      1          0    64992 	   m_student 
   TABLE DATA               N  COPY public.m_student (student_id, unit_id, class_grade_id, user_id, student_name, student_id_card, student_status, student_nickname, student_gender, student_birth_place, student_birth_date, student_address, student_hp, student_telp, student_email, student_father_hp, student_mother_hp, student_child_to, student_brother, student_child_status, student_photo, student_hobby, student_orphan_status, student_school_origin, student_school_origin_address, student_nisn, student_test_number, student_achievement, student_blood_type, student_religion, student_kk, student_ktp, student_ijazah, student_mother_name, student_father_name, student_mother_job, student_father_job, student_father_income, student_mother_income, student_insert_by, student_insert_time, student_update_time, student_update_by, student_delete_time, student_delete_by) FROM stdin;
    public       postgres    false    238   �4      3          0    65000    m_study_group 
   TABLE DATA               '  COPY public.m_study_group (study_group_id, unit_id, class_grade_id, class_room_id, study_group_status, study_group_name, study_group_desc, study_group_insert_by, study_group_insert_time, study_group_update_time, study_group_update_by, study_group_delete_time, study_group_delete_by) FROM stdin;
    public       postgres    false    240   h<      5          0    65008    m_unit 
   TABLE DATA                  COPY public.m_unit (unit_id, education_level_id, unit_name, unit_desc, unit_logo, unit_prefix, unit_address, unit_telp, unit_email, unit_website, unit_status, unit_insert_by, unit_insert_time, unit_update_time, unit_update_by, unit_delete_time, unit_delete_by, foundation_id) FROM stdin;
    public       postgres    false    242   �<      7          0    65016    m_unit_year 
   TABLE DATA               $  COPY public.m_unit_year (unit_year_id, unit_id, unit_year_status, unit_year_name, unit_year_prefix, unit_year_start, unit_year_end, unit_year_desc, unit_year_insert_by, unit_year_insert_time, unit_year_update_time, unit_year_update_by, unit_year_delete_time, unit_year_delete_by) FROM stdin;
    public       postgres    false    244   �=      9          0    65024    menu 
   TABLE DATA               r   COPY public.menu (menu_id, menu_name, menu_desc, menu_url, menu_parent, type, created_at, updated_at) FROM stdin;
    public       postgres    false    246   �=      ;          0    65032 
   migrations 
   TABLE DATA               :   COPY public.migrations (id, migration, batch) FROM stdin;
    public       postgres    false    248   �C      =          0    65037    model_has_permissions 
   TABLE DATA               T   COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
    public       postgres    false    250   ^J      >          0    65040    model_has_roles 
   TABLE DATA               H   COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
    public       postgres    false    251   {J      ?          0    65043 	   observasi 
   TABLE DATA                 COPY public.observasi (observasi_id, student_id, step_study_id, observasi_type, observasi_category, observasi_insert_by, observasi_insert_time, observasi_update_time, observasi_update_by, observasi_delete_time, observasi_delete_by, observasi_value) FROM stdin;
    public       postgres    false    252   �J      A          0    65052 	   parlookup 
   TABLE DATA               q   COPY public.parlookup (parlookup_id, name, value, category, "desc", created_at, updated_at, unit_id) FROM stdin;
    public       postgres    false    254   �L      C          0    65060    password_resets 
   TABLE DATA               C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public       postgres    false    256   vO      D          0    65063    pd 
   TABLE DATA               �   COPY public.pd (pd_id, student_id, step_study_id, pd_type, pd_category, pd_value, pd_insert_by, pd_insert_time, pd_update_time, pd_update_by, pd_delete_time, pd_delete_by) FROM stdin;
    public       postgres    false    257   �O      F          0    65072    permissions 
   TABLE DATA               \   COPY public.permissions (id, name, guard_name, created_at, updated_at, menu_id) FROM stdin;
    public       postgres    false    259   �P      H          0    65077    personality 
   TABLE DATA                 COPY public.personality (personality_id, student_id, personality_type, personality_value, personality_insert_by, personality_insert_time, personality_update_time, personality_update_by, personality_delete_time, personality_delete_by, step_study_id) FROM stdin;
    public       postgres    false    261   �Y      J          0    65082    physical_student 
   TABLE DATA               :  COPY public.physical_student (physical_student_id, student_id, physical_type, physical_category, physical_value, step_study_id, physical_student_insert_by, physical_student_insert_time, physical_student_update_time, physical_student_update_by, physical_student_delete_time, physical_student_delete_by) FROM stdin;
    public       postgres    false    263   �Z      r          0    123974 
   prestation 
   TABLE DATA               �   COPY public.prestation (prestation_id, student_id, step_study_id, type, value, "desc", prestation_insert_by, prestation_insert_time, prestation_update_time, prestation_update_by, prestation_delete_time, prestation_delete_by) FROM stdin;
    public       postgres    false    303   /\      f          0    82954    quiz_per_kd 
   TABLE DATA                 COPY public.quiz_per_kd (quiz_per_kd_id, kd_id, total_question, type_question, description, quiz_per_kd_insert_by, quiz_per_kd_insert_time, quiz_per_kd_update_time, quiz_per_kd_update_by, quiz_per_kd_delete_time, quiz_per_kd_delete_by, step_study_id) FROM stdin;
    public       postgres    false    291   �\      x          0    140405    raport 
   TABLE DATA               H  COPY public.raport (raport_id, course_id, student_id, step_study_id, total_pengetahuan, total_keterampilan, predikat_pengetahuan, predikat_keterampilan, keterangan_pengetahuan, keterangan_keterampilan, raport_insert_by, raport_insert_time, raport_update_time, raport_update_by, raport_delete_time, raport_delete_by) FROM stdin;
    public       postgres    false    309   ]      L          0    65090    role_has_permissions 
   TABLE DATA               F   COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
    public       postgres    false    265   �`      M          0    65093    roles 
   TABLE DATA               M   COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
    public       postgres    false    266   �`      n          0    123942    setting_daily_exercise 
   TABLE DATA               �   COPY public.setting_daily_exercise (setting_daily_exercise_id, kd_id, skill_type, step_study_id, created_at, updated_at) FROM stdin;
    public       postgres    false    299   la      O          0    65098    structure_tematic 
   TABLE DATA               `  COPY public.structure_tematic (structure_tematic_id, structure_tematic_name, study_group_id, step_study_id, structure_tematic_desc, structure_tematic_question, structure_tematic_insert_by, structure_tematic_insert_time, structure_tematic_update_time, structure_tematic_update_by, structure_tematic_delete_time, structure_tematic_delete_by) FROM stdin;
    public       postgres    false    268   �a      P          0    65104    structure_tematic_detail 
   TABLE DATA               �  COPY public.structure_tematic_detail (structure_tematic_detail_id, structure_tematic_id, total_question, structure_tematic_detail_insert_by, structure_tematic_detail_insert_time, structure_tematic_detail_update_time, structure_tematic_detail_update_by, structure_tematic_detail_delete_time, structure_tematic_detail_delete_by, kd_id, question_uts, question_uas, question_daily, type_question) FROM stdin;
    public       postgres    false    269   b      S          0    65111    study_group_setting 
   TABLE DATA               K  COPY public.study_group_setting (study_group_setting_id, student_id, study_group_id, study_group_setting_status, study_group_setting_insert_by, study_group_setting_insert_time, study_group_setting_update_time, study_group_setting_update_by, study_group_setting_delete_time, study_group_setting_delete_by, unit_year_id) FROM stdin;
    public       postgres    false    272   �b      z          0    148589 
   summary_kd 
   TABLE DATA               �   COPY public.summary_kd (summary_kd_id, kd_id, student_id, step_study_id, type, total, summary_kd_insert_by, summary_kd_insert_time, summary_kd_update_time, summary_kd_update_by, summary_kd_delete_time, summary_kd_delete_by) FROM stdin;
    public       postgres    false    311   ;c      v          0    132187    summary_skill 
   TABLE DATA                 COPY public.summary_skill (summary_skill_id, kd_id, student_id, step_study_id, total_skill, summary_skill_insert_by, summary_skill_insert_time, summary_skill_update_time, summary_skill_update_by, summary_skill_delete_time, summary_skill_delete_by) FROM stdin;
    public       postgres    false    307   id      t          0    124000    summary_tematic 
   TABLE DATA               *  COPY public.summary_tematic (summary_tematic_id, kd_id, student_id, structure_tematic_id, type, total, summary_tematic_insert_by, summary_tematic_insert_time, summary_tematic_update_time, summary_tematic_update_by, summary_tematic_delete_time, summary_tematic_delete_by, step_study_id) FROM stdin;
    public       postgres    false    305   }e      ^          0    66532    tahfizh 
   TABLE DATA               �   COPY public.tahfizh (tahfizh_id, tahfizh_type, tahfizh_value, student_id, step_study_id, tahfizh_insert_by, tahfizh_insert_time, tahfizh_update_time, tahfizh_update_by, tahfizh_delete_time, tahfizh_delete_by) FROM stdin;
    public       postgres    false    283   f      \          0    66514    tahsin 
   TABLE DATA               �   COPY public.tahsin (tahsin_id, tahsin_type, tahsin_value, student_id, step_study_id, tahsin_insert_by, tahsin_insert_time, tahsin_update_time, tahsin_update_by, tahsin_delete_time, tahsin_delete_by) FROM stdin;
    public       postgres    false    281   �f      U          0    65116    teacher_note 
   TABLE DATA                  COPY public.teacher_note (teacher_note_id, student_id, step_study_id, raport_pts, raport_pas, teacher_note_insert_by, teacher_note_insert_time, teacher_note_update_time, teacher_note_update_by, teacher_note_delete_time, teacher_note_delete_by) FROM stdin;
    public       postgres    false    274   ~g      W          0    65121    teacher_setting 
   TABLE DATA               3  COPY public.teacher_setting (teacher_setting_id, employee_id, unit_year_id, course_id, teacher_setting_status, teacher_setting_insert_by, teacher_setting_insert_time, teacher_setting_update_time, teacher_setting_update_by, teacher_setting_delete_time, teacher_setting_delete_by, study_group_id) FROM stdin;
    public       postgres    false    276   �h      Y          0    65126    users 
   TABLE DATA               �   COPY public.users (id, email_verified_at, password, remember_token, created_at, updated_at, username, user_status, api_token) FROM stdin;
    public       postgres    false    278   �h      �           0    0    absensi_absensi_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.absensi_absensi_id_seq', 326, true);
            public       postgres    false    197            �           0    0 "   class_advisor_class_advisor_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.class_advisor_class_advisor_id_seq', 2, true);
            public       postgres    false    199            �           0    0 $   course_setting_course_setting_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.course_setting_course_setting_id_seq', 18, true);
            public       postgres    false    201            �           0    0 $   dialy_exercise_dialy_exercise_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.dialy_exercise_dialy_exercise_id_seq', 1864, true);
            public       postgres    false    203            �           0    0 *   dialy_exercise_skill_dialy_exercise_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.dialy_exercise_skill_dialy_exercise_id_seq', 7932, true);
            public       postgres    false    286            �           0    0 "   employee_unit_employee_unit_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.employee_unit_employee_unit_id_seq', 7, true);
            public       postgres    false    284            �           0    0 &   extracurricular_extracurricular_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.extracurricular_extracurricular_id_seq', 232, true);
            public       postgres    false    205            �           0    0 $   friendly_value_friendly_value_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public.friendly_value_friendly_value_id_seq', 36, true);
            public       postgres    false    207            �           0    0 $   input_analysis_input_analysis_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.input_analysis_input_analysis_id_seq', 4042, true);
            public       postgres    false    288            �           0    0 .   input_analysis_tema_input_analysis_tema_id_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.input_analysis_tema_input_analysis_tema_id_seq', 1213, true);
            public       postgres    false    296            �           0    0    institution_institution_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.institution_institution_id_seq', 1, false);
            public       postgres    false    300            �           0    0 0   list_question_per_kd_list_question_per_kd_id_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.list_question_per_kd_list_question_per_kd_id_seq', 180, true);
            public       postgres    false    292            �           0    0 4   list_question_per_tema_list_question_per_tema_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.list_question_per_tema_list_question_per_tema_id_seq', 206, true);
            public       postgres    false    294            �           0    0    m_building_building_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_building_building_id_seq', 1, false);
            public       postgres    false    209            �           0    0     m_class_grade_class_grade_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.m_class_grade_class_grade_id_seq', 6, true);
            public       postgres    false    211            �           0    0    m_class_room_class_room_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.m_class_room_class_room_id_seq', 5, true);
            public       postgres    false    213            �           0    0    m_course_course_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.m_course_course_id_seq', 18, true);
            public       postgres    false    215            �           0    0    m_department_department_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.m_department_department_id_seq', 1, false);
            public       postgres    false    217            �           0    0 (   m_education_level_education_level_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.m_education_level_education_level_id_seq', 1, false);
            public       postgres    false    219            �           0    0    m_employee_employee_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_employee_employee_id_seq', 10, true);
            public       postgres    false    221            �           0    0    m_floor_floor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.m_floor_floor_id_seq', 1, false);
            public       postgres    false    223            �           0    0    m_kd_detail_kd_detail_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.m_kd_detail_kd_detail_id_seq', 19, true);
            public       postgres    false    226            �           0    0    m_kd_kd_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.m_kd_kd_id_seq', 19, true);
            public       postgres    false    227            �           0    0    m_kkm_kkm_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.m_kkm_kkm_id_seq', 2, true);
            public       postgres    false    229            �           0    0     m_lesson_hour_lesson_hour_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.m_lesson_hour_lesson_hour_id_seq', 2, true);
            public       postgres    false    231            �           0    0    m_parent_parent_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.m_parent_parent_id_seq', 1, false);
            public       postgres    false    233            �           0    0    m_position_position_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.m_position_position_id_seq', 1, false);
            public       postgres    false    235            �           0    0    m_step_study_step_study_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.m_step_study_step_study_id_seq', 1, true);
            public       postgres    false    237            �           0    0    m_student_student_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.m_student_student_id_seq', 22, true);
            public       postgres    false    239            �           0    0     m_study_group_study_group_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.m_study_group_study_group_id_seq', 1, true);
            public       postgres    false    241            �           0    0    m_unit_unit_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.m_unit_unit_id_seq', 2, true);
            public       postgres    false    243            �           0    0    m_unit_year_unit_year_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.m_unit_year_unit_year_id_seq', 1, true);
            public       postgres    false    245            �           0    0    menu_menu_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.menu_menu_id_seq', 79, true);
            public       postgres    false    247            �           0    0    migrations_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.migrations_id_seq', 112, true);
            public       postgres    false    249            �           0    0    observasi_observasi_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.observasi_observasi_id_seq', 10294, true);
            public       postgres    false    253            �           0    0    parlookup_parlookup_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.parlookup_parlookup_id_seq', 74, true);
            public       postgres    false    255            �           0    0    pd_pd_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.pd_pd_id_seq', 60, true);
            public       postgres    false    258            �           0    0    permissions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.permissions_id_seq', 293, true);
            public       postgres    false    260            �           0    0    personality_personality_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.personality_personality_id_seq', 351, true);
            public       postgres    false    262            �           0    0 (   physical_student_physical_student_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.physical_student_physical_student_id_seq', 878, true);
            public       postgres    false    264            �           0    0    prestation_prestation_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.prestation_prestation_id_seq', 364, true);
            public       postgres    false    302            �           0    0    quiz_per_kd_quiz_per_kd_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.quiz_per_kd_quiz_per_kd_id_seq', 31, true);
            public       postgres    false    290            �           0    0    raport_raport_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.raport_raport_id_seq', 234, true);
            public       postgres    false    308            �           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 2, true);
            public       postgres    false    267            �           0    0 4   setting_daily_exercise_setting_daily_exercise_id_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public.setting_daily_exercise_setting_daily_exercise_id_seq', 248, true);
            public       postgres    false    298            �           0    0 8   structure_tematic_detail_structure_tematic_detail_id_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public.structure_tematic_detail_structure_tematic_detail_id_seq', 65, true);
            public       postgres    false    270            �           0    0 *   structure_tematic_structure_tematic_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.structure_tematic_structure_tematic_id_seq', 11, true);
            public       postgres    false    271            �           0    0 .   study_group_setting_study_group_setting_id_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public.study_group_setting_study_group_setting_id_seq', 18, true);
            public       postgres    false    273            �           0    0    summary_kd_summary_kd_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.summary_kd_summary_kd_id_seq', 144, true);
            public       postgres    false    310            �           0    0 "   summary_skill_summary_skill_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.summary_skill_summary_skill_id_seq', 90, true);
            public       postgres    false    306            �           0    0 &   summary_tematic_summary_tematic_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.summary_tematic_summary_tematic_id_seq', 863, true);
            public       postgres    false    304            �           0    0    tahfizh_tahfizh_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tahfizh_tahfizh_id_seq', 225, true);
            public       postgres    false    282            �           0    0    tahsin_tahsin_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tahsin_tahsin_id_seq', 335, true);
            public       postgres    false    280            �           0    0     teacher_note_teacher_note_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.teacher_note_teacher_note_id_seq', 6, true);
            public       postgres    false    275            �           0    0 &   teacher_setting_teacher_setting_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.teacher_setting_teacher_setting_id_seq', 3, true);
            public       postgres    false    277            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 34, true);
            public       postgres    false    279            �	           2606    65176    absensi absensi_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_pkey PRIMARY KEY (absensi_id);
 >   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_pkey;
       public         postgres    false    196            �	           2606    65178     class_advisor class_advisor_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_pkey PRIMARY KEY (class_advisor_id);
 J   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_pkey;
       public         postgres    false    198            �	           2606    65180 "   course_setting course_setting_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_pkey PRIMARY KEY (course_setting_id);
 L   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_pkey;
       public         postgres    false    200            �	           2606    65182 "   daily_exercise dialy_exercise_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT dialy_exercise_pkey PRIMARY KEY (daily_exercise_id);
 L   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT dialy_exercise_pkey;
       public         postgres    false    202            
           2606    74830 .   daily_exercise_skill dialy_exercise_skill_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT dialy_exercise_skill_pkey PRIMARY KEY (daily_exercise_skill_id);
 X   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT dialy_exercise_skill_pkey;
       public         postgres    false    287            
           2606    66557     employee_unit employee_unit_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_pkey PRIMARY KEY (employee_unit_id);
 J   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_pkey;
       public         postgres    false    285            �	           2606    65186 $   extracurricular extracurricular_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_pkey PRIMARY KEY (extracurricular_id);
 N   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_pkey;
       public         postgres    false    204            �	           2606    65188 "   friendly_value friendly_value_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_pkey PRIMARY KEY (friendly_value_id);
 L   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_pkey;
       public         postgres    false    206            
           2606    74898 "   input_analysis input_analysis_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_pkey PRIMARY KEY (input_analysis_id);
 L   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_pkey;
       public         postgres    false    289            
           2606    83004 ,   input_analysis_tema input_analysis_tema_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_pkey PRIMARY KEY (input_analysis_tema_id);
 V   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_pkey;
       public         postgres    false    297            
           2606    123968    institution institution_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (institution_id);
 F   ALTER TABLE ONLY public.institution DROP CONSTRAINT institution_pkey;
       public         postgres    false    301            
           2606    82975 .   list_question_per_kd list_question_per_kd_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_kd
    ADD CONSTRAINT list_question_per_kd_pkey PRIMARY KEY (list_question_per_kd_id);
 X   ALTER TABLE ONLY public.list_question_per_kd DROP CONSTRAINT list_question_per_kd_pkey;
       public         postgres    false    293            
           2606    82988 2   list_question_per_tema list_question_per_tema_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_tema
    ADD CONSTRAINT list_question_per_tema_pkey PRIMARY KEY (list_question_per_tema_id);
 \   ALTER TABLE ONLY public.list_question_per_tema DROP CONSTRAINT list_question_per_tema_pkey;
       public         postgres    false    295            �	           2606    65190    m_building m_building_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_building
    ADD CONSTRAINT m_building_pkey PRIMARY KEY (building_id);
 D   ALTER TABLE ONLY public.m_building DROP CONSTRAINT m_building_pkey;
       public         postgres    false    208            �	           2606    65192     m_class_grade m_class_grade_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_class_grade
    ADD CONSTRAINT m_class_grade_pkey PRIMARY KEY (class_grade_id);
 J   ALTER TABLE ONLY public.m_class_grade DROP CONSTRAINT m_class_grade_pkey;
       public         postgres    false    210            �	           2606    65194    m_class_room m_class_room_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_pkey PRIMARY KEY (class_room_id);
 H   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_pkey;
       public         postgres    false    212            �	           2606    65196    m_course m_course_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.m_course
    ADD CONSTRAINT m_course_pkey PRIMARY KEY (course_id);
 @   ALTER TABLE ONLY public.m_course DROP CONSTRAINT m_course_pkey;
       public         postgres    false    214            �	           2606    65198    m_department m_department_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_department
    ADD CONSTRAINT m_department_pkey PRIMARY KEY (department_id);
 H   ALTER TABLE ONLY public.m_department DROP CONSTRAINT m_department_pkey;
       public         postgres    false    216            �	           2606    65200 (   m_education_level m_education_level_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.m_education_level
    ADD CONSTRAINT m_education_level_pkey PRIMARY KEY (education_level_id);
 R   ALTER TABLE ONLY public.m_education_level DROP CONSTRAINT m_education_level_pkey;
       public         postgres    false    218            �	           2606    65202    m_employee m_employee_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_pkey PRIMARY KEY (employee_id);
 D   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_pkey;
       public         postgres    false    220            �	           2606    65204    m_floor m_floor_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.m_floor
    ADD CONSTRAINT m_floor_pkey PRIMARY KEY (floor_id);
 >   ALTER TABLE ONLY public.m_floor DROP CONSTRAINT m_floor_pkey;
       public         postgres    false    222            �	           2606    65206    m_kd_detail m_kd_detail_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_pkey PRIMARY KEY (kd_detail_id);
 F   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_pkey;
       public         postgres    false    225            �	           2606    65208    m_kd m_kd_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_pkey PRIMARY KEY (kd_id);
 8   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_pkey;
       public         postgres    false    224            �	           2606    65210    m_kkm m_kkm_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_pkey PRIMARY KEY (kkm_id);
 :   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_pkey;
       public         postgres    false    228            �	           2606    65212     m_lesson_hour m_lesson_hour_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_lesson_hour
    ADD CONSTRAINT m_lesson_hour_pkey PRIMARY KEY (lesson_hour_id);
 J   ALTER TABLE ONLY public.m_lesson_hour DROP CONSTRAINT m_lesson_hour_pkey;
       public         postgres    false    230            �	           2606    65214    m_parent m_parent_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_pkey PRIMARY KEY (parent_id);
 @   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_pkey;
       public         postgres    false    232            �	           2606    65216    m_position m_position_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.m_position
    ADD CONSTRAINT m_position_pkey PRIMARY KEY (position_id);
 D   ALTER TABLE ONLY public.m_position DROP CONSTRAINT m_position_pkey;
       public         postgres    false    234            �	           2606    65218    m_step_study m_step_study_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.m_step_study
    ADD CONSTRAINT m_step_study_pkey PRIMARY KEY (step_study_id);
 H   ALTER TABLE ONLY public.m_step_study DROP CONSTRAINT m_step_study_pkey;
       public         postgres    false    236            �	           2606    65220    m_student m_student_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_pkey PRIMARY KEY (student_id);
 B   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_pkey;
       public         postgres    false    238            �	           2606    65222     m_study_group m_study_group_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_pkey PRIMARY KEY (study_group_id);
 J   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_pkey;
       public         postgres    false    240            �	           2606    65224    m_unit m_unit_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.m_unit
    ADD CONSTRAINT m_unit_pkey PRIMARY KEY (unit_id);
 <   ALTER TABLE ONLY public.m_unit DROP CONSTRAINT m_unit_pkey;
       public         postgres    false    242            �	           2606    65226    m_unit_year m_unit_year_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.m_unit_year
    ADD CONSTRAINT m_unit_year_pkey PRIMARY KEY (unit_year_id);
 F   ALTER TABLE ONLY public.m_unit_year DROP CONSTRAINT m_unit_year_pkey;
       public         postgres    false    244            �	           2606    65228    menu menu_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public         postgres    false    246            �	           2606    65230    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public         postgres    false    248            �	           2606    65232 0   model_has_permissions model_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);
 Z   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_pkey;
       public         postgres    false    250    250    250            �	           2606    65234 $   model_has_roles model_has_roles_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);
 N   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_pkey;
       public         postgres    false    251    251    251            �	           2606    65236    observasi observasi_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_pkey PRIMARY KEY (observasi_id);
 B   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_pkey;
       public         postgres    false    252            �	           2606    65238    parlookup parlookup_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.parlookup
    ADD CONSTRAINT parlookup_pkey PRIMARY KEY (parlookup_id);
 B   ALTER TABLE ONLY public.parlookup DROP CONSTRAINT parlookup_pkey;
       public         postgres    false    254            �	           2606    65240 
   pd pd_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_pkey PRIMARY KEY (pd_id);
 4   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_pkey;
       public         postgres    false    257            �	           2606    65242    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public         postgres    false    259            �	           2606    65244    personality personality_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_pkey PRIMARY KEY (personality_id);
 F   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_pkey;
       public         postgres    false    261            �	           2606    65246 &   physical_student physical_student_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_pkey PRIMARY KEY (physical_student_id);
 P   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_pkey;
       public         postgres    false    263            
           2606    123982    prestation prestation_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_pkey PRIMARY KEY (prestation_id);
 D   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_pkey;
       public         postgres    false    303            
           2606    82962    quiz_per_kd quiz_per_kd_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_pkey PRIMARY KEY (quiz_per_kd_id);
 F   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_pkey;
       public         postgres    false    291            $
           2606    140413    raport raport_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_pkey PRIMARY KEY (raport_id);
 <   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_pkey;
       public         postgres    false    309            �	           2606    65248 .   role_has_permissions role_has_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);
 X   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_pkey;
       public         postgres    false    265    265            �	           2606    65250    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public         postgres    false    266            
           2606    123947 2   setting_daily_exercise setting_daily_exercise_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_pkey PRIMARY KEY (setting_daily_exercise_id);
 \   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_pkey;
       public         postgres    false    299            �	           2606    65252 6   structure_tematic_detail structure_tematic_detail_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_pkey PRIMARY KEY (structure_tematic_detail_id);
 `   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_pkey;
       public         postgres    false    269            �	           2606    65254 (   structure_tematic structure_tematic_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_pkey PRIMARY KEY (structure_tematic_id);
 R   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_pkey;
       public         postgres    false    268             
           2606    65256 ,   study_group_setting study_group_setting_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_pkey PRIMARY KEY (study_group_setting_id);
 V   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_pkey;
       public         postgres    false    272            &
           2606    148594    summary_kd summary_kd_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_pkey PRIMARY KEY (summary_kd_id);
 D   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_pkey;
       public         postgres    false    311            "
           2606    132192     summary_skill summary_skill_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_pkey PRIMARY KEY (summary_skill_id);
 J   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_pkey;
       public         postgres    false    307             
           2606    124005 $   summary_tematic summary_tematic_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_pkey PRIMARY KEY (summary_tematic_id);
 N   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_pkey;
       public         postgres    false    305            

           2606    66537    tahfizh tahfizh_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_pkey PRIMARY KEY (tahfizh_id);
 >   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_pkey;
       public         postgres    false    283            
           2606    66519    tahsin tahsin_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_pkey PRIMARY KEY (tahsin_id);
 <   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_pkey;
       public         postgres    false    281            
           2606    65258    teacher_note teacher_note_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_pkey PRIMARY KEY (teacher_note_id);
 H   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_pkey;
       public         postgres    false    274            
           2606    65260 $   teacher_setting teacher_setting_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_pkey PRIMARY KEY (teacher_setting_id);
 N   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_pkey;
       public         postgres    false    276            
           2606    65262    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    278            �	           1259    65263 /   model_has_permissions_model_id_model_type_index    INDEX     �   CREATE INDEX model_has_permissions_model_id_model_type_index ON public.model_has_permissions USING btree (model_id, model_type);
 C   DROP INDEX public.model_has_permissions_model_id_model_type_index;
       public         postgres    false    250    250            �	           1259    65264 )   model_has_roles_model_id_model_type_index    INDEX     u   CREATE INDEX model_has_roles_model_id_model_type_index ON public.model_has_roles USING btree (model_id, model_type);
 =   DROP INDEX public.model_has_roles_model_id_model_type_index;
       public         postgres    false    251    251            �	           1259    65265    password_resets_email_index    INDEX     X   CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);
 /   DROP INDEX public.password_resets_email_index;
       public         postgres    false    256            �	           1259    65266    permissions_menu_id_index    INDEX     T   CREATE INDEX permissions_menu_id_index ON public.permissions USING btree (menu_id);
 -   DROP INDEX public.permissions_menu_id_index;
       public         postgres    false    259            '
           2606    65267 %   absensi absensi_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_step_study_id_foreign;
       public       postgres    false    196    236    2518            (
           2606    65272 "   absensi absensi_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.absensi
    ADD CONSTRAINT absensi_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.absensi DROP CONSTRAINT absensi_student_id_foreign;
       public       postgres    false    196    238    2520            )
           2606    65277 /   class_advisor class_advisor_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_employee_id_foreign;
       public       postgres    false    198    220    2502            *
           2606    65282 2   class_advisor class_advisor_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_study_group_id_foreign;
       public       postgres    false    198    240    2522            +
           2606    65287 0   class_advisor class_advisor_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.class_advisor
    ADD CONSTRAINT class_advisor_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.class_advisor DROP CONSTRAINT class_advisor_unit_year_id_foreign;
       public       postgres    false    198    244    2526            ,
           2606    65292 /   course_setting course_setting_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_course_id_foreign;
       public       postgres    false    200    214    2496            -
           2606    65297 4   course_setting course_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_study_group_id_foreign;
       public       postgres    false    200    240    2522            .
           2606    65302 2   course_setting course_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.course_setting
    ADD CONSTRAINT course_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.course_setting DROP CONSTRAINT course_setting_unit_year_id_foreign;
       public       postgres    false    200    244    2526            p
           2606    123912 ?   daily_exercise_skill daily_exercise_skill_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT daily_exercise_skill_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT daily_exercise_skill_step_study_id_foreign;
       public       postgres    false    287    236    2518            2
           2606    115725 3   daily_exercise daily_exercise_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT daily_exercise_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT daily_exercise_step_study_id_foreign;
       public       postgres    false    236    202    2518            /
           2606    65312 2   daily_exercise dialy_exercise_kd_detail_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT dialy_exercise_kd_detail_id_foreign FOREIGN KEY (kd_detail_id) REFERENCES public.m_kd_detail(kd_detail_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT dialy_exercise_kd_detail_id_foreign;
       public       postgres    false    202    225    2508            q
           2606    74836 7   daily_exercise_skill dialy_exercise_skill_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT dialy_exercise_skill_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT dialy_exercise_skill_kd_id_foreign;
       public       postgres    false    224    287    2506            r
           2606    74831 <   daily_exercise_skill dialy_exercise_skill_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise_skill
    ADD CONSTRAINT dialy_exercise_skill_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.daily_exercise_skill DROP CONSTRAINT dialy_exercise_skill_student_id_foreign;
       public       postgres    false    287    2520    238            0
           2606    65317 :   daily_exercise dialy_exercise_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT dialy_exercise_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT dialy_exercise_structure_tematic_id_foreign;
       public       postgres    false    202    268    2556            1
           2606    65322 0   daily_exercise dialy_exercise_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.daily_exercise
    ADD CONSTRAINT dialy_exercise_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.daily_exercise DROP CONSTRAINT dialy_exercise_student_id_foreign;
       public       postgres    false    202    238    2520            n
           2606    66563 /   employee_unit employee_unit_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_employee_id_foreign;
       public       postgres    false    2502    220    285            o
           2606    66558 +   employee_unit employee_unit_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_unit
    ADD CONSTRAINT employee_unit_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.employee_unit DROP CONSTRAINT employee_unit_unit_id_foreign;
       public       postgres    false    285    242    2524            3
           2606    65337 5   extracurricular extracurricular_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_step_study_id_foreign;
       public       postgres    false    204    236    2518            4
           2606    65342 2   extracurricular extracurricular_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.extracurricular
    ADD CONSTRAINT extracurricular_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.extracurricular DROP CONSTRAINT extracurricular_student_id_foreign;
       public       postgres    false    204    238    2520            5
           2606    65347 3   friendly_value friendly_value_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_step_study_id_foreign;
       public       postgres    false    206    236    2518            6
           2606    65352 0   friendly_value friendly_value_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.friendly_value
    ADD CONSTRAINT friendly_value_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.friendly_value DROP CONSTRAINT friendly_value_student_id_foreign;
       public       postgres    false    206    238    2520            s
           2606    74899 +   input_analysis input_analysis_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_kd_id_foreign;
       public       postgres    false    289    224    2506            t
           2606    140452 3   input_analysis input_analysis_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_step_study_id_foreign;
       public       postgres    false    289    2518    236            u
           2606    74904 0   input_analysis input_analysis_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis
    ADD CONSTRAINT input_analysis_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.input_analysis DROP CONSTRAINT input_analysis_student_id_foreign;
       public       postgres    false    2520    238    289            z
           2606    83005 5   input_analysis_tema input_analysis_tema_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_kd_id_foreign;
       public       postgres    false    224    2506    297            {
           2606    91144 D   input_analysis_tema input_analysis_tema_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_structure_tematic_id_foreign;
       public       postgres    false    2556    297    268            |
           2606    83010 :   input_analysis_tema input_analysis_tema_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.input_analysis_tema
    ADD CONSTRAINT input_analysis_tema_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.input_analysis_tema DROP CONSTRAINT input_analysis_tema_student_id_foreign;
       public       postgres    false    238    2520    297            x
           2606    82976 @   list_question_per_kd list_question_per_kd_quiz_per_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.list_question_per_kd
    ADD CONSTRAINT list_question_per_kd_quiz_per_kd_id_foreign FOREIGN KEY (quiz_per_kd_id) REFERENCES public.quiz_per_kd(quiz_per_kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.list_question_per_kd DROP CONSTRAINT list_question_per_kd_quiz_per_kd_id_foreign;
       public       postgres    false    2578    293    291            y
           2606    92049 Q   list_question_per_tema list_question_per_tema_structure_tematic_detail_id_foreign    FK CONSTRAINT       ALTER TABLE ONLY public.list_question_per_tema
    ADD CONSTRAINT list_question_per_tema_structure_tematic_detail_id_foreign FOREIGN KEY (structure_tematic_detail_id) REFERENCES public.structure_tematic_detail(structure_tematic_detail_id) ON UPDATE CASCADE ON DELETE CASCADE;
 {   ALTER TABLE ONLY public.list_question_per_tema DROP CONSTRAINT list_question_per_tema_structure_tematic_detail_id_foreign;
       public       postgres    false    295    2558    269            7
           2606    65357 +   m_class_grade m_class_grade_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_grade
    ADD CONSTRAINT m_class_grade_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_class_grade DROP CONSTRAINT m_class_grade_unit_id_foreign;
       public       postgres    false    210    242    2524            8
           2606    65362 *   m_class_room m_class_room_floor_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_floor_id_foreign FOREIGN KEY (floor_id) REFERENCES public.m_floor(floor_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_floor_id_foreign;
       public       postgres    false    212    222    2504            9
           2606    65367 )   m_class_room m_class_room_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_class_room
    ADD CONSTRAINT m_class_room_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.m_class_room DROP CONSTRAINT m_class_room_unit_id_foreign;
       public       postgres    false    212    242    2524            :
           2606    65382 )   m_employee m_employee_position_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_position_id_foreign FOREIGN KEY (position_id) REFERENCES public.m_position(position_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_position_id_foreign;
       public       postgres    false    220    234    2516            ;
           2606    65387 %   m_employee m_employee_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_employee
    ADD CONSTRAINT m_employee_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.m_employee DROP CONSTRAINT m_employee_user_id_foreign;
       public       postgres    false    220    278    2566            <
           2606    65392 #   m_floor m_floor_building_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_floor
    ADD CONSTRAINT m_floor_building_id_foreign FOREIGN KEY (building_id) REFERENCES public.m_building(building_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_floor DROP CONSTRAINT m_floor_building_id_foreign;
       public       postgres    false    222    2490    208            =
           2606    65397    m_kd m_kd_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_course_id_foreign;
       public       postgres    false    2496    224    214            ?
           2606    65402 %   m_kd_detail m_kd_detail_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_kd_id_foreign;
       public       postgres    false    2506    224    225            @
           2606    65407 -   m_kd_detail m_kd_detail_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd_detail
    ADD CONSTRAINT m_kd_detail_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.m_kd_detail DROP CONSTRAINT m_kd_detail_step_study_id_foreign;
       public       postgres    false    236    2518    225            >
           2606    65412    m_kd m_kd_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kd
    ADD CONSTRAINT m_kd_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.m_kd DROP CONSTRAINT m_kd_unit_year_id_foreign;
       public       postgres    false    2526    244    224            A
           2606    65417    m_kkm m_kkm_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_course_id_foreign;
       public       postgres    false    2496    228    214            B
           2606    65422 !   m_kkm m_kkm_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_kkm
    ADD CONSTRAINT m_kkm_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_kkm DROP CONSTRAINT m_kkm_step_study_id_foreign;
       public       postgres    false    228    2518    236            C
           2606    65427 $   m_parent m_parent_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_student_id_foreign;
       public       postgres    false    232    2520    238            D
           2606    65432 !   m_parent m_parent_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_parent
    ADD CONSTRAINT m_parent_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.m_parent DROP CONSTRAINT m_parent_user_id_foreign;
       public       postgres    false    2566    278    232            E
           2606    65437 +   m_position m_position_department_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_position
    ADD CONSTRAINT m_position_department_id_foreign FOREIGN KEY (department_id) REFERENCES public.m_department(department_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_position DROP CONSTRAINT m_position_department_id_foreign;
       public       postgres    false    234    2498    216            F
           2606    65442 .   m_step_study m_step_study_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_step_study
    ADD CONSTRAINT m_step_study_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.m_step_study DROP CONSTRAINT m_step_study_unit_year_id_foreign;
       public       postgres    false    236    2526    244            G
           2606    65447 *   m_student m_student_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_class_grade_id_foreign;
       public       postgres    false    238    210    2492            H
           2606    65452 #   m_student m_student_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_unit_id_foreign;
       public       postgres    false    238    242    2524            I
           2606    65457 #   m_student m_student_user_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_student
    ADD CONSTRAINT m_student_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.m_student DROP CONSTRAINT m_student_user_id_foreign;
       public       postgres    false    2566    238    278            J
           2606    65462 2   m_study_group m_study_group_class_grade_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_class_grade_id_foreign FOREIGN KEY (class_grade_id) REFERENCES public.m_class_grade(class_grade_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_class_grade_id_foreign;
       public       postgres    false    240    2492    210            K
           2606    65467 1   m_study_group m_study_group_class_room_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_class_room_id_foreign FOREIGN KEY (class_room_id) REFERENCES public.m_class_room(class_room_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_class_room_id_foreign;
       public       postgres    false    2494    212    240            L
           2606    65472 +   m_study_group m_study_group_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_study_group
    ADD CONSTRAINT m_study_group_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.m_study_group DROP CONSTRAINT m_study_group_unit_id_foreign;
       public       postgres    false    240    2524    242            M
           2606    65477 (   m_unit m_unit_education_level_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_unit
    ADD CONSTRAINT m_unit_education_level_id_foreign FOREIGN KEY (education_level_id) REFERENCES public.m_education_level(education_level_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.m_unit DROP CONSTRAINT m_unit_education_level_id_foreign;
       public       postgres    false    242    2500    218            N
           2606    65482 '   m_unit_year m_unit_year_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.m_unit_year
    ADD CONSTRAINT m_unit_year_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.m_unit_year DROP CONSTRAINT m_unit_year_unit_id_foreign;
       public       postgres    false    244    2524    242            O
           2606    65487 A   model_has_permissions model_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.model_has_permissions DROP CONSTRAINT model_has_permissions_permission_id_foreign;
       public       postgres    false    259    2546    250            P
           2606    65492 /   model_has_roles model_has_roles_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.model_has_roles DROP CONSTRAINT model_has_roles_role_id_foreign;
       public       postgres    false    2554    251    266            Q
           2606    65497 )   observasi observasi_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_step_study_id_foreign;
       public       postgres    false    252    2518    236            R
           2606    65502 &   observasi observasi_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.observasi
    ADD CONSTRAINT observasi_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.observasi DROP CONSTRAINT observasi_student_id_foreign;
       public       postgres    false    252    238    2520            S
           2606    123993 #   parlookup parlookup_unit_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.parlookup
    ADD CONSTRAINT parlookup_unit_id_foreign FOREIGN KEY (unit_id) REFERENCES public.m_unit(unit_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.parlookup DROP CONSTRAINT parlookup_unit_id_foreign;
       public       postgres    false    254    242    2524            T
           2606    65507    pd pd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_step_study_id_foreign;
       public       postgres    false    257    236    2518            U
           2606    65512    pd pd_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.pd
    ADD CONSTRAINT pd_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.pd DROP CONSTRAINT pd_student_id_foreign;
       public       postgres    false    238    2520    257            V
           2606    65517 '   permissions permissions_menu_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_menu_id_foreign FOREIGN KEY (menu_id) REFERENCES public.menu(menu_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_menu_id_foreign;
       public       postgres    false    246    259    2528            X
           2606    115720 -   personality personality_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_step_study_id_foreign;
       public       postgres    false    2518    261    236            W
           2606    65522 *   personality personality_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.personality
    ADD CONSTRAINT personality_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.personality DROP CONSTRAINT personality_student_id_foreign;
       public       postgres    false    238    261    2520            Y
           2606    65527 7   physical_student physical_student_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_step_study_id_foreign;
       public       postgres    false    2518    236    263            Z
           2606    65532 4   physical_student physical_student_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.physical_student
    ADD CONSTRAINT physical_student_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.physical_student DROP CONSTRAINT physical_student_student_id_foreign;
       public       postgres    false    238    263    2520            
           2606    123988 +   prestation prestation_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_step_study_id_foreign;
       public       postgres    false    303    236    2518            �
           2606    123983 (   prestation prestation_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.prestation
    ADD CONSTRAINT prestation_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.prestation DROP CONSTRAINT prestation_student_id_foreign;
       public       postgres    false    303    238    2520            v
           2606    82963 %   quiz_per_kd quiz_per_kd_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_kd_id_foreign;
       public       postgres    false    2506    224    291            w
           2606    107528 -   quiz_per_kd quiz_per_kd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.quiz_per_kd
    ADD CONSTRAINT quiz_per_kd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.quiz_per_kd DROP CONSTRAINT quiz_per_kd_step_study_id_foreign;
       public       postgres    false    291    236    2518            �
           2606    140414    raport raport_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_course_id_foreign;
       public       postgres    false    2496    309    214            �
           2606    140424 #   raport raport_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_step_study_id_foreign;
       public       postgres    false    309    236    2518            �
           2606    140419     raport raport_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.raport
    ADD CONSTRAINT raport_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.raport DROP CONSTRAINT raport_student_id_foreign;
       public       postgres    false    309    2520    238            [
           2606    65537 ?   role_has_permissions role_has_permissions_permission_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_permission_id_foreign;
       public       postgres    false    259    2546    265            \
           2606    65542 9   role_has_permissions role_has_permissions_role_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.role_has_permissions DROP CONSTRAINT role_has_permissions_role_id_foreign;
       public       postgres    false    2554    265    266            }
           2606    123948 ;   setting_daily_exercise setting_daily_exercise_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_kd_id_foreign;
       public       postgres    false    299    224    2506            ~
           2606    123953 C   setting_daily_exercise setting_daily_exercise_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.setting_daily_exercise
    ADD CONSTRAINT setting_daily_exercise_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 m   ALTER TABLE ONLY public.setting_daily_exercise DROP CONSTRAINT setting_daily_exercise_step_study_id_foreign;
       public       postgres    false    299    236    2518            `
           2606    74912 ?   structure_tematic_detail structure_tematic_detail_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_kd_id_foreign;
       public       postgres    false    2506    224    269            _
           2606    65552 N   structure_tematic_detail structure_tematic_detail_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic_detail
    ADD CONSTRAINT structure_tematic_detail_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 x   ALTER TABLE ONLY public.structure_tematic_detail DROP CONSTRAINT structure_tematic_detail_structure_tematic_id_foreign;
       public       postgres    false    269    2556    268            ]
           2606    65557 9   structure_tematic structure_tematic_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_step_study_id_foreign;
       public       postgres    false    268    236    2518            ^
           2606    65562 :   structure_tematic structure_tematic_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.structure_tematic
    ADD CONSTRAINT structure_tematic_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.structure_tematic DROP CONSTRAINT structure_tematic_study_group_id_foreign;
       public       postgres    false    240    268    2522            a
           2606    65567 :   study_group_setting study_group_setting_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_student_id_foreign;
       public       postgres    false    272    2520    238            b
           2606    65572 >   study_group_setting study_group_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_study_group_id_foreign;
       public       postgres    false    240    2522    272            c
           2606    65577 <   study_group_setting study_group_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.study_group_setting
    ADD CONSTRAINT study_group_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.study_group_setting DROP CONSTRAINT study_group_setting_unit_year_id_foreign;
       public       postgres    false    272    244    2526            �
           2606    148595 #   summary_kd summary_kd_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_kd_id_foreign;
       public       postgres    false    2506    224    311            �
           2606    148605 +   summary_kd summary_kd_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_step_study_id_foreign;
       public       postgres    false    2518    311    236            �
           2606    148600 (   summary_kd summary_kd_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_kd
    ADD CONSTRAINT summary_kd_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.summary_kd DROP CONSTRAINT summary_kd_student_id_foreign;
       public       postgres    false    238    2520    311            �
           2606    132193 )   summary_skill summary_skill_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_kd_id_foreign;
       public       postgres    false    224    307    2506            �
           2606    132203 1   summary_skill summary_skill_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_step_study_id_foreign;
       public       postgres    false    236    307    2518            �
           2606    132198 .   summary_skill summary_skill_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_skill
    ADD CONSTRAINT summary_skill_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.summary_skill DROP CONSTRAINT summary_skill_student_id_foreign;
       public       postgres    false    307    2520    238            �
           2606    124006 -   summary_tematic summary_tematic_kd_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_kd_id_foreign FOREIGN KEY (kd_id) REFERENCES public.m_kd(kd_id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_kd_id_foreign;
       public       postgres    false    305    224    2506            �
           2606    132208 5   summary_tematic summary_tematic_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_step_study_id_foreign;
       public       postgres    false    305    236    2518            �
           2606    124016 <   summary_tematic summary_tematic_structure_tematic_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_structure_tematic_id_foreign FOREIGN KEY (structure_tematic_id) REFERENCES public.structure_tematic(structure_tematic_id) ON UPDATE CASCADE ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_structure_tematic_id_foreign;
       public       postgres    false    305    268    2556            �
           2606    124011 2   summary_tematic summary_tematic_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.summary_tematic
    ADD CONSTRAINT summary_tematic_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.summary_tematic DROP CONSTRAINT summary_tematic_student_id_foreign;
       public       postgres    false    305    238    2520            l
           2606    66543 %   tahfizh tahfizh_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_step_study_id_foreign;
       public       postgres    false    236    283    2518            m
           2606    66538 "   tahfizh tahfizh_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahfizh
    ADD CONSTRAINT tahfizh_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.tahfizh DROP CONSTRAINT tahfizh_student_id_foreign;
       public       postgres    false    238    2520    283            j
           2606    66525 #   tahsin tahsin_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_step_study_id_foreign;
       public       postgres    false    2518    281    236            k
           2606    66520     tahsin tahsin_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.tahsin
    ADD CONSTRAINT tahsin_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.tahsin DROP CONSTRAINT tahsin_student_id_foreign;
       public       postgres    false    281    238    2520            d
           2606    65582 /   teacher_note teacher_note_step_study_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_step_study_id_foreign FOREIGN KEY (step_study_id) REFERENCES public.m_step_study(step_study_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_step_study_id_foreign;
       public       postgres    false    274    236    2518            e
           2606    65587 ,   teacher_note teacher_note_student_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_note
    ADD CONSTRAINT teacher_note_student_id_foreign FOREIGN KEY (student_id) REFERENCES public.m_student(student_id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.teacher_note DROP CONSTRAINT teacher_note_student_id_foreign;
       public       postgres    false    274    238    2520            f
           2606    65592 1   teacher_setting teacher_setting_course_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_course_id_foreign FOREIGN KEY (course_id) REFERENCES public.m_course(course_id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_course_id_foreign;
       public       postgres    false    276    214    2496            g
           2606    65597 3   teacher_setting teacher_setting_employee_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_employee_id_foreign FOREIGN KEY (employee_id) REFERENCES public.m_employee(employee_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_employee_id_foreign;
       public       postgres    false    276    220    2502            h
           2606    65602 6   teacher_setting teacher_setting_study_group_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_study_group_id_foreign FOREIGN KEY (study_group_id) REFERENCES public.m_study_group(study_group_id) ON UPDATE CASCADE ON DELETE CASCADE;
 `   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_study_group_id_foreign;
       public       postgres    false    276    240    2522            i
           2606    65607 4   teacher_setting teacher_setting_unit_year_id_foreign    FK CONSTRAINT     �   ALTER TABLE ONLY public.teacher_setting
    ADD CONSTRAINT teacher_setting_unit_year_id_foreign FOREIGN KEY (unit_year_id) REFERENCES public.m_unit_year(unit_year_id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.teacher_setting DROP CONSTRAINT teacher_setting_unit_year_id_foreign;
       public       postgres    false    276    2526    244               z   x��л�0�ڙ�@�9�����6�ρ	�;R�D�tʩ]$T�֓���e��f��=��I*ţi��p�4,��7� �ѝ�V�4G�J"q��La�ߙ����P����{��:��nJ�ni      	   -   x�3�44�4C##]#]Css+S+�?8����� �|�         C   x�34�4"�? ad`d�k`�kh�``aehhel��#C.CNBUnd�`hjejieb��<F��� �E?         7  x���K�SG��Y ���EDY (1J����D��I�_%⇢��x�uD,9��-�[�?~�������������x��B
_B������5�۷���?Œ�C��
}p�ޚq�������a<��3��8;C	��%����C8:C~���������xx��$�Nq��J��O�����|v����)���qt��cyt��Oqt��G����p4k{G��v�fO�������l�I������t��$�N�����I�����v��$�N�o�p;�xG����z0�#D��<B2�#d��<B1�#T��<B3�#t��<�0�#L���vay�h��Hvay�l��(vay�j��hvay�n��vay�i����.,����.,�����.,Q����.,�����.,1���D�.,����.,�����.,QUae*4UXX誰�0Taaa�¢���b)�Uaa!���BV����
U&�,,LtYX���01eaQ�1�b%0eaa"���D����"U&�,,LtYX���01eaQ"YX����0�daa"���D����*M&�,,LYX����(Q�,,LDUX�
I�b!�[B,uK���n	���-!��%��P��X�ꖐ
5�[B,DyK��$o	1��-!&��%�D����h�]�bb�[BLLyKH��-!&��%�D������E�b��[BL4yK��.o	11�-!&��%�D�Q�b"�[BLdyK��"o	1Q�-!&��%�DV����=c��f�Z�_π��*�ma�Wa��UX�Bz־�_��/�Wa��UX�B{־�Wa�c�>1Wam���xv��mP:<EZ��O�UX�DY��O�UX�D[��O�UX��X��O�UX�Da�>Wa�i�>�Wa�e�>QWa�m�>�Wa�c�>1Wam��Ng���Lg���Ùζ�Ŭ
�3�XTaa����BS����
C�*,*��
Q�*,,dYX�(��0�~�}�x?�OtYX���01eaQ"YX����0�daa"���D����*M&�,,���!S%J����(I&�O���'���*M&�,,LYX�����{ƏB���Uaa!���BV����
U�*,,tUXX���0eaQ�YX�x?�O��t�'�,,LYX����0�daa����Đ���)�=���D����$Y&�,,LTYX�h��0�eaab�����I�mb��t�'�,,L$YX�Ȳ�0Qdaa��²������YXa����YXa��<B4�#$��<B6�#��<B��C4��<��I�}����>1���D�.,����.,�����.,Q����.,�����.,1��r1؅�!�]X"م�!�]X�؅�!�O���'���n��vay�i��H�.,�|�}O����1��q~��,�����ё���ё�|��Hx>t$\���?�G�u%tD\WB'D��ȏ���눸ޤכ�#��@�#G�5�G�5�G��M�#b��JP(A�,,$5XX�j��P�`a����D����.C&�,J� Q&�,Ld9X�(r�0Q�`a����DW���0�`aa���Bj���`a!���D����"U&�,Lt9X�r�01�`Q�9X��r�0��`a"���D������P����BW����S^�g��`a"���D����"U&�,Lt9X�r�01�`Qb9X��r�0��`a"���w���Y^��/��`��5X�B־0�`�s�.1^WBGD\��O�5X�D^��O�5X�D]��O�5X�D_��O�5X��\��Mİk��j�����,,d5XX(j��P�`a����D����!S%R����(I&�,L9X��r�0��`a����Đ������9���BT����Y�,LT9X�hr�0��`ab���Ĕ�E��`a"���D����,E&�,L49X��j����Q�,,L5XT�A�,,$9X��r�0Q�`a����D����.C�M��Ĕ�E��`a"���D����,E#����ӧ��      b   �  x���Mn$!@�5u�\�#l~}�(�����0��2�ғzٟ(��F�Ԓ�4s��Y�+�K�̷�[z������G]SǦ$æ��MK�5M�h�#�y�5P���+Fk |l������y�5>�Q��?1���D�H�O�M�.32�֍�h�(��MaѺ�0ZGF��h��р�:�0ڍ��q��u�0ZGF��h5���ud(���(�c&�v��3��A��,ڃJ�]Q����G{G=���,���F��8�+ڛ�;�8�;�8�;*q�wT�h洞��gt�F{7F{7#��nf����A[�H`��F��hU���u�a����y���ȇ�;�w������WIE���RZ����w��:n:{on��77c�ci�w=�:̴�?���,@�g{�
�瘊�9��g��;�:|��>�Q�=�v�tv������h���ф��F%��ߑ��ߑ��_����y��̂      `   /   x�3�4����CC\&@qK,⦜FX�̀��H�5`������ k��         �   x����
�0���S�,�3�V�ҥg�������߳�7�!C���]B.��@ݴ����t�տl�~��A}�q��>u��kG�����4>�6�V�q�_.�H5ZQ�Ckj��D5O�SM4���&*x���x��F<�D�]	�(<,a��%l��Mޖpcw��L�oˆ��۲!p<����gQU~� �ڟ�s_!D�         �   x���;
�PD�y�p��y/1)� �4-�u���+��pOs8>��1���c�������q���֙w1,���o�_	C/ЎA�'�N�]�&�T�N�!���N�U��](.�]H.�]h.�]�.�]�.+_�!��G�-�R��*>      d   �  x���=�[A�X:�/���G��	6Y�d�����������
�������V�6n�_��o�_?_ժ�X}��͇����翟rok�CNE�C.E�C�"�!�"�!�)t��(�OZ�O�x�f'�
=���v^RN��<�"ܒ�yKE8&��pMn�5U���k��5���
�䶯���,v� ���W@�]!�!�!�!�!P��莀�i��������������.h�o�?�1ݟ�C���A�f�#8[�Ip�b��p�6��}���'v
/lv���,(����W�n�08ܱcpx@��섞��M��]���e�a��p���ኝ��[�;�l��=8��}pرpxc��4� .�B8\��p�]!�ۯ��}n@s\!"�y��d�"��	�/��p��p��p��p������������G�HxG�(�-BD��7�oO������$�� JȂ�(!+��l8�2����!��;�{�@s�h�,�f�w4����!��;�{�@s�h�]8��q%��A��e1D	Yp%d�͍C��p4���!��6�ˆ@s��i�UC��i4��!�\3:���	�F.x�0�����B�\0���@s�hn��B��[4W��f!�\,�{O{�ͭB��T�����~�t�x      l     x���KJ�A�����p���?G`GHG������zp�i�7
��@e����o�n����/�?��/&&�b�&O��\.���ǧʽ�Y�CVFڐ��>dgdR��yReh��Z'u��IC琔Y��%)3%�SRfK>��̘|�I�5����&�k2fM>�d̚��@�}��|}��|�-�=��2I 5�v�~��@���# �G  ڎ@ ���>�r�z�v�~��@�
�Წ@��@��@��@��Au���AP߁ hځ hށ hف h݁ hہ h߁�i���Am����T]���d�|{���>�_�_�X����  ��
q
��u��P��"u��P��.�t��4��b7�� �S�� �����{�O"�[�����0b�K����xAm�>"b��x�Е�y�F�2p'q�AR����}j���L��֩��̔ۙ���&
�5R�5R�5R�5R�=RN�=RJ��rZ�H9m{���=RB������ �¤      p      x������ � �      h   i   x��α� C��L���"6�Cd��#q�(���W|1%TB������C\o�Ͽ$f����R�ʀ���"����5p�č�,2���1�;�č�+�ϔ��cB�      j   r   x�����0��3L�R�`��	���z���Rd��~�iM�y4�n�i�"˟r��Өh)>aQ�+1�P�oy`^�c����r�/c�F���\��a������>��M�Ki            x������ � �         v   x�m�;� �N�4첋JG���Xh����'۰�L2ͼb��)Ǜ�����l˞�������0:?$��,�/�E�ز�+�bC�2U��%�����XYV��r˪�Q�(6���[zk���I�         Z   x�}˻�0E�ڞ����:~-d�9�	Ʌ��]��ԯ/�
Z��A�婔��:����=D�G��"U�&Ck�r����|5�5i         m   x�34����uqbOoGN�o��!����������������$�QRfbq"�����������������������LM�L��LM����� ��"�            x������ � �            x������ � �         �   x����N�0 ��y�!���;�	v1,L�+Bk��I��S�� Ɋ��v�$u��8�� �w���C$���y�CO�c��-<��y� ���WLї�8�u���-��,���#�֖��%���B��+K���\{i�T��\ו�+[�Z\0��a��U�����4��@dA�Q_v;ݫ}}�ZvfIq<�N��/��b�;�0�5by})�7:�ퟚ(�>�6WƘ�I      !      x������ � �      #   �   x�}��n�0�s�y*�I��[&e-�Tʭ��m�@h+�O��IT)��r>�j�s�H)1��ձ@@� Z`.�2el쬦��pl�gN�a�?.�)AsS/�)W��.f����,���lb��Λ[�FV�m��E 	�Y�0���x���|��|�kW�BJ0K6�Ȏ��!����x�r�iS�q�K.9���?q���{]=�2�O�ui�$W��jI      $   l   x�]ϱ�0D�U��aAX��
�'���_��	f�LM���;��}��d��@4��%�"M�)ѩ�%[%��t�rH��V�Fﻼ%�ȋ:��g)��)/�      '   N   x�]���0�*h�h�l�W����LB�`��f��[��L��:<r�/��ENt�qK�����!��f�4���S      )   k   x�3�v����4��J�U(H�I�J,J��40�26�20�4��2b�@Ȑ����R��P��L������*F\FP��&fg�%f$� 2��xL��21B11F��� I%�      +      x������ � �      -      x������ � �      /   K   x�3�4�,N�M-.I-R0���420��50�50�0�t�9�K2�R9ab��Ff
V&&V� ]0����� c��      1   �  x���kv�8��W�@Z/K��X��F�a����1W��3����,}�UuK*a�J��s��3ĸ�f�7㏆$4c��ty�99���I8�ٚ�k�%��T�=����\��;4�wo�2J��T��y#B�sS͉lL��W�d��2��I�{[��\]�"�=H�އń�X[F3A��b� 4�9W���/_X"gBj�=~��n��n��\�7�M=��az��7�׌��"��E�_B��K�>�?��×U�8�ڍ����G����������wP�tBy��9����[|�I@ ���R�2�
)�HW0&��/�+�J�����m�a��{����T��T���o6�ݚ�4u�xC�&|��&"��Քg�5���\HqrdSꎬ	�6�%��F�3��4�S�B�L�W�$SB��)Z� v��.�)���uW�_��*�A��7r��4ub�p�m%_My�לr�����Gb�t�4ф?�sE6�,oU�ԣ�H�r�
*"Lθ�2��+�)���";�z�[� �f�L�Bq�m�۷��ɍD�ۅg�v}	y�jd�0��z=���P��;�����95dc[�� �b�L�2�(H�p�L�)H� ��u+�^0�RJ%Ӆ����Rxw<���֓�9�������;�ڡ4���HsꠛfD�-΄�ڹ{��i�݌	B�#%Ơ-�!`� ��|5��Q��BI9���{r�=�ۺCRK�>>����]��}aV�nB�*.�"m#�����s��'�k�Yf�y4����ݻ(6Ŧ����%��,�j���e�.P����2Mu�Xs�>h�"(�� �H���RL(w�{[!?� eS���s��F���Y�\�Cӷ��E�%���ZE�#c��X�y�����;�]<]�S6*�g���"]<��Fh��!!�K���ۮ�ۼ��3�㣹��ݛ�:dS����8O�'��ʖ��ؾ���#H̹o�L�[�z2�_;�S�ͩ0�ye�@�k�R�\i���QYW��$�v����
�m�=�'W$���|i���z��H���*)j��m x��9��g��1!�#N����zT��%�@�)SJ�i1T�\pMj��:�)���z|g����6��~����og`�j������:[s:6+��} �KE�oD��o�Ne��t]��Fɩ����5f��~�R(I�k3<Xl����LM�l0��~�� �ܡԦ߅�{��?[[��,9_~F�BGn����l���X���ajW�J7vL���&q���5�.�Rf&Q�S5֌r���)b�f� +�S�-�����Fk��0Z�vq��s{҄P�`i�&怴|����_� =5%�(�F�f�Y�"���R����i$�Xf�Щ|٠�7)�.�:��`��?�:D�D��R�'��ś�6�*���\t>B����э|��	�2rK�o��p4�*EM����0�#�������z!�l�
|���mEZ�"U�M���o��s��RU�*�z���
�Ss�5Hfl̄"'{��Ѕ 8^信�c:�����
��IB
������f�Ø�j��5�͐`g�GE	^��'V��-���X=�kHoH����n#��f��;�9���2-��{��E������]��q�Oz�J9�T�֣F~�/��ζ�W��.���`�Ӵ�s��#�s�rG֬�觑.xF������P����,�< ܹ�F���-�e���9�ؐm��=,���)�s�*��F��/{A�1 �PZ�G�EH��l�}�g>��oJu��M�8�F�;��n��.|�xj��1�˰u�	�r�~��OG62��X�1��&61HA�h ��0ۡ���2nb˻�X���Z�s��T�P@D>62,�*[:���<���CӅ:Es0�$����w�m�������?&47-      3   P   x�3�4�4�?N� GW3WΒ�bC#cCC��������������������%T�H��R��������b@�W� ���      5   �   x�m��
�@F�w�b^�eg˟ݫ�$T�H��fK��4Ѽ���,��������)��n�C
;�����`��ݚ�;�A���{h�M=t��m�#��McU����C��a���L��!��h	��l����P1�<��'?��)R
9�va�%p�p�P��F)}'�;      7   V   x�3�4�LL.�,K�420��7202�4�1~ ��Q�����X��� R��� V�quu��̭LM����B������ ��
      9      x��Xَ�6}&�B@���&jys;�����E� c3Ų��RR��{Iʲy�t�<��2ݫ^E����Cޢ��FhvG���9e9g!S���eo��)�eDi���t��<�`8E�;�o���������+�$�<�7"')N�si�){���A�k��"�E�>�4Ô�G]���>7
��\�!S��5��G:�N�0Lc���SiL�8�ׯQ���S����>Ç��~�4A���2����>�>(B��	a���K�Y�C���AWʄ�IF����%��4C/e����+����ܩ�Fp˖-�Y�0#�ݠ@�z��5�)L��<a�ѹ�O��Eu�fk%ӈ��,�e�LB̜>6N�_<�%zϠh3�k�R�F$�a���9��׵)���1H]��rf��������v< �d��5&r�`���:��n2�-�Ya�ʆ�\SA�J�	z���E/��y���=`���K(�q�0wսj�f�!�Zy�0��!���T�b
����E�웡3�G�<�́�ϸ�.h��V�W���8!s1#�[U�:e��ki��� C��0��g�=���/��7c2���y2��V����lʽ��KŇ{���#�a������'j|2A�Y��0�F�7�887���N퇮+�C��9��� #�_ N�Uyٚ��[`��ͅxY����{�������:_U5�0q�h�W�-�}ٕ�3p����&��a��Â�:�
�ҏq=���o(M�a!FηV�J�)�ڽ�A-���bX�k�O��בν���$�ð�#߃n��:����MSC���0c�-f�"A�T�t���4�8�bX��QU�����w(�Co�X�#ԍQ�<҇��R��ݔ&���YZm��5��,؅H ;)aX&A�]�]����HC�[/z��*Z`�nm9Nb#S
�,�B,/��Ӧӷu�n��x՞dw$u�9%!Ǘ̘ty��ؖJ>���X"�X��K�Y����1������Z��x�y��2\c��09g���A��������`��:�p��+gp�%P+?�]�]�B�0�\�v.}
��a��{`��$&k�]�p3��/\�+�$�i�16fp���j�[�)&���%����%��h�pBЛU��Q�nnr͔EP
�G�����}�Q��F���/M�h�]	Hc)BA0%�	Vy$�BkGì�CN(�k�u�8���RQA�@'�y�	C׆s*Ɩ���us��	G�.�8�G�d\46N�ƈ蹅����f�P
pY��b/W<�lL9��� Ylu
a8��+����Z6��CAhN�{�a�͛�ʹ��"���~!��nR0����B���}i4���E�5+���L��Vu���G��0ǲ���v@#�����cu�,F�V���N��+SAV�:�#�>�����ݚsqLG��A�J�%�-�[�p:��2}&����E�I����=<<���xZ�tw�dPw�a������Ʋ      ;   U  x�u�i��8F�����.j���X�<Z2qN?U��EI�F/��H�NZ\�O��u��ö�y	k�1Ƌ`P���ݲ�7�}���"�$� l�s��=�~�v�0=��Ǳ��Y�yQm���@gD�FJ)Z4�bW�`
�P"���e�O���C,
[��+��\G4<|���R�F�A�Y1�eA����:��BW�ڃ�jy�3-y �F�'$�i��;��a�9 �%c_��i{`!�]�_�q��߻q��[ZU� (tf�ŭ��*FB�8ќ��<N�m?�P���
�M�����0N�IM�ѕ�p���ДR�G.��6����V���KtE���[TB�~�eu	��x�n_��%�Ѫ&�)+��@#�J��v,�������1�q*{�����c=q��u6������I�ee�sZ���7'��*����W��l�c�K4�����#�{���J<1:�w�X�v_ۣ�����:5%%�h6֏*����׽d���&��>�E-�:R�����\cw���o�/q	�!�koG]�}Xꬓ�XS��a� w�g��òP�;��r�g�����'0E�S	��Q6 ��0�
dU��:o�u���;΅ke�kdRi�������E�����r�S$�;fB$k(lV�Ѝ�\�|�4�D�hM����}�[�����¹��Rm��>�H�P��G,�m8'�Ӆ@Հ8��
�<=���dO\Ӛ:��$a��z��anę�IS s(�u��<�m�ǧ�E�7���}B����2T�+8���s{���)߀�q2���<�G��H����X�ܟ��1����ӈ�m�(��e�]	���ţ�<_������R]xn��;w����\$�GD���q��{н��ҭ�(����\4'�Aʹ)`ZN�*I�~E%�;�x��a�g!f`���r���ǿ���m;fDy�/�Q���aY�F��♁����X��-�a/�3S��J\q�T��xnk����ܻ���,�ԛ�#k���`ƝX���m����Kf�7��%C�ݜ�6rضuKO�U����t�1)��8�_��������"�h�Z+�>;)N��&1h��x[H�lp�96��|�Z�ZE՞�������(�&��V�3�2Z3kj\�-U�?Fx�E���l����@!4̺b����]��tˬ?�v�k'�1Wb�F+�3�Ǻ&~�2��׷��̉�*d<n�G��9�uX��Y���%RBN7I�MK��+�̩#�o@�\	,]�,��U̙�V�߳�9{b�:2���J<���\��u�Q�όX��I$t�-�*�%����{i�!���t.��H�+�t����%g
����:��%�e�K�d�F����_$0�ZFz&|Ns�6��JJ�M�S�����Y{��C*�]-)��y��w��_�T*R3� ��>
����s�W��">qy��0�p���s�_p�T[�y�u%�U�<�:f������ȫ�(�6b����A��{�B��Tx?��Oq�K0��n��M��~��W��*z��,��2�{��C��E�0�B��W9ݦ��((a���a�����RL^� �����1dZ^@�Ï�ӝƲ��b���Z�      =      x������ � �      >      x������ � �      ?   �  x��ֽJ�A��zrހ���ki��Z�|�`T�$����oXY��*漅�C�"*O���"���~�y\���Z���i���O���q�c����^lt~�J�M�ҹ��A4���B��1�$�c
Y���)qפ�s�yL�=�&���]T�\Ae>�%r7��r�u|=�]�l��b��j��f��\���QP�B"p!
	��\�B.D��ЀQ���(��/� \��.�����
DÅ$ÅdÅÅT�B�@�BODa�'��D<���BOD!�'�P�Q���O���_
<����0��voO��������O����D��D��D2x"
<�
��BOD��'�0����x"

��BOD!�'���Q(��(T�D��tu|Y}�y|�q7���a,��=IαG�qE�uC�uA�u?�u=�u;�u9�� 7���ƹV0�\G�\'��\g��Xߟm6�o��Q�      A   �  x�}��n�0��'O�d�&	w�����ZUm.+�IÂ1�����w�6J�`)�̄���1�����^I K�>m����[��6��Q��%�����ql�Rf�R_$��KێrԓwQ*�����^�Ep��s��8^���V�}�8^���R�w�{?�
���5���^e��8���6�q�ӗ����R?�O� ���a������]�A�͌�уK�B�YD�至-�S�M[),ew�*^���7�F��f��Q^ӎ�\{s�H ���/�C�� ��u�XDã`E�mz��e�*f���Z}���SL�|��`O)m,��|
3�ʷ�*���m�PMY�%]�2�}�h33��*��7�l������U�M-�^Si;3��x��U��Mkm�y+�w���ٕ�oЋF�D.���	5#4#��0�f�f��	�<�f��d�f�F3z�I�b�e֚�KL�Mk�<S�s�J)ܡ�O~��p?�q�hJ���N�fБ+Eh� l���F߉��-��gb�Ňll�.Y&�W*fNW��n�{̭ik�Ȯ��;&�80+��}>�t��qaԳ�tB�b_�5n��U�]8l��g=}��wS�谭Zy1�ucr0������TG2&JL�� L���Qu���Ř:E��~�#z{ک�1��7�o����?꒚zr\�=�����\�� �5�o+z#�j��"�\/?��b�bh      C      x������ � �      D   �   x��ԱJD1���ܧ�V23In��>��n��Ţ�\��oo� X�H5���N��������__�x���4���I:�|,�������b���ז )�"�p�X�gH�1���l�-09�l�����1���r_\���e�V�m�������}���34�.34��34�^ghX�<4,����a�xhX�������C���ay�а|�а�yhX�=4$��CC����,ߤ�&�      F   	  x����r�F��ɧ�(�9�Sbo�Ri�ɕڪ��-����X �Y��o0@���q�r�3�c�4=������lv7�ʦL��S��7���T�7B��[Y(���V� �8�9��ڷP�f���X��������D�B�EdӅQ��!�:럂�ڵ*����-RVãwO}W���?�CLЉp�Oaf]��&��;��
��S����.����×�����i*�L��,ض.o���^LF�/����#�ӟ%�O:+�m&� l�V� ��<��6xe�	�~w8��	>�
�9�&��t���6�iu�d�j��u��Vg(�ل��m~�Z�<e�[��:���]�R�N��c�P�M����N������F�>�������ыMح�*��P�V��OZ��?�o�i�?��E�
�&��v���<�I* �i"���@�h�����&�`�KE�L�<�IR�_0I!B>V�/�e���
��6�o]*y�3y�<Y�L"����(��n̒ʋ�0��m�f{����>����ȴ|�;__>�^ʴ[�E|�
�p���}���t(@���
e��^_��?�*�m���:[<$P1hh�b�РE�!����
�Ex��ԦhQe�.��A!��Q!�Q!�=�_χ�umπ�i�� �� ��0$/&D-F������gؓ���l�gLd[���P]
�B�B*�FM�aהGp^w{�!��bSP��`����F�%�J���Ť�.g�lJRM��\9.���"�\ɟ���ǥ-?fS
pn�"�����z�J���^�+�n�B��P�ҀS�809W���Cc���HM}�/ӛl.I�?*R�
�6��7�b7�7�#���+λj�z8��b�����!A35�'�M�/�����٤�9��e��ߪ�q��f �)�M�+Dd�X"���)6V���i�09jSP��c%&%��!s�X*g8�o9�O�g,�K]��)���zC��)*օH�ě���J\_��4ԯ&�7�$�0H�x� �k�j_V�oM�V�X�%M4��4T������ `޸T_�'#�<�]UW����b<{����ժ�z|�����L��7��?A��t�+�ӂ��i([m�y�I|��&A�s�H�w������B7�+���/6��>5��<�$��`zA�W����f�Qk�P�9�JFc��h4� ��Ū��u��|���BF6m���5㐆� +�D����o��np�����MCy�Ox��C��B`��0�xx-���}{�旲F�f�@����Sܤ�ϟ����2h]`Z�"�*��V�	�a��O8���z�w"���в�$uE�^�$؉*��'O�X�b�0y�(x{(��N�)�{�ȧ]{U��/�7�R���h@��6a��h��Py�A(�O2�gU�����~m���6�@�?�W*�q�;X�q�+]"���P��sֵ�r����~�ǎ� �\xӏ��o�/��'H2�QE�Bg����/GcM΀���Y�6̺��zi�<{�-D���
l�7u��L`�mj.V�vAK�?�9�@��@(�ظ�jm��������?缭�~�O|?k$���ٸ�K>�>`i��H�J+�$���� n\��Y\�� y\�Q r�|��y�|�B��{:����@���Y���~<�\H�L�BdR囪�bT	�ڬ �zCU
S��*�j�T�@:�p��<���r?BIo:	���ߙ��+C߶+aj7�t����9�����v2b�K���_�����"E���Fmb@��X����P�.�AQ�z�qI5n/��7>��B���o"�Z�MD^k��H+9	��2��l��m<�I�6V��p�2ĵ<9�K╅���C.�H
N_ˎ$��H^ˉ�t .�^��j���鐄��	I�kIp��6�N�?ԻS3�6�`蓦�������B���t̤��&������|����yn�vYT�,���4��)���
n�H�I] dsB,f���v���st�d\/A�`�5TksP��md�c�0b������tC��j�r�mN`��MZ>��M�op� v��hB}������\���>i@#�#H�aF-ͅ�ؑ3 �^�j�w`�˗#�%~�)TŢPi;�� ��� 3l��B3�Q�v��9�}���d&6�nG(@���*�.��
�x�Fh��������4T|�p��k�!9��aq��x|4�-lo�஑�z������0x^��W@��
K�a��3v����4js�]8���f�kY�����O������C�|�      H     x��ҿj�0����~���#ٲ7g�PI�,*Ӥx�ҷ�I-��B����t���-_ּ@���p�#�ié%9�����P#�C�	z/ 9i@����k�N|���E��;N��Z��l�#�l�+�lWg���kgN@��{qD qcm+81�A�:|�����x�h�ЀZ���dF���h@fJ9fK2fՕV̪/��U*u���l�BP36�!����d s�dnC0�/����6Db��2��2�����a��[Ӎ>�5M�	i��      J   J  x����J�`E���H��/��� ��D1()v��q.X�-�@���S͹=e)�����v�~Du�����COE*IVi$٤�d��$'�?j�YITE�&Q#Q�$�E�KY%OeU���5Q�X�E�k�$��V%���*��VN>���<_0�ǜy��=~�+�>�U���g���pB�XFπ��0!v4�΀�3`A�X96$΀�3���	�����-�:��]^���=_��s�(9�G���G�D��c�:ÈJ#�J��J�J��ڈQE%���R�آ�axQ)c�Q�`�Q�b�Q�a�Q��F��n7��ܱ���i�?��s�      r   ]   x�363�4�4�T�����|$V��������������������H���͌�$%��CI�4�5q�f�$��(���@��hg� �73      f   m   x�e�1
�0�9=�P�_kk�	\7���m*d���O���e'!0�f�h+	*P�/s;���Ss򉱜7,�Ӻ��J��V��Jn���d���Q��1�\��$;      x   �  x����R�0�k�y;�Җzw*b!� ��3�ݮ7��?���k�Ђ��t:���|Hȟ������p�Eԋ��/Ǘ�#�YB
i
9�}SK ��5{��#�ǟ�_�Ϗ���7�Lf�nDz9��7r��>R׬X��	�R5P�S�Ƨ74$tq�^��$�^� �i�M+/Z��Z�s ��	�{5�.�m�Chx��m[�l��l��q쀤�\���8��i�"���w�A>�}滃\]`�T���d�a�����)��ܜ��ȌIy -S�D����y}�FN�G��KC����!I�T��&W�
Kڐ��PK�
P���|�R�j��+�YC'���"0���H-���n��\�3.�H�TY*??ym�����,���u��Xr���#C�=b ƫL/]c�����Lm	��h2(�ZE��$�8�Z�І%N�����Ѡ��Z��G"m����LyѯN@���]�n"�����mX��`je;��֢g\V����@&�hm]�'b����Z�%!Q+�N�Kٕ�,��v19�4=�:�
j���9'jJ�AY���M�2Eϲ�� B=��^]M_R�a��N,�yq����kz��{n�U�b��-��d޶ J"�ؑѓP��颗;����zC;zg]1�ټ�G�#+�5�Xr��T�������.��R�v����4v�b�Gh�Lw܍�q.����b�ΰ����}ۻ�����#��A�}�r;r_�;25e���Ȇ�J��s.�3����R�$����J1��}��z��]���B�+Vt:8�\��-���?֝ze�!����[�{2�yO�9�o��VZ4ѝմ� �[=��h�3�yM�
о��Xi�Dgօi[Z��s+*�NjJV��,�`�ʊG�Ӛ~E�~�7XQ�<wNӯ(گ�:X������uQ�u]>���_�v���f���XS�      L      x������ � �      M   i   x�m�1�@�z�s�1󿮁)I��6FCg�lC�?���������XR�Z��7��)������FvAzL�I��ԣj[�yoǿ��F7�y��@��Ͻ      n   G   x�321�4��5�4�4202�50�52Q0��22�24���221+1§��$ �)`%�M1)����� `5�      O   E   x�34�q�uT0��?2�4202�50�50T02�25�26�ʁ��!D�N]FV�fV�(�b���� ���      P   r   x�u�1
�P�:9�P2��_7��6��`��^D��Ua����� ��RQ�EsT��c��p�(J]�'<YTn���g��^lx�V>X��܎��&U2�[������4rS0�
ܮ0�      S   �   x���;
�0D��)|�Z�?��	ܤ	��_fR��� P3����s�N�V���h}`��v#����zj?aI���~Ɩ����t>S�� �)�Z��Bعٝ�CX��[{BamOH"�퉮Q�X`aqO��0�#�G)�/�j      z     x�}�;j1��x�0F�WK��	6Ypbp�v��{ՠn0;?E_T]Tk����?ߏ�����/ґ�"�d,2��E&����F��l&�)f
�j����3`��BL�[ʂ1w�Y0g��3欖sƜ�rΘ��]�������/U�-D�vQ��ET��jx#�M/%�����ī�,{;�/(��Eּ�Ⱥ7�zY��+��%6����d��?.���4}@�QI>���GP�UbHA՘RP-�T�9�1��FL*��z�j�Y%1��rL+��
�Ƽ^���y�[��8      v     x�}����0Dѳ\�¤d�jb+H�u$�v���0��A��f�=�ھ����s�h�ī��I�q�:9������M�^��\�\��\o\�\3�����vpu3#��*g��tW;��wpճ��|�~z�c�~�|V?�ꇧ7�{���Տ���}�z9v}��}M�;��9��R�����}-�;xϏÿ���[YO�BV�@V؍�~�o���6�n���t��B���֋�K�u��/�ϱ_h��o��c���u]oy*T"      t   �   x���1� E����W@܄+��d7���?�i�&'���^f�b�<��s^�{�v��S/�ye��f#��&�-6W"��D��f'r�M"k�͍H�M$��u�*���N�21�N>�P���/�*�M��������E>J� =����B�{      ^   �   x���;�0���>�/`��y9� �iL� �O(�@�4H[m�ɖ~�[	��ROi{K9��q^�B�]psˆ�%���k���6� �
8Fh��MZ&@:&�*�LhTa`B�
,G�=��5HgAB-�Y�P�t�$�&A���=�:����V��jW��O��z���yc|vv       \   �   x���=
�P�z�)r����_gi�	Ҥ�!Q�/�%�Y�i�j��ﯭ�02�H#���g�6�I�� 5J�AZ��Ậ�@��?�N�+�2Agl�㌜�1�3v��4��Y6��L�m��8�py,�u~��Q7�RJ_��t�      U     x��P[n�0�vN��A�Aѿ]���C'^�:v�F��O^�;l��%�$��h��V%籰yB/��ŗ��#f�))�L�?ib��:�
Z݂;��'#^вpԳ�\<�x�j�d(�l��V�P*���8�3Y�o�P�ƇŢ����Ɍ���}�
.(�g�ח���A�H�9NeG�I�جM�:�I�Y�������L$�Z��#��֫�D���z1}�w���w':���s?T�w5�4[�o�&NO��\�n�׶i�/���S      W      x������ � �      Y   6  x�m�͒�0 �>��
ID��(��Z^@AQQ@O?:n�XKU�Ρ����b�&�_�IK<�5�60j�q���vN��e��OU��t���I����!�۸7E��Y�Iw�������	�@BD�Qͽ�~Ps7Yx�k4�gy&Hs�Nz�,S�i���XP��~8�����j���-=V�k/b��q�Y�/54�Y�Q������e/-N��DܘܳU|V0���̷^��j����|�MD��?�@*s�vD0<�W�aʆ"S��������Ƴ�E�21�ɐ~{d�a��/�l��H�AB�/�/L$,>6�6<޷~I!��"�1gi7]/j~�Y����s���rG������ݖ�D'P�E�Bі8�BQ�G>*)5��N��N�{�=���g�=�Ot,�"�x�0x쳫\M�0���n�B� U(��>Ч�+)���m�Y!��/��Ƃ�{��X�v�;E$G��<T��`jt���,^I<���*���/���`ކ,߿g� �!�Φ:�;��5�N�`�ih��\�r���N�n�!�0��'��inn��G�6��z��s�     