PGDMP     7                    {            dating-chat    12.13    15.0 #    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    25895    dating-chat    DATABASE     y   CREATE DATABASE "dating-chat" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE "dating-chat";
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false            ?           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    6            ?            1259    25896    profile    TABLE       CREATE TABLE public.profile (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    bio character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);
    DROP TABLE public.profile;
       public         heap    postgres    false    6            ?            1259    25902    profile_id_seq    SEQUENCE     w   CREATE SEQUENCE public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.profile_id_seq;
       public          postgres    false    6    202            ?           0    0    profile_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.profile_id_seq OWNED BY public.profile.id;
          public          postgres    false    203            ?            1259    25904    roles    TABLE     V   CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(60)
);
    DROP TABLE public.roles;
       public         heap    postgres    false    6            ?            1259    25907    roles_id_seq    SEQUENCE     u   CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    204    6            ?           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    205            ?            1259    25909 
   user_roles    TABLE     ]   CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);
    DROP TABLE public.user_roles;
       public         heap    postgres    false    6            ?            1259    25912    users    TABLE     ?  CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    create_expiry timestamp without time zone,
    create_token character varying(255),
    email character varying(40),
    is_account_non_expired boolean NOT NULL,
    is_account_non_locked boolean NOT NULL,
    is_credentials_non_expired boolean NOT NULL,
    is_enabled boolean NOT NULL,
    password character varying(100),
    reset_expiry timestamp without time zone,
    reset_token character varying(255),
    username character varying(255),
    profile_id bigint,
    avatar character varying(255)
);
    DROP TABLE public.users;
       public         heap    postgres    false    6            ?            1259    25918    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    6    207            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    208            /           2604    25920 
   profile id    DEFAULT     h   ALTER TABLE ONLY public.profile ALTER COLUMN id SET DEFAULT nextval('public.profile_id_seq'::regclass);
 9   ALTER TABLE public.profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202            0           2604    25921    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            1           2604    25922    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    207            ?          0    25896    profile 
   TABLE DATA           R   COPY public.profile (id, created_at, updated_at, bio, location, name) FROM stdin;
    public          postgres    false    202   ?'       ?          0    25904    roles 
   TABLE DATA           )   COPY public.roles (id, name) FROM stdin;
    public          postgres    false    204   ?'       ?          0    25909 
   user_roles 
   TABLE DATA           6   COPY public.user_roles (user_id, role_id) FROM stdin;
    public          postgres    false    206   +(       ?          0    25912    users 
   TABLE DATA           ?   COPY public.users (id, created_at, updated_at, create_expiry, create_token, email, is_account_non_expired, is_account_non_locked, is_credentials_non_expired, is_enabled, password, reset_expiry, reset_token, username, profile_id, avatar) FROM stdin;
    public          postgres    false    207   ](       ?           0    0    profile_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.profile_id_seq', 1, false);
          public          postgres    false    203            ?           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    205            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 8, true);
          public          postgres    false    208            ;           2606    25924 !   users UK6j5t70rd2eub907qysjvvd76n 
   CONSTRAINT     _   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UK6j5t70rd2eub907qysjvvd76n" UNIQUE (email);
 M   ALTER TABLE ONLY public.users DROP CONSTRAINT "UK6j5t70rd2eub907qysjvvd76n";
       public            postgres    false    207            3           2606    25926    profile profile_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            postgres    false    202            5           2606    25928    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    204            7           2606    25930 "   roles uk_nb4h0p6txrmfc0xbrd1kglp9t 
   CONSTRAINT     ]   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT uk_nb4h0p6txrmfc0xbrd1kglp9t UNIQUE (name);
 L   ALTER TABLE ONLY public.roles DROP CONSTRAINT uk_nb4h0p6txrmfc0xbrd1kglp9t;
       public            postgres    false    204            9           2606    25932    user_roles user_roles_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);
 D   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT user_roles_pkey;
       public            postgres    false    206    206            =           2606    25934    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    207            >           2606    25935 &   user_roles FK7ov27fyo7ebsvada1ej7qkphl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT "FK7ov27fyo7ebsvada1ej7qkphl" FOREIGN KEY (user_id) REFERENCES public.users(id);
 R   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT "FK7ov27fyo7ebsvada1ej7qkphl";
       public          postgres    false    3645    206    207            ?           2606    25940 &   user_roles FKej3jidxlte0r8flpavhiso3g6    FK CONSTRAINT     ?   ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT "FKej3jidxlte0r8flpavhiso3g6" FOREIGN KEY (role_id) REFERENCES public.roles(id);
 R   ALTER TABLE ONLY public.user_roles DROP CONSTRAINT "FKej3jidxlte0r8flpavhiso3g6";
       public          postgres    false    206    3637    204            @           2606    25945 !   users FKt6objjexsjxjxt4tyr7bg2ks3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FKt6objjexsjxjxt4tyr7bg2ks3" FOREIGN KEY (profile_id) REFERENCES public.profile(id);
 M   ALTER TABLE ONLY public.users DROP CONSTRAINT "FKt6objjexsjxjxt4tyr7bg2ks3";
       public          postgres    false    3635    202    207            ?      x?????? ? ?      ?   +   x?3???q?wt????2?p|??]???!??` ;F??? ?
?      ?   "   x?3?4?2bc 6bS 6bs ? ?=... U?}      ?   ?  x?}??r?6???Sdq??,ɺ?j???.???t?#lc;?6??۶/?v?3g?v?Ef??M*?p&?????/??O?}?Dl????
V,?`???D?R(*?J?\E??)S?ё?p?ȏ~??N???OD??????'?s??>o%N???F?????f?6??Sf޴q3ߏ????ŇG???eT????JGay??<?XV~?e??X?"V>?6`]h @\? ѱ?A??/?̒Lt???Дt?x`a??4?˕h?+??9ප??a?ۇ????KN?>$TA2"%Ǉ??m?Kľ???槼M??iZ?mQ}l????S ???yß]?/F?z?*Ī?N??????^?Ղ?ߋ?vP|??s|???߃?V?q????A???N`??%?i8?2?I?܋s?+I	??)@:.1? I?o????L*?C??Sb*?l??J?Tl?@???1????8t?(z?6ά&????-?V}|̒??N???ݞ??7???a????ؔ\\?iX޶$?E4?yiq???a1??	???b3>??,?_?V(?T??wJ?	9 B+?0c?q?#"?&??2/rn` ???V݇?G????Y???ó????????t?J/??Y???K??\$Ͽ?M7(??D?B?:&2?҃q??%'c?K_?/I??\<˱??Z?	??K#????#???'`?X@?$Aq?K??|??+H@??b?}g?t?y?ɼӾ???rf-?#?N??`??fa?????{?"??v?;¯?R??????/o??,vQ)??D?ۜ????X*??7g??d+(c?zQ????\?Q)+?*?A???h?5)-?d????c.0m\1&m?x?O??r\AҶ?\?2Kl+??D@???Җ??A??x???¼?(T??m?_2??"?>ĥ??U??+???q_???ZO??Ľ\<?j???5\?n?}ȃM?x4e???晞????/??Nϟ????Nf??͓|M??G????]j?/???fCQmZ???:??ڛQk??=?M֟???y???㉶پ????Sm?f????!??????Zr??I?0??\G ?H?b??P?Q[?c?6?dBpBKƂfb??~?$?PH???o??S&?q??g??j?:?Q+?????|????f?lς?Y???SG?v?? ????????[̋|?a乡.S?V?l+FdI?4?@????\????1??>1??[*?"?)΍'?"F?ms['M??jR)??%??[??Т?R6?$!!??G??E*ĩ?;???ax?>???ޙ;??i]?;?lzdF\8?/??զ?P6?3??ѯ?37??C??YN?`A?L'??%?~???V?[f?$???e???4??q?E?6f?o??J???1?<>>????2     