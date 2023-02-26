--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_permissions_role_links (
    permission_id integer,
    role_id integer,
    id integer NOT NULL,
    permission_order integer
);


ALTER TABLE public.admin_permissions_role_links OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_roles_id_seq OWNER TO postgres;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_id_seq OWNER TO postgres;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_users_roles_links (
    user_id integer,
    role_id integer,
    id integer NOT NULL,
    role_order integer,
    user_order integer
);


ALTER TABLE public.admin_users_roles_links OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_users_roles_links_id_seq OWNER TO postgres;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    folder_path character varying(255)
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_folder_links (
    file_id integer,
    folder_id integer,
    id integer NOT NULL,
    file_order integer
);


ALTER TABLE public.files_folder_links OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_folder_links_id_seq OWNER TO postgres;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files_related_morphs (
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" integer,
    id integer NOT NULL
);


ALTER TABLE public.files_related_morphs OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_related_morphs_id_seq OWNER TO postgres;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.i18n_locale_id_seq OWNER TO postgres;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    email character varying(255),
    local character varying(255),
    price double precision,
    tax boolean,
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    price_tax numeric(10,2),
    name_receiver character varying(255),
    delivered boolean,
    name_buyer character varying(255)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_category_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category_links (
    product_id integer,
    category_id integer,
    id integer NOT NULL,
    product_order integer
);


ALTER TABLE public.products_category_links OWNER TO postgres;

--
-- Name: products_category_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_links_id_seq OWNER TO postgres;

--
-- Name: products_category_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_links_id_seq OWNED BY public.products_category_links.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order integer
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_token_permissions_token_links_id_seq OWNER TO postgres;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint
);


ALTER TABLE public.strapi_api_tokens OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_api_tokens_id_seq OWNER TO postgres;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_core_store_settings_id_seq OWNER TO postgres;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_database_schema_id_seq OWNER TO postgres;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_migrations_id_seq OWNER TO postgres;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.strapi_webhooks_id_seq OWNER TO postgres;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: teste2s; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teste2s (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.teste2s OWNER TO postgres;

--
-- Name: teste2s_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teste2s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teste2s_id_seq OWNER TO postgres;

--
-- Name: teste2s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teste2s_id_seq OWNED BY public.teste2s.id;


--
-- Name: teste_2_s_testes_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teste_2_s_testes_links (
    teste_2_id integer,
    teste_id integer,
    id integer NOT NULL,
    teste_order integer,
    teste_2_order integer
);


ALTER TABLE public.teste_2_s_testes_links OWNER TO postgres;

--
-- Name: teste_2_s_testes_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teste_2_s_testes_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teste_2_s_testes_links_id_seq OWNER TO postgres;

--
-- Name: teste_2_s_testes_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teste_2_s_testes_links_id_seq OWNED BY public.teste_2_s_testes_links.id;


--
-- Name: testes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testes (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.testes OWNER TO postgres;

--
-- Name: testes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.testes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testes_id_seq OWNER TO postgres;

--
-- Name: testes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.testes_id_seq OWNED BY public.testes.id;


--
-- Name: testes_teste_2_s_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.testes_teste_2_s_links (
    teste_id integer,
    teste_2_id integer,
    id integer NOT NULL,
    teste_2_order integer,
    teste_order integer
);


ALTER TABLE public.testes_teste_2_s_links OWNER TO postgres;

--
-- Name: testes_teste_2_s_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.testes_teste_2_s_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testes_teste_2_s_links_id_seq OWNER TO postgres;

--
-- Name: testes_teste_2_s_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.testes_teste_2_s_links_id_seq OWNED BY public.testes_teste_2_s_links.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_id_seq OWNER TO postgres;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_permissions_role_links (
    permission_id integer,
    role_id integer,
    id integer NOT NULL,
    permission_order integer
);


ALTER TABLE public.up_permissions_role_links OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_permissions_role_links_id_seq OWNER TO postgres;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_roles_id_seq OWNER TO postgres;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_users OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_id_seq OWNER TO postgres;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.up_users_role_links (
    user_id integer,
    role_id integer,
    id integer NOT NULL,
    user_order integer
);


ALTER TABLE public.up_users_role_links OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.up_users_role_links_id_seq OWNER TO postgres;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_id_seq OWNER TO postgres;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.upload_folders_parent_links (
    folder_id integer,
    inv_folder_id integer,
    id integer NOT NULL,
    folder_order integer
);


ALTER TABLE public.upload_folders_parent_links OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_folders_parent_links_id_seq OWNER TO postgres;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_category_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links ALTER COLUMN id SET DEFAULT nextval('public.products_category_links_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: teste2s id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste2s ALTER COLUMN id SET DEFAULT nextval('public.teste2s_id_seq'::regclass);


--
-- Name: teste_2_s_testes_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste_2_s_testes_links ALTER COLUMN id SET DEFAULT nextval('public.teste_2_s_testes_links_id_seq'::regclass);


--
-- Name: testes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes ALTER COLUMN id SET DEFAULT nextval('public.testes_id_seq'::regclass);


--
-- Name: testes_teste_2_s_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes_teste_2_s_links ALTER COLUMN id SET DEFAULT nextval('public.testes_teste_2_s_links_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions (id, action, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::upload.read	\N	{}	[]	2022-08-31 03:35:21.533	2022-08-31 03:35:21.533	\N	\N
2	plugin::upload.assets.create	\N	{}	[]	2022-08-31 03:35:21.537	2022-08-31 03:35:21.537	\N	\N
3	plugin::upload.assets.update	\N	{}	[]	2022-08-31 03:35:21.539	2022-08-31 03:35:21.539	\N	\N
4	plugin::upload.assets.download	\N	{}	[]	2022-08-31 03:35:21.541	2022-08-31 03:35:21.541	\N	\N
5	plugin::upload.assets.copy-link	\N	{}	[]	2022-08-31 03:35:21.544	2022-08-31 03:35:21.544	\N	\N
6	plugin::upload.read	\N	{}	["admin::is-creator"]	2022-08-31 03:35:21.546	2022-08-31 03:35:21.546	\N	\N
7	plugin::upload.assets.create	\N	{}	[]	2022-08-31 03:35:21.548	2022-08-31 03:35:21.548	\N	\N
8	plugin::upload.assets.update	\N	{}	["admin::is-creator"]	2022-08-31 03:35:21.55	2022-08-31 03:35:21.55	\N	\N
9	plugin::upload.assets.download	\N	{}	[]	2022-08-31 03:35:21.552	2022-08-31 03:35:21.552	\N	\N
10	plugin::upload.assets.copy-link	\N	{}	[]	2022-08-31 03:35:21.553	2022-08-31 03:35:21.553	\N	\N
11	plugin::content-manager.explorer.create	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-08-31 03:35:21.575	2022-08-31 03:35:21.575	\N	\N
12	plugin::content-manager.explorer.read	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-08-31 03:35:21.577	2022-08-31 03:35:21.577	\N	\N
13	plugin::content-manager.explorer.update	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2022-08-31 03:35:21.579	2022-08-31 03:35:21.579	\N	\N
14	plugin::content-manager.explorer.delete	plugin::users-permissions.user	{}	[]	2022-08-31 03:35:21.582	2022-08-31 03:35:21.582	\N	\N
15	plugin::content-manager.single-types.configure-view	\N	{}	[]	2022-08-31 03:35:21.584	2022-08-31 03:35:21.584	\N	\N
16	plugin::content-manager.collection-types.configure-view	\N	{}	[]	2022-08-31 03:35:21.586	2022-08-31 03:35:21.586	\N	\N
17	plugin::content-manager.components.configure-layout	\N	{}	[]	2022-08-31 03:35:21.588	2022-08-31 03:35:21.588	\N	\N
18	plugin::content-type-builder.read	\N	{}	[]	2022-08-31 03:35:21.59	2022-08-31 03:35:21.59	\N	\N
19	plugin::email.settings.read	\N	{}	[]	2022-08-31 03:35:21.592	2022-08-31 03:35:21.592	\N	\N
20	plugin::upload.read	\N	{}	[]	2022-08-31 03:35:21.594	2022-08-31 03:35:21.594	\N	\N
21	plugin::upload.assets.create	\N	{}	[]	2022-08-31 03:35:21.595	2022-08-31 03:35:21.595	\N	\N
22	plugin::upload.assets.update	\N	{}	[]	2022-08-31 03:35:21.597	2022-08-31 03:35:21.597	\N	\N
23	plugin::upload.assets.download	\N	{}	[]	2022-08-31 03:35:21.599	2022-08-31 03:35:21.599	\N	\N
24	plugin::upload.assets.copy-link	\N	{}	[]	2022-08-31 03:35:21.6	2022-08-31 03:35:21.6	\N	\N
25	plugin::upload.settings.read	\N	{}	[]	2022-08-31 03:35:21.603	2022-08-31 03:35:21.603	\N	\N
26	plugin::users-permissions.roles.create	\N	{}	[]	2022-08-31 03:35:21.605	2022-08-31 03:35:21.605	\N	\N
27	plugin::users-permissions.roles.read	\N	{}	[]	2022-08-31 03:35:21.606	2022-08-31 03:35:21.606	\N	\N
28	plugin::users-permissions.roles.update	\N	{}	[]	2022-08-31 03:35:21.609	2022-08-31 03:35:21.609	\N	\N
29	plugin::users-permissions.roles.delete	\N	{}	[]	2022-08-31 03:35:21.611	2022-08-31 03:35:21.611	\N	\N
30	plugin::users-permissions.providers.read	\N	{}	[]	2022-08-31 03:35:21.613	2022-08-31 03:35:21.613	\N	\N
31	plugin::users-permissions.providers.update	\N	{}	[]	2022-08-31 03:35:21.614	2022-08-31 03:35:21.614	\N	\N
32	plugin::users-permissions.email-templates.read	\N	{}	[]	2022-08-31 03:35:21.616	2022-08-31 03:35:21.616	\N	\N
33	plugin::users-permissions.email-templates.update	\N	{}	[]	2022-08-31 03:35:21.618	2022-08-31 03:35:21.618	\N	\N
34	plugin::users-permissions.advanced-settings.read	\N	{}	[]	2022-08-31 03:35:21.62	2022-08-31 03:35:21.62	\N	\N
35	plugin::users-permissions.advanced-settings.update	\N	{}	[]	2022-08-31 03:35:21.621	2022-08-31 03:35:21.621	\N	\N
36	plugin::i18n.locale.create	\N	{}	[]	2022-08-31 03:35:21.623	2022-08-31 03:35:21.623	\N	\N
37	plugin::i18n.locale.read	\N	{}	[]	2022-08-31 03:35:21.625	2022-08-31 03:35:21.625	\N	\N
38	plugin::i18n.locale.update	\N	{}	[]	2022-08-31 03:35:21.626	2022-08-31 03:35:21.626	\N	\N
39	plugin::i18n.locale.delete	\N	{}	[]	2022-08-31 03:35:21.628	2022-08-31 03:35:21.628	\N	\N
40	admin::marketplace.read	\N	{}	[]	2022-08-31 03:35:21.63	2022-08-31 03:35:21.63	\N	\N
41	admin::marketplace.plugins.install	\N	{}	[]	2022-08-31 03:35:21.631	2022-08-31 03:35:21.631	\N	\N
42	admin::marketplace.plugins.uninstall	\N	{}	[]	2022-08-31 03:35:21.634	2022-08-31 03:35:21.634	\N	\N
43	admin::webhooks.create	\N	{}	[]	2022-08-31 03:35:21.635	2022-08-31 03:35:21.635	\N	\N
44	admin::webhooks.read	\N	{}	[]	2022-08-31 03:35:21.637	2022-08-31 03:35:21.637	\N	\N
45	admin::webhooks.update	\N	{}	[]	2022-08-31 03:35:21.639	2022-08-31 03:35:21.639	\N	\N
46	admin::webhooks.delete	\N	{}	[]	2022-08-31 03:35:21.641	2022-08-31 03:35:21.641	\N	\N
47	admin::users.create	\N	{}	[]	2022-08-31 03:35:21.642	2022-08-31 03:35:21.642	\N	\N
48	admin::users.read	\N	{}	[]	2022-08-31 03:35:21.644	2022-08-31 03:35:21.644	\N	\N
49	admin::users.update	\N	{}	[]	2022-08-31 03:35:21.646	2022-08-31 03:35:21.646	\N	\N
50	admin::users.delete	\N	{}	[]	2022-08-31 03:35:21.647	2022-08-31 03:35:21.647	\N	\N
51	admin::roles.create	\N	{}	[]	2022-08-31 03:35:21.649	2022-08-31 03:35:21.649	\N	\N
52	admin::roles.read	\N	{}	[]	2022-08-31 03:35:21.651	2022-08-31 03:35:21.651	\N	\N
53	admin::roles.update	\N	{}	[]	2022-08-31 03:35:21.653	2022-08-31 03:35:21.653	\N	\N
54	admin::roles.delete	\N	{}	[]	2022-08-31 03:35:21.655	2022-08-31 03:35:21.655	\N	\N
55	admin::api-tokens.create	\N	{}	[]	2022-08-31 03:35:21.656	2022-08-31 03:35:21.656	\N	\N
56	admin::api-tokens.read	\N	{}	[]	2022-08-31 03:35:21.658	2022-08-31 03:35:21.658	\N	\N
57	admin::api-tokens.update	\N	{}	[]	2022-08-31 03:35:21.66	2022-08-31 03:35:21.66	\N	\N
58	admin::api-tokens.delete	\N	{}	[]	2022-08-31 03:35:21.661	2022-08-31 03:35:21.661	\N	\N
59	admin::project-settings.update	\N	{}	[]	2022-08-31 03:35:21.663	2022-08-31 03:35:21.663	\N	\N
60	admin::project-settings.read	\N	{}	[]	2022-08-31 03:35:21.664	2022-08-31 03:35:21.664	\N	\N
115	plugin::content-manager.explorer.delete	api::teste.teste	{}	[]	2022-09-04 18:27:36.197	2022-09-04 18:27:36.197	\N	\N
116	plugin::content-manager.explorer.publish	api::teste.teste	{}	[]	2022-09-04 18:27:36.199	2022-09-04 18:27:36.199	\N	\N
120	plugin::content-manager.explorer.delete	api::teste2.teste2	{}	[]	2022-09-04 18:27:54.538	2022-09-04 18:27:54.538	\N	\N
121	plugin::content-manager.explorer.publish	api::teste2.teste2	{}	[]	2022-09-04 18:27:54.54	2022-09-04 18:27:54.54	\N	\N
125	plugin::content-manager.explorer.create	api::teste.teste	{"fields": ["name", "teste_2s"]}	[]	2022-09-04 18:28:41.259	2022-09-04 18:28:41.259	\N	\N
126	plugin::content-manager.explorer.create	api::teste2.teste2	{"fields": ["name", "testes"]}	[]	2022-09-04 18:28:41.263	2022-09-04 18:28:41.263	\N	\N
127	plugin::content-manager.explorer.read	api::teste.teste	{"fields": ["name", "teste_2s"]}	[]	2022-09-04 18:28:41.265	2022-09-04 18:28:41.265	\N	\N
128	plugin::content-manager.explorer.read	api::teste2.teste2	{"fields": ["name", "testes"]}	[]	2022-09-04 18:28:41.267	2022-09-04 18:28:41.267	\N	\N
129	plugin::content-manager.explorer.update	api::teste.teste	{"fields": ["name", "teste_2s"]}	[]	2022-09-04 18:28:41.269	2022-09-04 18:28:41.269	\N	\N
130	plugin::content-manager.explorer.update	api::teste2.teste2	{"fields": ["name", "testes"]}	[]	2022-09-04 18:28:41.271	2022-09-04 18:28:41.271	\N	\N
143	plugin::content-manager.explorer.create	plugin::produtos.category	{"fields": ["name", "slug", "products"]}	[]	2022-09-09 20:17:18.472	2022-09-09 20:17:18.472	\N	\N
145	plugin::content-manager.explorer.read	plugin::produtos.category	{"fields": ["name", "slug", "products"]}	[]	2022-09-09 20:17:18.479	2022-09-09 20:17:18.479	\N	\N
147	plugin::content-manager.explorer.update	plugin::produtos.category	{"fields": ["name", "slug", "products"]}	[]	2022-09-09 20:17:18.485	2022-09-09 20:17:18.485	\N	\N
149	plugin::content-manager.explorer.delete	plugin::produtos.category	{}	[]	2022-09-09 20:17:18.49	2022-09-09 20:17:18.49	\N	\N
150	plugin::content-manager.explorer.delete	plugin::produtos.product	{}	[]	2022-09-09 20:17:18.493	2022-09-09 20:17:18.493	\N	\N
151	plugin::content-manager.explorer.create	plugin::produtos.product	{"fields": ["name", "slug", "email", "local", "price", "tax", "code", "category", "image", "priceTax", "nameReceiver", "delivered", "nameBuyer"]}	[]	2022-09-09 21:12:44.123	2022-09-09 21:12:44.123	\N	\N
152	plugin::content-manager.explorer.read	plugin::produtos.product	{"fields": ["name", "slug", "email", "local", "price", "tax", "code", "category", "image", "priceTax", "nameReceiver", "delivered", "nameBuyer"]}	[]	2022-09-09 21:12:44.128	2022-09-09 21:12:44.128	\N	\N
153	plugin::content-manager.explorer.update	plugin::produtos.product	{"fields": ["name", "slug", "email", "local", "price", "tax", "code", "category", "image", "priceTax", "nameReceiver", "delivered", "nameBuyer"]}	[]	2022-09-09 21:12:44.13	2022-09-09 21:12:44.13	\N	\N
154	plugin::upload.configure-view	\N	{}	[]	2023-02-09 22:45:22.459	2023-02-09 22:45:22.459	\N	\N
155	admin::api-tokens.access	\N	{}	[]	2023-02-09 22:45:22.473	2023-02-09 22:45:22.473	\N	\N
156	admin::api-tokens.regenerate	\N	{}	[]	2023-02-09 22:45:22.48	2023-02-09 22:45:22.48	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_permissions_role_links (permission_id, role_id, id, permission_order) FROM stdin;
1	2	1	\N
2	2	2	\N
3	2	3	\N
4	2	4	\N
5	2	5	\N
6	3	6	\N
7	3	7	\N
8	3	8	\N
9	3	9	\N
10	3	10	\N
11	1	11	\N
12	1	12	\N
13	1	13	\N
14	1	14	\N
15	1	15	\N
16	1	16	\N
17	1	17	\N
18	1	18	\N
19	1	19	\N
20	1	20	\N
21	1	21	\N
22	1	22	\N
23	1	23	\N
24	1	24	\N
25	1	25	\N
26	1	26	\N
27	1	27	\N
28	1	28	\N
29	1	29	\N
30	1	30	\N
31	1	31	\N
32	1	32	\N
33	1	33	\N
34	1	34	\N
35	1	35	\N
36	1	36	\N
37	1	37	\N
38	1	38	\N
39	1	39	\N
40	1	40	\N
41	1	41	\N
42	1	42	\N
43	1	43	\N
44	1	44	\N
45	1	45	\N
46	1	46	\N
47	1	47	\N
48	1	48	\N
49	1	49	\N
50	1	50	\N
51	1	51	\N
52	1	52	\N
53	1	53	\N
54	1	54	\N
55	1	55	\N
56	1	56	\N
57	1	57	\N
58	1	58	\N
59	1	59	\N
60	1	60	\N
115	1	66	\N
116	1	67	\N
120	1	68	\N
121	1	69	\N
125	1	70	\N
126	1	71	\N
127	1	72	\N
128	1	73	\N
129	1	74	\N
130	1	75	\N
143	1	79	\N
145	1	81	\N
147	1	83	\N
149	1	85	\N
150	1	86	\N
151	1	87	\N
152	1	88	\N
153	1	89	\N
154	1	90	1
155	1	91	2
156	1	92	3
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2022-08-31 03:35:21.523	2022-08-31 03:35:21.523	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2022-08-31 03:35:21.528	2022-08-31 03:35:21.528	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2022-08-31 03:35:21.53	2022-08-31 03:35:21.53	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Leonardo	Medeiros Prado	\N	leonardo_medeiros_prado@hotmail.com	$2a$10$rF.mFa/WcPvGgj418O71c.mOhE94TAWgNg/vHWTjKVwpk.qnWiT/K	\N	\N	t	f	\N	2022-08-31 03:35:58.719	2022-08-31 03:35:58.719	\N	\N
2	Vinícius	Rottolo Garcia	\N	vinicius.rottolo.g@gmail.com	$2a$10$EWEvnopkAZAv/7Kc3cSDmevntlf7aqjzCKMyFnYkeOAhA2/V1/DRS	\N	\N	t	f	\N	2022-09-15 20:02:29.898	2022-09-27 03:55:09.574	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_users_roles_links (user_id, role_id, id, role_order, user_order) FROM stdin;
1	1	1	\N	\N
2	1	2	\N	\N
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, slug, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Doogee S98	doogee-s98	2022-08-31 03:54:43.077	2022-08-31 04:39:08.841	1	1
2	Doogee S98 Pro	doogee-s98-pro	2022-08-31 03:55:11.649	2022-08-31 04:39:27.835	1	1
3	Doogee S97 Pro	doogee-s97-pro	2022-11-14 17:00:46.492	2022-11-14 17:00:46.492	1	1
4	Doogee S99	doogee-s99	2023-01-07 17:54:43.244	2023-01-07 17:54:43.244	1	1
5	Sony ZV-E10	sony-zv-e10	2023-02-10 06:45:48.512	2023-02-10 06:45:48.512	1	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, created_at, updated_at, created_by_id, updated_by_id, folder_path) FROM stdin;
5	doogee-s98-2.jpg	doogee-s98-2.jpg	doogee-s98-2.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_2_fa0555d635.jpg", "hash": "large_doogee_s98_2_fa0555d635", "mime": "image/jpeg", "name": "large_doogee-s98-2.jpg", "path": null, "size": 95.55, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_2_fa0555d635.jpg", "hash": "small_doogee_s98_2_fa0555d635", "mime": "image/jpeg", "name": "small_doogee-s98-2.jpg", "path": null, "size": 25.78, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_2_fa0555d635.jpg", "hash": "medium_doogee_s98_2_fa0555d635", "mime": "image/jpeg", "name": "medium_doogee-s98-2.jpg", "path": null, "size": 55.37, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_2_fa0555d635.jpg", "hash": "thumbnail_doogee_s98_2_fa0555d635", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-2.jpg", "path": null, "size": 5.52, "width": 208, "height": 156}}	doogee_s98_2_fa0555d635	.jpg	image/jpeg	2002.51	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_2_fa0555d635.jpg	\N	aws-s3	\N	2022-09-21 17:00:11.773	2022-09-21 17:00:11.773	1	1	/
6	doogee-s98-3.jpg	doogee-s98-3.jpg	doogee-s98-3.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_3_257d8910ed.jpg", "hash": "large_doogee_s98_3_257d8910ed", "mime": "image/jpeg", "name": "large_doogee-s98-3.jpg", "path": null, "size": 95.2, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_3_257d8910ed.jpg", "hash": "small_doogee_s98_3_257d8910ed", "mime": "image/jpeg", "name": "small_doogee-s98-3.jpg", "path": null, "size": 26.61, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_3_257d8910ed.jpg", "hash": "medium_doogee_s98_3_257d8910ed", "mime": "image/jpeg", "name": "medium_doogee-s98-3.jpg", "path": null, "size": 56.22, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_3_257d8910ed.jpg", "hash": "thumbnail_doogee_s98_3_257d8910ed", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-3.jpg", "path": null, "size": 5.87, "width": 208, "height": 156}}	doogee_s98_3_257d8910ed	.jpg	image/jpeg	1918.84	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_3_257d8910ed.jpg	\N	aws-s3	\N	2022-09-21 17:00:38.406	2022-09-21 17:00:38.406	1	1	/
4	doogee-s98-1.jpg	doogee-s98-1.jpg	doogee-s98-1.jpg	1200	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_1_49ac84e853.jpg", "hash": "large_doogee_s98_1_49ac84e853", "mime": "image/jpeg", "name": "large_doogee-s98-1.jpg", "path": null, "size": 92.2, "width": 750, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_1_49ac84e853.jpg", "hash": "small_doogee_s98_1_49ac84e853", "mime": "image/jpeg", "name": "small_doogee-s98-1.jpg", "path": null, "size": 24.14, "width": 375, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_1_49ac84e853.jpg", "hash": "medium_doogee_s98_1_49ac84e853", "mime": "image/jpeg", "name": "medium_doogee-s98-1.jpg", "path": null, "size": 53.6, "width": 563, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_1_49ac84e853.jpg", "hash": "thumbnail_doogee_s98_1_49ac84e853", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-1.jpg", "path": null, "size": 2.98, "width": 117, "height": 156}}	doogee_s98_1_49ac84e853	.jpg	image/jpeg	203.28	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_1_49ac84e853.jpg	\N	aws-s3	\N	2022-09-21 16:59:17.551	2022-09-21 16:59:17.551	1	1	/
7	doogee-s98-4.jpg	doogee-s98-4.jpg	doogee-s98-4.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_4_15058f614e.jpg", "hash": "large_doogee_s98_4_15058f614e", "mime": "image/jpeg", "name": "large_doogee-s98-4.jpg", "path": null, "size": 94.4, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_4_15058f614e.jpg", "hash": "small_doogee_s98_4_15058f614e", "mime": "image/jpeg", "name": "small_doogee-s98-4.jpg", "path": null, "size": 26.9, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_4_15058f614e.jpg", "hash": "medium_doogee_s98_4_15058f614e", "mime": "image/jpeg", "name": "medium_doogee-s98-4.jpg", "path": null, "size": 55.75, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_4_15058f614e.jpg", "hash": "thumbnail_doogee_s98_4_15058f614e", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-4.jpg", "path": null, "size": 5.99, "width": 208, "height": 156}}	doogee_s98_4_15058f614e	.jpg	image/jpeg	1883.33	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_4_15058f614e.jpg	\N	aws-s3	\N	2022-09-21 17:01:03.921	2022-09-21 17:01:03.921	1	1	/
8	doogee-s98-5.jpg	doogee-s98-5.jpg	doogee-s98-5.jpg	720	1280	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_5_f03202cc5f.jpg", "hash": "large_doogee_s98_5_f03202cc5f", "mime": "image/jpeg", "name": "large_doogee-s98-5.jpg", "path": null, "size": 66.2, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_5_f03202cc5f.jpg", "hash": "small_doogee_s98_5_f03202cc5f", "mime": "image/jpeg", "name": "small_doogee-s98-5.jpg", "path": null, "size": 21.21, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_5_f03202cc5f.jpg", "hash": "medium_doogee_s98_5_f03202cc5f", "mime": "image/jpeg", "name": "medium_doogee-s98-5.jpg", "path": null, "size": 41.69, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_5_f03202cc5f.jpg", "hash": "thumbnail_doogee_s98_5_f03202cc5f", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-5.jpg", "path": null, "size": 2.68, "width": 88, "height": 156}}	doogee_s98_5_f03202cc5f	.jpg	image/jpeg	80.22	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_5_f03202cc5f.jpg	\N	aws-s3	\N	2022-09-21 17:01:22.701	2022-09-21 17:01:22.701	1	1	/
9	doogee-s98-6.jpg	doogee-s98-6.jpg	doogee-s98-6.jpg	720	1280	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_6_18f396f4b2.jpg", "hash": "large_doogee_s98_6_18f396f4b2", "mime": "image/jpeg", "name": "large_doogee-s98-6.jpg", "path": null, "size": 64.01, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_6_18f396f4b2.jpg", "hash": "small_doogee_s98_6_18f396f4b2", "mime": "image/jpeg", "name": "small_doogee-s98-6.jpg", "path": null, "size": 19, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_6_18f396f4b2.jpg", "hash": "medium_doogee_s98_6_18f396f4b2", "mime": "image/jpeg", "name": "medium_doogee-s98-6.jpg", "path": null, "size": 39.54, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_6_18f396f4b2.jpg", "hash": "thumbnail_doogee_s98_6_18f396f4b2", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-6.jpg", "path": null, "size": 2.39, "width": 88, "height": 156}}	doogee_s98_6_18f396f4b2	.jpg	image/jpeg	78.41	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_6_18f396f4b2.jpg	\N	aws-s3	\N	2022-09-21 17:01:38.805	2022-09-21 17:01:38.805	1	1	/
10	doogee-s98-7.jpg	doogee-s98-7.jpg	doogee-s98-7.jpg	720	1280	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_7_6f028a9ec0.jpg", "hash": "large_doogee_s98_7_6f028a9ec0", "mime": "image/jpeg", "name": "large_doogee-s98-7.jpg", "path": null, "size": 75.21, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_7_6f028a9ec0.jpg", "hash": "small_doogee_s98_7_6f028a9ec0", "mime": "image/jpeg", "name": "small_doogee-s98-7.jpg", "path": null, "size": 22.83, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_7_6f028a9ec0.jpg", "hash": "medium_doogee_s98_7_6f028a9ec0", "mime": "image/jpeg", "name": "medium_doogee-s98-7.jpg", "path": null, "size": 46.78, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_7_6f028a9ec0.jpg", "hash": "thumbnail_doogee_s98_7_6f028a9ec0", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-7.jpg", "path": null, "size": 3.06, "width": 88, "height": 156}}	doogee_s98_7_6f028a9ec0	.jpg	image/jpeg	94.23	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_7_6f028a9ec0.jpg	\N	aws-s3	\N	2022-09-21 17:01:55.256	2022-09-21 17:01:55.256	1	1	/
11	doogee-s98-10.jpg	doogee-s98-10.jpg	doogee-s98-10.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_10_1a8665f125.jpg", "hash": "large_doogee_s98_10_1a8665f125", "mime": "image/jpeg", "name": "large_doogee-s98-10.jpg", "path": null, "size": 101.44, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_10_1a8665f125.jpg", "hash": "small_doogee_s98_10_1a8665f125", "mime": "image/jpeg", "name": "small_doogee-s98-10.jpg", "path": null, "size": 26.53, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_10_1a8665f125.jpg", "hash": "medium_doogee_s98_10_1a8665f125", "mime": "image/jpeg", "name": "medium_doogee-s98-10.jpg", "path": null, "size": 58.76, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_10_1a8665f125.jpg", "hash": "thumbnail_doogee_s98_10_1a8665f125", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-10.jpg", "path": null, "size": 5.53, "width": 208, "height": 156}}	doogee_s98_10_1a8665f125	.jpg	image/jpeg	1845.57	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_10_1a8665f125.jpg	\N	aws-s3	\N	2022-09-21 17:02:20.464	2022-09-21 17:02:20.464	1	1	/
12	doogee-s98-12.jpg	doogee-s98-12.jpg	doogee-s98-12.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_12_5f6405541b.jpg", "hash": "large_doogee_s98_12_5f6405541b", "mime": "image/jpeg", "name": "large_doogee-s98-12.jpg", "path": null, "size": 66.43, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_12_5f6405541b.jpg", "hash": "small_doogee_s98_12_5f6405541b", "mime": "image/jpeg", "name": "small_doogee-s98-12.jpg", "path": null, "size": 20.32, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_12_5f6405541b.jpg", "hash": "medium_doogee_s98_12_5f6405541b", "mime": "image/jpeg", "name": "medium_doogee-s98-12.jpg", "path": null, "size": 41.52, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_12_5f6405541b.jpg", "hash": "thumbnail_doogee_s98_12_5f6405541b", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-12.jpg", "path": null, "size": 2.5, "width": 87, "height": 156}}	doogee_s98_12_5f6405541b	.jpg	image/jpeg	110.13	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_12_5f6405541b.jpg	\N	aws-s3	\N	2022-09-21 17:02:41.999	2022-09-21 17:02:41.999	1	1	/
13	doogee-s98-pro-1.jpg	doogee-s98-pro-1.jpg	doogee-s98-pro-1.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_pro_1_f999d4ebf6.jpg", "hash": "large_doogee_s98_pro_1_f999d4ebf6", "mime": "image/jpeg", "name": "large_doogee-s98-pro-1.jpg", "path": null, "size": 122.88, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_pro_1_f999d4ebf6.jpg", "hash": "small_doogee_s98_pro_1_f999d4ebf6", "mime": "image/jpeg", "name": "small_doogee-s98-pro-1.jpg", "path": null, "size": 30.19, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_pro_1_f999d4ebf6.jpg", "hash": "medium_doogee_s98_pro_1_f999d4ebf6", "mime": "image/jpeg", "name": "medium_doogee-s98-pro-1.jpg", "path": null, "size": 68.59, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_pro_1_f999d4ebf6.jpg", "hash": "thumbnail_doogee_s98_pro_1_f999d4ebf6", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-pro-1.jpg", "path": null, "size": 5.94, "width": 208, "height": 156}}	doogee_s98_pro_1_f999d4ebf6	.jpg	image/jpeg	2377.96	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_pro_1_f999d4ebf6.jpg	\N	aws-s3	\N	2022-09-21 23:04:33.147	2022-09-21 23:04:33.147	1	1	/
14	doogee-s98-11.jpg	doogee-s98-11.jpg	doogee-s98-11.jpg	720	1280	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_11_5855a786a2.jpg", "hash": "large_doogee_s98_11_5855a786a2", "mime": "image/jpeg", "name": "large_doogee-s98-11.jpg", "path": null, "size": 94.25, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_11_5855a786a2.jpg", "hash": "small_doogee_s98_11_5855a786a2", "mime": "image/jpeg", "name": "small_doogee-s98-11.jpg", "path": null, "size": 25.78, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_11_5855a786a2.jpg", "hash": "medium_doogee_s98_11_5855a786a2", "mime": "image/jpeg", "name": "medium_doogee-s98-11.jpg", "path": null, "size": 55.64, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_11_5855a786a2.jpg", "hash": "thumbnail_doogee_s98_11_5855a786a2", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-11.jpg", "path": null, "size": 2.83, "width": 88, "height": 156}}	doogee_s98_11_5855a786a2	.jpg	image/jpeg	121.61	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_11_5855a786a2.jpg	\N	aws-s3	\N	2022-09-22 01:29:43.68	2022-09-22 01:29:43.68	1	1	/
15	doogee-s98-8.jpg	doogee-s98-8.jpg	doogee-s98-8.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_8_3e7ae51bab.jpg", "hash": "large_doogee_s98_8_3e7ae51bab", "mime": "image/jpeg", "name": "large_doogee-s98-8.jpg", "path": null, "size": 82.48, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_8_3e7ae51bab.jpg", "hash": "small_doogee_s98_8_3e7ae51bab", "mime": "image/jpeg", "name": "small_doogee-s98-8.jpg", "path": null, "size": 24.56, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_8_3e7ae51bab.jpg", "hash": "medium_doogee_s98_8_3e7ae51bab", "mime": "image/jpeg", "name": "medium_doogee-s98-8.jpg", "path": null, "size": 50.71, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_8_3e7ae51bab.jpg", "hash": "thumbnail_doogee_s98_8_3e7ae51bab", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-8.jpg", "path": null, "size": 3, "width": 87, "height": 156}}	doogee_s98_8_3e7ae51bab	.jpg	image/jpeg	139.40	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_8_3e7ae51bab.jpg	\N	aws-s3	\N	2022-09-22 15:22:55.55	2022-09-22 15:22:55.55	1	1	/
16	doogee-s98-9.jpg	doogee-s98-9.jpg	doogee-s98-9.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_9_f5620134fa.jpg", "hash": "large_doogee_s98_9_f5620134fa", "mime": "image/jpeg", "name": "large_doogee-s98-9.jpg", "path": null, "size": 84.91, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_9_f5620134fa.jpg", "hash": "small_doogee_s98_9_f5620134fa", "mime": "image/jpeg", "name": "small_doogee-s98-9.jpg", "path": null, "size": 24.87, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_9_f5620134fa.jpg", "hash": "medium_doogee_s98_9_f5620134fa", "mime": "image/jpeg", "name": "medium_doogee-s98-9.jpg", "path": null, "size": 51.42, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_9_f5620134fa.jpg", "hash": "thumbnail_doogee_s98_9_f5620134fa", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-9.jpg", "path": null, "size": 3.22, "width": 87, "height": 156}}	doogee_s98_9_f5620134fa	.jpg	image/jpeg	178.87	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_9_f5620134fa.jpg	\N	aws-s3	\N	2022-09-26 02:15:43.114	2022-09-26 02:15:43.114	1	1	/
17	doogee-s98-15.jpg	doogee-s98-15.jpg	doogee-s98-15.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_15_17c319b39e.jpg", "hash": "large_doogee_s98_15_17c319b39e", "mime": "image/jpeg", "name": "large_doogee-s98-15.jpg", "path": null, "size": 67.44, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_15_17c319b39e.jpg", "hash": "small_doogee_s98_15_17c319b39e", "mime": "image/jpeg", "name": "small_doogee-s98-15.jpg", "path": null, "size": 21.46, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_15_17c319b39e.jpg", "hash": "medium_doogee_s98_15_17c319b39e", "mime": "image/jpeg", "name": "medium_doogee-s98-15.jpg", "path": null, "size": 42.78, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_15_17c319b39e.jpg", "hash": "thumbnail_doogee_s98_15_17c319b39e", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-15.jpg", "path": null, "size": 3.01, "width": 87, "height": 156}}	doogee_s98_15_17c319b39e	.jpg	image/jpeg	112.61	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_15_17c319b39e.jpg	\N	aws-s3	\N	2022-10-05 16:36:56.173	2022-10-05 16:36:56.173	1	1	/
18	doogee-s98-13.jpg	doogee-s98-13.jpg	doogee-s98-13.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_13_a40db6c495.jpg", "hash": "large_doogee_s98_13_a40db6c495", "mime": "image/jpeg", "name": "large_doogee-s98-13.jpg", "path": null, "size": 64.76, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_13_a40db6c495.jpg", "hash": "small_doogee_s98_13_a40db6c495", "mime": "image/jpeg", "name": "small_doogee-s98-13.jpg", "path": null, "size": 20.89, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_13_a40db6c495.jpg", "hash": "medium_doogee_s98_13_a40db6c495", "mime": "image/jpeg", "name": "medium_doogee-s98-13.jpg", "path": null, "size": 40.98, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_13_a40db6c495.jpg", "hash": "thumbnail_doogee_s98_13_a40db6c495", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-13.jpg", "path": null, "size": 2.97, "width": 87, "height": 156}}	doogee_s98_13_a40db6c495	.jpg	image/jpeg	106.53	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_13_a40db6c495.jpg	\N	aws-s3	\N	2022-10-07 01:26:50.272	2022-10-07 01:26:50.272	1	1	/
19	doogee-s98-16.jpg	doogee-s98-16.jpg	doogee-s98-16.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_16_f14cd389cb.jpg", "hash": "large_doogee_s98_16_f14cd389cb", "mime": "image/jpeg", "name": "large_doogee-s98-16.jpg", "path": null, "size": 63.02, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_16_f14cd389cb.jpg", "hash": "small_doogee_s98_16_f14cd389cb", "mime": "image/jpeg", "name": "small_doogee-s98-16.jpg", "path": null, "size": 21.66, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_16_f14cd389cb.jpg", "hash": "medium_doogee_s98_16_f14cd389cb", "mime": "image/jpeg", "name": "medium_doogee-s98-16.jpg", "path": null, "size": 40.63, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_16_f14cd389cb.jpg", "hash": "thumbnail_doogee_s98_16_f14cd389cb", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-16.jpg", "path": null, "size": 3.21, "width": 87, "height": 156}}	doogee_s98_16_f14cd389cb	.jpg	image/jpeg	102.31	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_16_f14cd389cb.jpg	\N	aws-s3	\N	2022-10-07 01:33:18.182	2022-10-07 01:33:18.182	1	1	/
20	doogee-s98-18.jpg	doogee-s98-18.jpg	doogee-s98-18.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_18_d536b0bf91.jpg", "hash": "large_doogee_s98_18_d536b0bf91", "mime": "image/jpeg", "name": "large_doogee-s98-18.jpg", "path": null, "size": 64.71, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_18_d536b0bf91.jpg", "hash": "small_doogee_s98_18_d536b0bf91", "mime": "image/jpeg", "name": "small_doogee-s98-18.jpg", "path": null, "size": 21.04, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_18_d536b0bf91.jpg", "hash": "medium_doogee_s98_18_d536b0bf91", "mime": "image/jpeg", "name": "medium_doogee-s98-18.jpg", "path": null, "size": 41.22, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_18_d536b0bf91.jpg", "hash": "thumbnail_doogee_s98_18_d536b0bf91", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-18.jpg", "path": null, "size": 2.78, "width": 87, "height": 156}}	doogee_s98_18_d536b0bf91	.jpg	image/jpeg	105.83	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_18_d536b0bf91.jpg	\N	aws-s3	\N	2022-10-08 00:20:01.255	2022-10-08 00:20:01.255	1	1	/
21	doogee-s98-28.jpg	doogee-s98-28.jpg	doogee-s98-28.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_28_623ab949f9.jpg", "hash": "large_doogee_s98_28_623ab949f9", "mime": "image/jpeg", "name": "large_doogee-s98-28.jpg", "path": null, "size": 50.99, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_28_623ab949f9.jpg", "hash": "small_doogee_s98_28_623ab949f9", "mime": "image/jpeg", "name": "small_doogee-s98-28.jpg", "path": null, "size": 16.73, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_28_623ab949f9.jpg", "hash": "medium_doogee_s98_28_623ab949f9", "mime": "image/jpeg", "name": "medium_doogee-s98-28.jpg", "path": null, "size": 32.5, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_28_623ab949f9.jpg", "hash": "thumbnail_doogee_s98_28_623ab949f9", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-28.jpg", "path": null, "size": 2.44, "width": 87, "height": 156}}	doogee_s98_28_623ab949f9	.jpg	image/jpeg	83.96	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_28_623ab949f9.jpg	\N	aws-s3	\N	2022-11-30 22:49:12.73	2022-11-30 22:49:12.73	1	1	/
22	doogee-s98-25.jpg	doogee-s98-25.jpg	doogee-s98-25.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_25_fa15ed1c9d.jpg", "hash": "large_doogee_s98_25_fa15ed1c9d", "mime": "image/jpeg", "name": "large_doogee-s98-25.jpg", "path": null, "size": 89.11, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_25_fa15ed1c9d.jpg", "hash": "small_doogee_s98_25_fa15ed1c9d", "mime": "image/jpeg", "name": "small_doogee-s98-25.jpg", "path": null, "size": 26.8, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_25_fa15ed1c9d.jpg", "hash": "medium_doogee_s98_25_fa15ed1c9d", "mime": "image/jpeg", "name": "medium_doogee-s98-25.jpg", "path": null, "size": 54.6, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_25_fa15ed1c9d.jpg", "hash": "thumbnail_doogee_s98_25_fa15ed1c9d", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-25.jpg", "path": null, "size": 6.17, "width": 208, "height": 156}}	doogee_s98_25_fa15ed1c9d	.jpg	image/jpeg	1767.25	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_25_fa15ed1c9d.jpg	\N	aws-s3	\N	2022-12-10 02:51:00.062	2022-12-10 02:51:00.062	1	1	/
23	doogee-s98-33.jpg	doogee-s98-33.jpg	doogee-s98-33.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_33_a8b6a8b756.jpg", "hash": "large_doogee_s98_33_a8b6a8b756", "mime": "image/jpeg", "name": "large_doogee-s98-33.jpg", "path": null, "size": 85.07, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_33_a8b6a8b756.jpg", "hash": "small_doogee_s98_33_a8b6a8b756", "mime": "image/jpeg", "name": "small_doogee-s98-33.jpg", "path": null, "size": 26.16, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_33_a8b6a8b756.jpg", "hash": "medium_doogee_s98_33_a8b6a8b756", "mime": "image/jpeg", "name": "medium_doogee-s98-33.jpg", "path": null, "size": 52.65, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_33_a8b6a8b756.jpg", "hash": "thumbnail_doogee_s98_33_a8b6a8b756", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-33.jpg", "path": null, "size": 5.95, "width": 208, "height": 156}}	doogee_s98_33_a8b6a8b756	.jpg	image/jpeg	1513.33	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_33_a8b6a8b756.jpg	\N	aws-s3	\N	2022-12-15 05:40:13.762	2022-12-15 05:40:13.762	1	1	/
24	doogee-s97-pro-4.jpg	doogee-s97-pro-4.jpg	doogee-s97-pro-4.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s97_pro_4_e2c416a48a.jpg", "hash": "large_doogee_s97_pro_4_e2c416a48a", "mime": "image/jpeg", "name": "large_doogee-s97-pro-4.jpg", "path": null, "size": 80.9, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s97_pro_4_e2c416a48a.jpg", "hash": "small_doogee_s97_pro_4_e2c416a48a", "mime": "image/jpeg", "name": "small_doogee-s97-pro-4.jpg", "path": null, "size": 23.4, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s97_pro_4_e2c416a48a.jpg", "hash": "medium_doogee_s97_pro_4_e2c416a48a", "mime": "image/jpeg", "name": "medium_doogee-s97-pro-4.jpg", "path": null, "size": 49.12, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s97_pro_4_e2c416a48a.jpg", "hash": "thumbnail_doogee_s97_pro_4_e2c416a48a", "mime": "image/jpeg", "name": "thumbnail_doogee-s97-pro-4.jpg", "path": null, "size": 5.28, "width": 208, "height": 156}}	doogee_s97_pro_4_e2c416a48a	.jpg	image/jpeg	1740.32	https://e-leotronics-controle.s3.amazonaws.com/doogee_s97_pro_4_e2c416a48a.jpg	\N	aws-s3	\N	2022-12-15 05:41:30.497	2022-12-15 05:41:30.497	1	1	/
25	doogee-s97-pro-1.jpg	doogee-s97-pro-1.jpg	doogee-s97-pro-1.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s97_pro_1_54d208370b.jpg", "hash": "large_doogee_s97_pro_1_54d208370b", "mime": "image/jpeg", "name": "large_doogee-s97-pro-1.jpg", "path": null, "size": 76.36, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s97_pro_1_54d208370b.jpg", "hash": "small_doogee_s97_pro_1_54d208370b", "mime": "image/jpeg", "name": "small_doogee-s97-pro-1.jpg", "path": null, "size": 23.16, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s97_pro_1_54d208370b.jpg", "hash": "medium_doogee_s97_pro_1_54d208370b", "mime": "image/jpeg", "name": "medium_doogee-s97-pro-1.jpg", "path": null, "size": 46.8, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s97_pro_1_54d208370b.jpg", "hash": "thumbnail_doogee_s97_pro_1_54d208370b", "mime": "image/jpeg", "name": "thumbnail_doogee-s97-pro-1.jpg", "path": null, "size": 5.34, "width": 208, "height": 156}}	doogee_s97_pro_1_54d208370b	.jpg	image/jpeg	1497.88	https://e-leotronics-controle.s3.amazonaws.com/doogee_s97_pro_1_54d208370b.jpg	\N	aws-s3	\N	2022-12-16 01:20:29.433	2022-12-16 01:20:29.433	1	1	/
26	doogee-s97-pro-2.jpg	doogee-s97-pro-2.jpg	doogee-s97-pro-2.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s97_pro_2_9f3119e352.jpg", "hash": "large_doogee_s97_pro_2_9f3119e352", "mime": "image/jpeg", "name": "large_doogee-s97-pro-2.jpg", "path": null, "size": 75.91, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s97_pro_2_9f3119e352.jpg", "hash": "small_doogee_s97_pro_2_9f3119e352", "mime": "image/jpeg", "name": "small_doogee-s97-pro-2.jpg", "path": null, "size": 22.42, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s97_pro_2_9f3119e352.jpg", "hash": "medium_doogee_s97_pro_2_9f3119e352", "mime": "image/jpeg", "name": "medium_doogee-s97-pro-2.jpg", "path": null, "size": 45.89, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s97_pro_2_9f3119e352.jpg", "hash": "thumbnail_doogee_s97_pro_2_9f3119e352", "mime": "image/jpeg", "name": "thumbnail_doogee-s97-pro-2.jpg", "path": null, "size": 5.09, "width": 208, "height": 156}}	doogee_s97_pro_2_9f3119e352	.jpg	image/jpeg	1620.61	https://e-leotronics-controle.s3.amazonaws.com/doogee_s97_pro_2_9f3119e352.jpg	\N	aws-s3	\N	2022-12-16 01:21:13.728	2022-12-16 01:21:13.728	1	1	/
27	doogee-s97-pro-3.jpg	doogee-s97-pro-3.jpg	doogee-s97-pro-3.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s97_pro_3_81910f72c0.jpg", "hash": "large_doogee_s97_pro_3_81910f72c0", "mime": "image/jpeg", "name": "large_doogee-s97-pro-3.jpg", "path": null, "size": 81.95, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s97_pro_3_81910f72c0.jpg", "hash": "small_doogee_s97_pro_3_81910f72c0", "mime": "image/jpeg", "name": "small_doogee-s97-pro-3.jpg", "path": null, "size": 28.29, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s97_pro_3_81910f72c0.jpg", "hash": "medium_doogee_s97_pro_3_81910f72c0", "mime": "image/jpeg", "name": "medium_doogee-s97-pro-3.jpg", "path": null, "size": 53.23, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s97_pro_3_81910f72c0.jpg", "hash": "thumbnail_doogee_s97_pro_3_81910f72c0", "mime": "image/jpeg", "name": "thumbnail_doogee-s97-pro-3.jpg", "path": null, "size": 7.14, "width": 208, "height": 156}}	doogee_s97_pro_3_81910f72c0	.jpg	image/jpeg	1656.51	https://e-leotronics-controle.s3.amazonaws.com/doogee_s97_pro_3_81910f72c0.jpg	\N	aws-s3	\N	2022-12-16 01:22:59.62	2022-12-16 01:22:59.62	1	1	/
28	doogee-s98-26.jpg	doogee-s98-26.jpg	doogee-s98-26.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_26_42fb5cf813.jpg", "hash": "large_doogee_s98_26_42fb5cf813", "mime": "image/jpeg", "name": "large_doogee-s98-26.jpg", "path": null, "size": 88.79, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_26_42fb5cf813.jpg", "hash": "small_doogee_s98_26_42fb5cf813", "mime": "image/jpeg", "name": "small_doogee-s98-26.jpg", "path": null, "size": 29.04, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_26_42fb5cf813.jpg", "hash": "medium_doogee_s98_26_42fb5cf813", "mime": "image/jpeg", "name": "medium_doogee-s98-26.jpg", "path": null, "size": 56.8, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_26_42fb5cf813.jpg", "hash": "thumbnail_doogee_s98_26_42fb5cf813", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-26.jpg", "path": null, "size": 6.67, "width": 208, "height": 156}}	doogee_s98_26_42fb5cf813	.jpg	image/jpeg	1617.27	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_26_42fb5cf813.jpg	\N	aws-s3	\N	2022-12-16 01:26:16.01	2022-12-16 01:26:16.01	1	1	/
29	doogee-s98-27.jpg	doogee-s98-27.jpg	doogee-s98-27.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_27_cd746a6f6a.jpg", "hash": "large_doogee_s98_27_cd746a6f6a", "mime": "image/jpeg", "name": "large_doogee-s98-27.jpg", "path": null, "size": 85.86, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_27_cd746a6f6a.jpg", "hash": "small_doogee_s98_27_cd746a6f6a", "mime": "image/jpeg", "name": "small_doogee-s98-27.jpg", "path": null, "size": 25.54, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_27_cd746a6f6a.jpg", "hash": "medium_doogee_s98_27_cd746a6f6a", "mime": "image/jpeg", "name": "medium_doogee-s98-27.jpg", "path": null, "size": 53.02, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_27_cd746a6f6a.jpg", "hash": "thumbnail_doogee_s98_27_cd746a6f6a", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-27.jpg", "path": null, "size": 5.61, "width": 208, "height": 156}}	doogee_s98_27_cd746a6f6a	.jpg	image/jpeg	1512.34	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_27_cd746a6f6a.jpg	\N	aws-s3	\N	2022-12-16 01:27:26.28	2022-12-16 01:27:26.28	1	1	/
30	doogee-s97-pro-5.jpg	doogee-s97-pro-5.jpg	doogee-s97-pro-5.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s97_pro_5_3cc7c00aef.jpg", "hash": "large_doogee_s97_pro_5_3cc7c00aef", "mime": "image/jpeg", "name": "large_doogee-s97-pro-5.jpg", "path": null, "size": 84.44, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s97_pro_5_3cc7c00aef.jpg", "hash": "small_doogee_s97_pro_5_3cc7c00aef", "mime": "image/jpeg", "name": "small_doogee-s97-pro-5.jpg", "path": null, "size": 23.35, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s97_pro_5_3cc7c00aef.jpg", "hash": "medium_doogee_s97_pro_5_3cc7c00aef", "mime": "image/jpeg", "name": "medium_doogee-s97-pro-5.jpg", "path": null, "size": 49.67, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s97_pro_5_3cc7c00aef.jpg", "hash": "thumbnail_doogee_s97_pro_5_3cc7c00aef", "mime": "image/jpeg", "name": "thumbnail_doogee-s97-pro-5.jpg", "path": null, "size": 5.18, "width": 208, "height": 156}}	doogee_s97_pro_5_3cc7c00aef	.jpg	image/jpeg	1435.87	https://e-leotronics-controle.s3.amazonaws.com/doogee_s97_pro_5_3cc7c00aef.jpg	\N	aws-s3	\N	2022-12-17 19:37:46.869	2022-12-17 19:37:46.869	1	1	/
31	doogee-s98-30.jpg	doogee-s98-30.jpg	doogee-s98-30.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_30_f22146c3ae.jpg", "hash": "large_doogee_s98_30_f22146c3ae", "mime": "image/jpeg", "name": "large_doogee-s98-30.jpg", "path": null, "size": 100.07, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_30_f22146c3ae.jpg", "hash": "small_doogee_s98_30_f22146c3ae", "mime": "image/jpeg", "name": "small_doogee-s98-30.jpg", "path": null, "size": 32.72, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_30_f22146c3ae.jpg", "hash": "medium_doogee_s98_30_f22146c3ae", "mime": "image/jpeg", "name": "medium_doogee-s98-30.jpg", "path": null, "size": 64.33, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_30_f22146c3ae.jpg", "hash": "thumbnail_doogee_s98_30_f22146c3ae", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-30.jpg", "path": null, "size": 7.48, "width": 208, "height": 156}}	doogee_s98_30_f22146c3ae	.jpg	image/jpeg	1439.84	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_30_f22146c3ae.jpg	\N	aws-s3	\N	2022-12-17 19:40:08.491	2022-12-17 19:40:08.491	1	1	/
32	doogee-s98-31.jpg	doogee-s98-31.jpg	doogee-s98-31.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_31_9c43f1fb9c.jpg", "hash": "large_doogee_s98_31_9c43f1fb9c", "mime": "image/jpeg", "name": "large_doogee-s98-31.jpg", "path": null, "size": 84.87, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_31_9c43f1fb9c.jpg", "hash": "small_doogee_s98_31_9c43f1fb9c", "mime": "image/jpeg", "name": "small_doogee-s98-31.jpg", "path": null, "size": 24.92, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_31_9c43f1fb9c.jpg", "hash": "medium_doogee_s98_31_9c43f1fb9c", "mime": "image/jpeg", "name": "medium_doogee-s98-31.jpg", "path": null, "size": 51.94, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_31_9c43f1fb9c.jpg", "hash": "thumbnail_doogee_s98_31_9c43f1fb9c", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-31.jpg", "path": null, "size": 5.62, "width": 208, "height": 156}}	doogee_s98_31_9c43f1fb9c	.jpg	image/jpeg	1528.43	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_31_9c43f1fb9c.jpg	\N	aws-s3	\N	2022-12-17 19:41:02.019	2022-12-17 19:41:02.019	1	1	/
33	doogee-s98-34.jpg	doogee-s98-34.jpg	doogee-s98-34.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_34_7c7461dae2.jpg", "hash": "large_doogee_s98_34_7c7461dae2", "mime": "image/jpeg", "name": "large_doogee-s98-34.jpg", "path": null, "size": 55.81, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_34_7c7461dae2.jpg", "hash": "small_doogee_s98_34_7c7461dae2", "mime": "image/jpeg", "name": "small_doogee-s98-34.jpg", "path": null, "size": 18.03, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_34_7c7461dae2.jpg", "hash": "medium_doogee_s98_34_7c7461dae2", "mime": "image/jpeg", "name": "medium_doogee-s98-34.jpg", "path": null, "size": 35.75, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_34_7c7461dae2.jpg", "hash": "thumbnail_doogee_s98_34_7c7461dae2", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-34.jpg", "path": null, "size": 2.48, "width": 87, "height": 156}}	doogee_s98_34_7c7461dae2	.jpg	image/jpeg	91.49	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_34_7c7461dae2.jpg	\N	aws-s3	\N	2023-01-16 16:00:42.383	2023-01-16 16:00:42.383	1	1	/
34	doogee-s98-35.jpg	doogee-s98-35.jpg	doogee-s98-35.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_35_c42bc7ce3b.jpg", "hash": "large_doogee_s98_35_c42bc7ce3b", "mime": "image/jpeg", "name": "large_doogee-s98-35.jpg", "path": null, "size": 76.83, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_35_c42bc7ce3b.jpg", "hash": "small_doogee_s98_35_c42bc7ce3b", "mime": "image/jpeg", "name": "small_doogee-s98-35.jpg", "path": null, "size": 26.41, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_35_c42bc7ce3b.jpg", "hash": "medium_doogee_s98_35_c42bc7ce3b", "mime": "image/jpeg", "name": "medium_doogee-s98-35.jpg", "path": null, "size": 50.16, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_35_c42bc7ce3b.jpg", "hash": "thumbnail_doogee_s98_35_c42bc7ce3b", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-35.jpg", "path": null, "size": 3.49, "width": 87, "height": 156}}	doogee_s98_35_c42bc7ce3b	.jpg	image/jpeg	124.53	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_35_c42bc7ce3b.jpg	\N	aws-s3	\N	2023-01-20 22:55:44.622	2023-01-20 22:55:44.622	1	1	/
35	doogee-s98-36.jpg	doogee-s98-36.jpg	doogee-s98-36.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_36_773df20263.jpg", "hash": "large_doogee_s98_36_773df20263", "mime": "image/jpeg", "name": "large_doogee-s98-36.jpg", "path": null, "size": 70.65, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_36_773df20263.jpg", "hash": "small_doogee_s98_36_773df20263", "mime": "image/jpeg", "name": "small_doogee-s98-36.jpg", "path": null, "size": 23.55, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_36_773df20263.jpg", "hash": "medium_doogee_s98_36_773df20263", "mime": "image/jpeg", "name": "medium_doogee-s98-36.jpg", "path": null, "size": 45.91, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_36_773df20263.jpg", "hash": "thumbnail_doogee_s98_36_773df20263", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-36.jpg", "path": null, "size": 3.43, "width": 87, "height": 156}}	doogee_s98_36_773df20263	.jpg	image/jpeg	114.27	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_36_773df20263.jpg	\N	aws-s3	\N	2023-01-20 22:56:20.179	2023-01-20 22:56:20.179	1	1	/
36	doogee-s98-37.jpg	doogee-s98-37.jpg	doogee-s98-37.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_37_aa30d8c7d7.jpg", "hash": "large_doogee_s98_37_aa30d8c7d7", "mime": "image/jpeg", "name": "large_doogee-s98-37.jpg", "path": null, "size": 75.39, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_37_aa30d8c7d7.jpg", "hash": "small_doogee_s98_37_aa30d8c7d7", "mime": "image/jpeg", "name": "small_doogee-s98-37.jpg", "path": null, "size": 24.78, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_37_aa30d8c7d7.jpg", "hash": "medium_doogee_s98_37_aa30d8c7d7", "mime": "image/jpeg", "name": "medium_doogee-s98-37.jpg", "path": null, "size": 48.14, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_37_aa30d8c7d7.jpg", "hash": "thumbnail_doogee_s98_37_aa30d8c7d7", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-37.jpg", "path": null, "size": 3.49, "width": 87, "height": 156}}	doogee_s98_37_aa30d8c7d7	.jpg	image/jpeg	122.84	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_37_aa30d8c7d7.jpg	\N	aws-s3	\N	2023-01-24 00:44:38.967	2023-01-24 00:44:38.967	1	1	/
37	doogee-s98-40.jpg	doogee-s98-40.jpg	doogee-s98-40.jpg	900	1600	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_40_f66b99f1e5.jpg", "hash": "large_doogee_s98_40_f66b99f1e5", "mime": "image/jpeg", "name": "large_doogee-s98-40.jpg", "path": null, "size": 52.38, "width": 563, "height": 1000}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_40_f66b99f1e5.jpg", "hash": "small_doogee_s98_40_f66b99f1e5", "mime": "image/jpeg", "name": "small_doogee-s98-40.jpg", "path": null, "size": 17.58, "width": 281, "height": 500}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_40_f66b99f1e5.jpg", "hash": "medium_doogee_s98_40_f66b99f1e5", "mime": "image/jpeg", "name": "medium_doogee-s98-40.jpg", "path": null, "size": 33.79, "width": 422, "height": 750}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_40_f66b99f1e5.jpg", "hash": "thumbnail_doogee_s98_40_f66b99f1e5", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-40.jpg", "path": null, "size": 2.52, "width": 87, "height": 156}}	doogee_s98_40_f66b99f1e5	.jpg	image/jpeg	58.78	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_40_f66b99f1e5.jpg	\N	aws-s3	\N	2023-01-26 09:13:40.329	2023-01-26 09:13:40.329	1	1	/
38	doogee-s99-3.jpg	doogee-s99-3.jpg	doogee-s99-3.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s99_3_91982bf937.jpg", "hash": "large_doogee_s99_3_91982bf937", "mime": "image/jpeg", "name": "large_doogee-s99-3.jpg", "path": null, "size": 61.37, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s99_3_91982bf937.jpg", "hash": "small_doogee_s99_3_91982bf937", "mime": "image/jpeg", "name": "small_doogee-s99-3.jpg", "path": null, "size": 21.96, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s99_3_91982bf937.jpg", "hash": "medium_doogee_s99_3_91982bf937", "mime": "image/jpeg", "name": "medium_doogee-s99-3.jpg", "path": null, "size": 40.34, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s99_3_91982bf937.jpg", "hash": "thumbnail_doogee_s99_3_91982bf937", "mime": "image/jpeg", "name": "thumbnail_doogee-s99-3.jpg", "path": null, "size": 5.73, "width": 208, "height": 156}}	doogee_s99_3_91982bf937	.jpg	image/jpeg	1402.32	https://e-leotronics-controle.s3.amazonaws.com/doogee_s99_3_91982bf937.jpg	\N	aws-s3	\N	2023-01-31 16:13:19.17	2023-01-31 16:13:19.17	1	1	/
39	doogee-s98-41.jpg	doogee-s98-41.jpg	doogee-s98-41.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_41_d7ba4e88d1.jpg", "hash": "large_doogee_s98_41_d7ba4e88d1", "mime": "image/jpeg", "name": "large_doogee-s98-41.jpg", "path": null, "size": 68, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_41_d7ba4e88d1.jpg", "hash": "small_doogee_s98_41_d7ba4e88d1", "mime": "image/jpeg", "name": "small_doogee-s98-41.jpg", "path": null, "size": 23.49, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_41_d7ba4e88d1.jpg", "hash": "medium_doogee_s98_41_d7ba4e88d1", "mime": "image/jpeg", "name": "medium_doogee-s98-41.jpg", "path": null, "size": 43.45, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_41_d7ba4e88d1.jpg", "hash": "thumbnail_doogee_s98_41_d7ba4e88d1", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-41.jpg", "path": null, "size": 6.01, "width": 208, "height": 156}}	doogee_s98_41_d7ba4e88d1	.jpg	image/jpeg	1135.98	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_41_d7ba4e88d1.jpg	\N	aws-s3	\N	2023-01-31 16:15:51.588	2023-01-31 16:15:51.588	1	1	/
40	doogee-s98-39.jpg	doogee-s98-39.jpg	doogee-s98-39.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_39_4ebbbd724f.jpg", "hash": "large_doogee_s98_39_4ebbbd724f", "mime": "image/jpeg", "name": "large_doogee-s98-39.jpg", "path": null, "size": 52.58, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_39_4ebbbd724f.jpg", "hash": "small_doogee_s98_39_4ebbbd724f", "mime": "image/jpeg", "name": "small_doogee-s98-39.jpg", "path": null, "size": 18.82, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_39_4ebbbd724f.jpg", "hash": "medium_doogee_s98_39_4ebbbd724f", "mime": "image/jpeg", "name": "medium_doogee-s98-39.jpg", "path": null, "size": 34.54, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_39_4ebbbd724f.jpg", "hash": "thumbnail_doogee_s98_39_4ebbbd724f", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-39.jpg", "path": null, "size": 5.08, "width": 208, "height": 156}}	doogee_s98_39_4ebbbd724f	.jpg	image/jpeg	1085.22	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_39_4ebbbd724f.jpg	\N	aws-s3	\N	2023-01-31 16:20:49.971	2023-01-31 16:20:49.971	1	1	/
41	doogee-s98-42.jpg	doogee-s98-42.jpg	doogee-s98-42.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_42_940b14a865.jpg", "hash": "large_doogee_s98_42_940b14a865", "mime": "image/jpeg", "name": "large_doogee-s98-42.jpg", "path": null, "size": 60.1, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_42_940b14a865.jpg", "hash": "small_doogee_s98_42_940b14a865", "mime": "image/jpeg", "name": "small_doogee-s98-42.jpg", "path": null, "size": 19.73, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_42_940b14a865.jpg", "hash": "medium_doogee_s98_42_940b14a865", "mime": "image/jpeg", "name": "medium_doogee-s98-42.jpg", "path": null, "size": 38.63, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_42_940b14a865.jpg", "hash": "thumbnail_doogee_s98_42_940b14a865", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-42.jpg", "path": null, "size": 4.85, "width": 208, "height": 156}}	doogee_s98_42_940b14a865	.jpg	image/jpeg	1192.71	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_42_940b14a865.jpg	\N	aws-s3	\N	2023-01-31 16:22:50.176	2023-01-31 16:22:50.176	1	1	/
42	doogee-s99-2.jpg	doogee-s99-2.jpg	doogee-s99-2.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s99_2_96fcd342ad.jpg", "hash": "large_doogee_s99_2_96fcd342ad", "mime": "image/jpeg", "name": "large_doogee-s99-2.jpg", "path": null, "size": 73.92, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s99_2_96fcd342ad.jpg", "hash": "small_doogee_s99_2_96fcd342ad", "mime": "image/jpeg", "name": "small_doogee-s99-2.jpg", "path": null, "size": 26.32, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s99_2_96fcd342ad.jpg", "hash": "medium_doogee_s99_2_96fcd342ad", "mime": "image/jpeg", "name": "medium_doogee-s99-2.jpg", "path": null, "size": 49.09, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s99_2_96fcd342ad.jpg", "hash": "thumbnail_doogee_s99_2_96fcd342ad", "mime": "image/jpeg", "name": "thumbnail_doogee-s99-2.jpg", "path": null, "size": 6.76, "width": 208, "height": 156}}	doogee_s99_2_96fcd342ad	.jpg	image/jpeg	1561.03	https://e-leotronics-controle.s3.amazonaws.com/doogee_s99_2_96fcd342ad.jpg	\N	aws-s3	\N	2023-02-01 01:06:17.872	2023-02-01 01:06:17.872	1	1	/
43	doogee-s98-38.jpg	doogee-s98-38.jpg	doogee-s98-38.jpg	4624	3468	{"large": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/large_doogee_s98_38_0e1bae85d7.jpg", "hash": "large_doogee_s98_38_0e1bae85d7", "mime": "image/jpeg", "name": "large_doogee-s98-38.jpg", "path": null, "size": 59.86, "width": 1000, "height": 750}, "small": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/small_doogee_s98_38_0e1bae85d7.jpg", "hash": "small_doogee_s98_38_0e1bae85d7", "mime": "image/jpeg", "name": "small_doogee-s98-38.jpg", "path": null, "size": 22.11, "width": 500, "height": 375}, "medium": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/medium_doogee_s98_38_0e1bae85d7.jpg", "hash": "medium_doogee_s98_38_0e1bae85d7", "mime": "image/jpeg", "name": "medium_doogee-s98-38.jpg", "path": null, "size": 40, "width": 750, "height": 563}, "thumbnail": {"ext": ".jpg", "url": "https://e-leotronics-controle.s3.amazonaws.com/thumbnail_doogee_s98_38_0e1bae85d7.jpg", "hash": "thumbnail_doogee_s98_38_0e1bae85d7", "mime": "image/jpeg", "name": "thumbnail_doogee-s98-38.jpg", "path": null, "size": 5.95, "width": 208, "height": 156}}	doogee_s98_38_0e1bae85d7	.jpg	image/jpeg	1487.65	https://e-leotronics-controle.s3.amazonaws.com/doogee_s98_38_0e1bae85d7.jpg	\N	aws-s3	\N	2023-02-01 01:08:43.472	2023-02-01 01:08:43.472	1	1	/
\.


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_folder_links (file_id, folder_id, id, file_order) FROM stdin;
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files_related_morphs (file_id, related_id, related_type, field, "order", id) FROM stdin;
4	1	plugin::produtos.product	image	1	5
5	2	plugin::produtos.product	image	1	6
6	3	plugin::produtos.product	image	1	7
7	4	plugin::produtos.product	image	1	8
8	5	plugin::produtos.product	image	1	9
9	6	plugin::produtos.product	image	1	10
10	7	plugin::produtos.product	image	1	11
11	10	plugin::produtos.product	image	1	12
12	12	plugin::produtos.product	image	1	15
14	11	plugin::produtos.product	image	1	18
15	8	plugin::produtos.product	image	1	20
16	9	plugin::produtos.product	image	1	21
17	16	plugin::produtos.product	image	1	23
13	13	plugin::produtos.product	image	1	27
18	14	plugin::produtos.product	image	1	28
19	17	plugin::produtos.product	image	1	29
20	19	plugin::produtos.product	image	1	30
21	29	plugin::produtos.product	image	1	32
22	26	plugin::produtos.product	image	1	33
28	27	plugin::produtos.product	image	1	41
29	28	plugin::produtos.product	image	1	42
23	34	plugin::produtos.product	image	1	43
31	31	plugin::produtos.product	image	1	47
32	32	plugin::produtos.product	image	1	48
25	35	plugin::produtos.product	image	1	49
26	36	plugin::produtos.product	image	1	50
27	37	plugin::produtos.product	image	1	51
24	38	plugin::produtos.product	image	1	53
30	39	plugin::produtos.product	image	1	54
33	40	plugin::produtos.product	image	1	55
34	41	plugin::produtos.product	image	1	58
35	42	plugin::produtos.product	image	1	61
36	43	plugin::produtos.product	image	1	62
43	44	plugin::produtos.product	image	1	69
40	45	plugin::produtos.product	image	1	70
37	46	plugin::produtos.product	image	1	71
39	47	plugin::produtos.product	image	1	72
41	48	plugin::produtos.product	image	1	73
38	51	plugin::produtos.product	image	1	74
42	50	plugin::produtos.product	image	1	75
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2022-08-31 03:35:21.484	2022-08-31 03:35:21.484	\N	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, slug, email, local, price, tax, code, created_at, updated_at, created_by_id, updated_by_id, price_tax, name_receiver, delivered, name_buyer) FROM stdin;
1	1	1	eutojafui12@hotmail.com	Estacionamento	1286.1	t	LB546261791HK	2022-08-31 03:56:21.078	2022-09-21 16:59:23.706	1	1	\N	Vilma	t	Romis Ferrari Ferreira Da Costa
2	2	2	eutojaja312@hotmail.com	Minha Casa	1275.22	t	LB548206339HK 	2022-09-02 20:32:19.212	2022-09-21 17:00:14.406	1	1	\N	Léo	t	Adriano Nunes Da Silva
3	3	3	eutojafui18@hotmail.com	Estacionamento	1315.16	t	LB548198694HK	2022-09-02 20:33:09.284	2022-09-21 17:00:42.228	1	1	\N	Carlos	t	Rafael Alves
4	4	4	eutojafui19@hotmail.com	Estacionamento	1315.16	t	LB548201795HK	2022-09-02 20:33:45.899	2022-09-21 17:01:06.721	1	1	\N	Carlos	t	Daniele Tomaz
5	5	5	eutojafui22@hotmail.com	Minha Casa	1256.04	\N	LB549436421HK	2022-09-02 20:34:42.546	2022-09-21 17:01:27.605	1	1	\N	Léo	t	Arthur Bagatini
6	6	6	eutojafui24@hotmail.com	Minha Casa	1256.04	\N	LB549444034HK	2022-09-02 20:35:13.541	2022-09-21 17:01:41.062	1	1	\N	Léo	t	Diegoneves2013 Diegoneves2013
7	7	7	eutojafui27@hotmail.com	Fabrício	1256.04	\N	LB549431968HK	2022-09-02 20:35:45.585	2022-09-21 17:01:58.634	1	1	\N	Fabrício	t	Valeria Souza
10	10	10	eutojafui30@hotmail.com	Vinícius	1256.04	\N	LB549434669HK	2022-09-02 20:37:45.222	2022-09-21 17:02:23.01	1	1	\N	Vinícius	t	Flavio José Dionysio
9	9	9	eutojafui29@hotmail.com	Vinícius	1256.04	\N	LB549432963HK	2022-09-02 20:37:19.311	2022-09-26 02:15:45.713	1	1	\N	Vinícius	t	Ricardo Araujo Da Silva
12	12	12	eutojafui36@hotmail.com	Fabrício	1256.04	\N	LB549440488HK	2022-09-02 20:38:54.916	2022-09-22 01:27:54.304	1	1	\N	Fabrício	t	Marcos Dos Santos Holanda
11	11	11	eutojafui32@hotmail.com	Minha Casa	1256.04	\N	LB549441395HK	2022-09-02 20:38:33.692	2022-09-22 14:46:00.663	1	1	\N	Vilma	t	Ezequiel Zorzi
8	8	8	eutojafui28@hotmail.com	Fabrício	1256.04	\N	LB549431971HK	2022-09-02 20:36:27.201	2022-09-22 15:24:01.023	1	1	\N	Fabrício	t	Marcoshemi426 Marcoshemi426
22	21	21	eutojafui58@hotmail.com	Vinícius	1180.27	\N	LB552307775HK	2022-09-23 20:41:10.382	2022-11-13 03:44:39.149	1	1	\N	Vinícius	t	-
23	22	22	eutojafui59@hotmail.com	Vinícius	1180.27	\N	LB552313232HK	2022-09-23 20:41:32.82	2022-11-13 03:44:52.978	1	1	\N	Vinícius	t	-
24	23	23	eutojafui60@hotmail.com	Fabrício	1180.27	\N	LB552306673HK	2022-09-23 20:41:55.353	2022-11-13 03:45:08.82	1	1	\N	Fabrício	t	-
16	15	15	eutojafui49@hotmail.com	Minha Casa	1152.34	\N	LB552309581HK	2022-09-23 20:38:33.167	2022-10-07 01:24:15.153	1	1	\N	Vilma	t	Denilson Marquezini
15	14	14	eutojafui47@hotmail.com	Minha Casa	1180.06	\N	LB552311333HK	2022-09-23 20:37:55.431	2022-11-13 03:43:20.396	1	1	\N	Léo	t	-
18	17	17	eutojafui53@hotmail.com	Estacionamento	1150.16	\N	LB552315202HK	2022-09-23 20:39:28.992	2022-11-13 03:43:39.61	1	1	\N	Carlos	t	-
20	19	19	eutojafui56@hotmail.com	Fabrício	1143.61	\N	LB552309578HK	2022-09-23 20:40:19.97	2022-11-13 03:44:23.312	1	1	\N	Fabrício	t	-
13	1	1-1	eutojafui10@hotmail.com	Estacionamento	1947.89	\N	LB547573570HK	2022-09-04 05:59:17.245	2022-11-14 05:06:31.44	1	1	\N	Carlos	t	Mastertek Comercio
14	13	13	eutojafui46@hotmail.com	Minha Casa	1180.06	\N	LB552317075HK	2022-09-23 20:21:46.862	2022-11-14 05:11:12.531	1	1	\N	Léo	t	-
17	16	16	eutojafui51@hotmail.com	Estacionamento	1152.34	\N	LB552318067HK	2022-09-23 20:39:00.982	2022-11-14 05:11:30.457	1	1	\N	Carlos	t	-
19	18	18	eutojafui55@hotmail.com	Estacionamento	1183.08	\N	LB552098318HK	2022-09-23 20:39:55.59	2022-11-14 05:11:49.46	1	1	\N	Carlos	t	-
21	20	20	eutojafui57@hotmail.com	Fabrício	1196.21	\N	LB552306687HK	2022-09-23 20:40:41.873	2022-11-14 05:12:05.223	1	1	\N	Fabrício	t	-
25	24	24	eutojafui61@hotmail.com	Vinícius	1189.28	\N	LB552399940HK	2022-09-23 20:42:18.29	2022-11-14 05:12:28.158	1	1	\N	Vinícius	t	-
29	28	28	eutojafui56@hotmail.com	Fabrício	1099.42	\N	LB556196620HK	2022-11-13 03:54:26.234	2022-11-30 22:50:33.273	1	1	\N	Fabrício	t	Lindomar Ricas Gomes
33	32	32	eutojafui30@hotmail.com	Vo	1130.57	\N	LB556697440HK	2022-11-13 04:07:16.062	2023-01-13 22:25:23.791	1	1	\N	Vo	t	-
27	26	26	eutojafui80@hotmail.com	Minha Casa	1099.42	\N	LB556191959HK	2022-11-13 03:53:22.46	2022-12-16 01:30:02.988	1	1	\N	Vilma	t	Leandro Tonetti Seta De Almeida
28	27	27	eutojafui18@hotmail.com	Estacionamento	1099.42	\N	LB556196616HK	2022-11-13 03:53:54.579	2022-12-16 01:30:43.587	1	1	\N	Carlos	t	Claudeomiro Soligo
26	25	25	eutojaja510@hotmail.com	Minha Casa	1143.03	\N	LB556203232HK	2022-11-13 03:50:55.143	2022-12-10 02:51:24.249	1	1	\N	Léo	t	Francisco Alencar
34	33	33	eutojafui61@hotmail.com	Vo	1130.57	\N	LB556703220HK	2022-11-13 04:07:42.014	2022-12-16 01:31:27.891	1	1	\N	Vo	t	Marcelo Gordo
39	5	5-1	eutojafui72@hotmail.com	Camila	893.13	\N	LB556910125HK	2022-11-14 17:03:43.87	2023-01-16 16:02:20.829	1	1	\N	Camila	t	Vera Lucia Gonçalves Gonçalves
40	34	34	eutojafui30@hotmail.com	Vo	1022.86	\N	LB560758216HK	2022-12-16 17:40:22.398	2023-01-16 16:02:49.691	1	1	\N	Vo	t	Rodrigo Sparemberger
35	1	1-2	eutojaja312@hotmail.com	Minha Casa	863.94	\N	LB557470963HK	2022-11-14 17:01:37.678	2022-12-30 00:12:30.613	1	1	\N	Léo	t	Lucas Edson Alberguine
36	2	2-1	eutojaja316@hotmail.com	Minha Casa	863.94	\N	LB557473766HK	2022-11-14 17:02:06.255	2022-12-30 17:34:03.141	1	1	\N	Vilma	t	Edinea Somensi
37	3	3-1	eutojafui19@hotmail.com	Estacionamento	863.94	\N	LB557478508HK	2022-11-14 17:02:42.368	2022-12-30 17:34:22.254	1	1	\N	Carlos	t	Natalya Nobrega
31	30	30	eutojafui59@hotmail.com	Camila	1152.61	\N	LB556694797HK	2022-11-13 04:06:09.203	2022-12-19 23:52:55.592	1	1	\N	Camila	t	Victor Alexandre Goetzinger
32	31	31	eutojafu90@hotmail.com	Camila	1152.61	\N	LB556688981HK	2022-11-13 04:06:43.951	2022-12-20 06:09:04.873	1	1	\N	Carol	t	Jardel Machado Da Silva
43	37	37	eutojafui210@hotmail.com	Estacionamento	1003.72	\N	LB561421941HK	2022-12-29 22:56:08.484	2023-01-31 00:53:07.226	1	1	\N	Carlos	t	Joao Carlos Hugen M
38	4	4-1	eutojafui59@hotmail.com	Vo	863.94	\N	LB557485027HK	2022-11-14 17:03:13.236	2023-01-16 16:01:58.63	1	1	\N	Vo	t	Sheila Machado
45	39	39	eutojafui213@hotmail.com	Estacionamento	1015.24	\N	LB561584627HK	2023-01-03 01:41:12.596	2023-02-01 16:58:42.865	1	1	\N	Carol	t	Aurelho Frota
44	38	38	eutojafui211@hotmail.com	Fabrício	1003.72	\N	LB561418995HK	2022-12-29 22:56:36.076	2023-02-01 16:58:25.975	1	1	\N	Fabrício	t	Crisdtiane Aparecida De Souza Santos
41	35	35	eutojafui207@hotmail.com	Minha Casa	1003.72	\N	LB561424497HK	2022-12-29 22:55:12.99	2023-01-24 00:43:58.051	1	1	\N	Léo	t	Daniel Gomes Acunha
42	36	36	eutojafui208@hotmail.com	Minha Casa	1003.72	\N	LB561432140HK	2022-12-29 22:55:41.089	2023-01-30 17:55:54.512	1	1	\N	Vilma	t	 Juliana Silva Silva
46	40	40	eutojafui214@hotmail.com	Vo	1015.24	\N	LB561581648HK	2023-01-03 01:41:40.478	2023-02-02 19:34:59.311	1	1	\N	Vo	t	Endelson Luiz Barp
47	41	41	eutojafui219@hotmail.com	Minha Casa	1015	\N	LB561746191HK	2023-01-05 17:23:54.674	2023-02-06 16:08:52.371	1	1	\N	Léo	t	Marco Antonio Tallavasso Vassovinio
48	42	42	eutojafui218@hotmail.com	Minha Casa	1015	\N	LB561736747HK	2023-01-05 17:25:27.014	2023-02-09 01:44:54.319	1	1	\N	Vilma	t	Ivan Anderson Pereira Colet
51	3	3-2	eutojafui64@hotmail.com	Minha Casa	859.92	\N	LB561827227HK	2023-01-07 17:56:47.444	2023-02-20 07:47:06.234	1	1	\N	Camila	t	Mae
50	2	2-2	eutojaja334@hotmail.com	Fabrício	859.92	\N	LB561821357HK	2023-01-07 17:56:01.208	2023-02-21 19:28:01.747	1	1	\N	Fabrício	t	Dirceu Rebechi
49	1	1-3	eutojaja381@hotmail.com	Minha Casa	861.94	\N	LB561935252HK	2023-01-07 17:55:23.04	2023-02-20 07:47:59.978	1	1	\N	Carol	t	Angelica Vicente Pereira Nascimento
53	3	3-3	eutojafui235@hotmail.com	Minha Casa	3716.92	\N	LB564430094HK	2023-02-10 06:48:42.17	2023-02-23 15:38:30.532	1	1	\N	Vilma	t	\N
54	43	43	eutojafui215@hotmail.com	Vo	1142.64	\N	LB565129209HK	2023-02-17 18:17:24.883	2023-02-24 16:22:29.442	1	1	\N	Vo	\N	\N
55	44	44	eutojafui220@hotmail.com	Estacionamento	1142.64	\N	LB565119612HK	2023-02-17 18:18:01.858	2023-02-24 16:22:40.844	1	1	\N	Carlos	\N	\N
56	45	45	eutojafui221@hotmail.com	Minha Casa	1142.64	\N	LB565118634HK	2023-02-17 18:18:31.311	2023-02-24 16:22:51.309	1	1	\N	Léo	\N	\N
57	46	46	eutojafui222@hotmail.com	Minha Casa	1142.64	\N	LB565118625HK	2023-02-17 18:18:59.902	2023-02-24 16:23:01.601	1	1	\N	Vilma	\N	\N
58	47	47	eutojafui224@hotmail.com	Estacionamento	1142.64	\N	LB565122571HK	2023-02-17 18:19:23.845	2023-02-24 16:23:12.818	1	1	\N	Carol	\N	\N
59	48	48	eutojafui225@hotmail.com	Fabrício	1142.64	\N	LB565130238HK	2023-02-17 18:19:47.617	2023-02-24 16:23:23.124	1	1	\N	Fabrício	\N	\N
60	49	49	eutojafui226@hotmail.com	Vo	1142.64	\N	LB565126352HK	2023-02-17 18:20:13.177	2023-02-24 16:23:31.614	1	1	\N	Vo	\N	\N
61	50	50	eutojafui228@hotmail.com	Vo	1142.64	\N	LB565123577HK	2023-02-17 18:20:43.742	2023-02-24 16:23:42.253	1	1	\N	Vo	\N	\N
62	51	51	eutojafui230@hotmail.com	Estacionamento	1142.64	\N	LB565126349HK	2023-02-17 18:21:51.461	2023-02-24 16:23:51.33	1	1	\N	Carlos	\N	\N
63	52	52	eutojafui231@hotmail.com	Vo	1142.64	\N	LB565129190HK	2023-02-17 18:22:19.043	2023-02-24 16:24:00.628	1	1	\N	Vo	\N	\N
64	53	53	eutojafui232@hotmail.com	Minha Casa	1142.64	\N	LB565119609HK	2023-02-17 18:22:49.45	2023-02-24 16:24:10.207	1	1	\N	Camila	\N	\N
52	2	2-3	eutojafui234@hotmail.com	Minha Casa	3716.92	\N	LB564426378HK	2023-02-10 06:46:55.74	2023-02-25 17:45:50.127	1	1	\N	Léo	t	Angelica Carvalho
\.


--
-- Data for Name: products_category_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category_links (product_id, category_id, id, product_order) FROM stdin;
1	1	26	\N
2	1	27	\N
3	1	28	\N
4	1	29	\N
5	1	30	\N
6	1	31	\N
7	1	32	\N
10	1	33	\N
12	1	36	\N
11	1	39	\N
8	1	41	\N
9	1	58	\N
16	1	60	\N
15	1	64	\N
18	1	65	\N
20	1	66	\N
22	1	67	\N
23	1	68	\N
24	1	69	\N
13	2	79	\N
14	1	80	\N
17	1	81	\N
19	1	82	\N
21	1	83	\N
25	1	84	\N
29	1	91	\N
26	1	92	\N
27	1	100	\N
28	1	101	\N
34	1	102	\N
31	1	107	\N
32	1	108	\N
35	3	114	\N
36	3	115	\N
37	3	116	\N
49	4	122	\N
33	1	125	\N
38	3	127	\N
39	3	128	\N
40	1	129	\N
41	1	132	\N
42	1	135	\N
43	1	136	\N
51	4	137	\N
50	4	141	\N
44	1	143	\N
45	1	144	\N
46	1	145	\N
47	1	146	\N
48	1	147	\N
52	5	148	1
53	5	149	2
54	1	150	1
55	1	151	2
56	1	152	3
57	1	153	4
58	1	154	5
59	1	155	6
60	1	156	7
61	1	157	8
62	1	158	9
63	1	159	10
64	1	160	11
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, created_at, updated_at, created_by_id, updated_by_id, last_used_at, expires_at, lifespan) FROM stdin;
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
17	plugin_i18n_default_locale	"en"	string	\N	\N
4	plugin_content_manager_configuration_content_types::admin::role	{"uid":"admin::role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]}}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::api-token	{"uid":"admin::api-token","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::user	{"uid":"admin::user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"resetPasswordToken","size":6}],[{"name":"registrationToken","size":6},{"name":"isActive","size":4}],[{"name":"blocked","size":4},{"name":"preferedLanguage","size":6}],[{"name":"roles","size":6}]]}}	object	\N	\N
12	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
14	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"}}	object	\N	\N
15	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But donÔÇÖt worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
16	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::upload.file	{"uid":"plugin::upload.file","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folderPath","size":6},{"name":"folder","size":6}]]}}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"uid":"plugin::i18n.locale","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]}}	object	\N	\N
27	plugin_content_manager_configuration_content_types::api::teste2.teste2	{"uid":"api::teste2.teste2","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"testes":{"edit":{"label":"testes","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"testes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","createdAt","updatedAt"],"edit":[[{"name":"name","size":6},{"name":"testes","size":6}]]}}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"registrationToken":{"type":"string","configurable":false,"private":true},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"api::teste.teste":{"kind":"collectionType","collectionName":"testes","info":{"singularName":"teste","pluralName":"testes","displayName":"teste","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"teste_2s":{"type":"relation","relation":"manyToMany","target":"api::teste2.teste2","inversedBy":"testes"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"testes","info":{"singularName":"teste","pluralName":"testes","displayName":"teste","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"teste_2s":{"type":"relation","relation":"manyToMany","target":"api::teste2.teste2","inversedBy":"testes"}},"kind":"collectionType"},"modelType":"contentType","modelName":"teste","connection":"default","uid":"api::teste.teste","apiName":"teste","globalId":"Teste","actions":{},"lifecycles":{}},"api::teste2.teste2":{"kind":"collectionType","collectionName":"teste2s","info":{"singularName":"teste2","pluralName":"teste2s","displayName":"teste2"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"testes":{"type":"relation","relation":"manyToMany","target":"api::teste.teste","inversedBy":"teste_2s"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"teste2s","info":{"singularName":"teste2","pluralName":"teste2s","displayName":"teste2"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string"},"testes":{"type":"relation","relation":"manyToMany","target":"api::teste.teste","inversedBy":"teste_2s"}},"kind":"collectionType"},"modelType":"contentType","modelName":"teste2","connection":"default","uid":"api::teste2.teste2","apiName":"teste2","globalId":"Teste2","actions":{},"lifecycles":{}},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::produtos.category":{"kind":"collectionType","collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":true},"content-type-builder":{"visible":true}},"attributes":{"name":{"type":"string","required":true},"slug":{"type":"uid","targetField":"name","required":true},"products":{"type":"relation","relation":"oneToMany","target":"plugin::produtos.product","mappedBy":"category"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__filename__":"schema.json","__schema__":{"collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"Category"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":true},"content-type-builder":{"visible":true}},"attributes":{"name":{"type":"string","required":true},"slug":{"type":"uid","targetField":"name","required":true},"products":{"type":"relation","relation":"oneToMany","target":"plugin::produtos.product","mappedBy":"category"}},"kind":"collectionType"},"modelType":"contentType","modelName":"category","connection":"default","uid":"plugin::produtos.category","plugin":"produtos","globalId":"ProdutosCategory"},"plugin::produtos.product":{"kind":"collectionType","collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":true},"content-type-builder":{"visible":true}},"attributes":{"name":{"type":"string","required":true},"slug":{"type":"uid","targetField":"name"},"email":{"type":"email","required":true},"local":{"type":"enumeration","enum":["Correios","Minha Casa","Estacionamento","Fabrício","Vinícius","Camila","Vo"],"required":true},"price":{"type":"float","required":true},"tax":{"type":"boolean","required":false},"code":{"type":"string","required":true,"regex":"^[a-zA-Z0-9]*$"},"category":{"type":"relation","relation":"manyToOne","target":"plugin::produtos.category","inversedBy":"products"},"image":{"type":"media","multiple":true,"required":false,"allowedTypes":["images"]},"priceTax":{"type":"decimal"},"nameReceiver":{"type":"enumeration","enum":["Léo","Vilma","Carlos","Carol","Fabrício","Vinícius","Camila","Vo"],"required":true},"delivered":{"type":"boolean","required":false},"nameBuyer":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__filename__":"schema.json","__schema__":{"collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"Product","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":true},"content-type-builder":{"visible":true}},"attributes":{"name":{"type":"string","required":true},"slug":{"type":"uid","targetField":"name"},"email":{"type":"email","required":true},"local":{"type":"enumeration","enum":["Correios","Minha Casa","Estacionamento","Fabrício","Vinícius","Camila","Vo"],"required":true},"price":{"type":"float","required":true},"tax":{"type":"boolean","required":false},"code":{"type":"string","required":true,"regex":"^[a-zA-Z0-9]*$"},"category":{"type":"relation","relation":"manyToOne","target":"plugin::produtos.category","inversedBy":"products"},"image":{"type":"media","multiple":true,"required":false,"allowedTypes":["images"]},"priceTax":{"type":"decimal"},"nameReceiver":{"type":"enumeration","enum":["Léo","Vilma","Carlos","Carol","Fabrício","Vinícius","Camila","Vo"],"required":true},"delivered":{"type":"boolean","required":false},"nameBuyer":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"product","connection":"default","uid":"plugin::produtos.product","plugin":"produtos","globalId":"ProdutosProduct"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false,"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true},"resetPasswordToken":{"type":"string","configurable":false,"private":true},"confirmationToken":{"type":"string","configurable":false,"private":true},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"}}	object	\N	\N
31	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"uid":"admin::api-token-permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]}}	object	\N	\N
30	plugin_content_manager_configuration_content_types::plugin::produtos.product	{"uid":"plugin::produtos.product","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"local":{"edit":{"label":"local","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"local","searchable":true,"sortable":true}},"price":{"edit":{"label":"price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price","searchable":true,"sortable":true}},"tax":{"edit":{"label":"tax","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"tax","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"category":{"edit":{"label":"category","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"category","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"priceTax":{"edit":{"label":"priceTax","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"priceTax","searchable":true,"sortable":true}},"nameReceiver":{"edit":{"label":"nameReceiver","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nameReceiver","searchable":true,"sortable":true}},"delivered":{"edit":{"label":"delivered","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"delivered","searchable":true,"sortable":true}},"nameBuyer":{"edit":{"label":"nameBuyer","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"nameBuyer","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","email"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"email","size":6},{"name":"local","size":6}],[{"name":"price","size":4},{"name":"tax","size":4}],[{"name":"code","size":6},{"name":"image","size":6}],[{"name":"priceTax","size":4},{"name":"nameReceiver","size":6}],[{"name":"delivered","size":4},{"name":"nameBuyer","size":6}],[{"name":"category","size":6}]]}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"uid":"plugin::users-permissions.user","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]}}	object	\N	\N
26	plugin_content_manager_configuration_content_types::api::teste.teste	{"uid":"api::teste.teste","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"teste_2s":{"edit":{"label":"teste_2s","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"teste_2s","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","createdAt","updatedAt"],"edit":[[{"name":"name","size":6},{"name":"teste_2s","size":6}]]}}	object	\N	\N
18	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null}}	object	\N	\N
13	plugin_upload_metrics	{"weeklySchedule":"57 46 23 * * 6","lastWeeklyUpdate":1677368817239}	object	\N	\N
2	plugin_content_manager_configuration_content_types::admin::permission	{"uid":"admin::permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6},{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]}}	object	\N	\N
29	plugin_content_manager_configuration_content_types::plugin::produtos.category	{"uid":"plugin::produtos.category","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"products","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","products"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"products","size":6}]]}}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"uid":"plugin::users-permissions.permission","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]}}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"uid":"plugin::users-permissions.role","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]}}	object	\N	\N
32	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
21	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"uid":"plugin::upload.folder","settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"path","size":6},{"name":"parent","size":6}],[{"name":"children","size":6},{"name":"files","size":6}]]}}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
33	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"testes","indexes":[{"name":"testes_created_by_id_fk","columns":["created_by_id"]},{"name":"testes_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"testes_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"testes_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"teste2s","indexes":[{"name":"teste2s_created_by_id_fk","columns":["created_by_id"]},{"name":"teste2s_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"teste2s_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"teste2s_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories","indexes":[{"type":"unique","name":"categories_slug_unique","columns":["slug"]},{"name":"categories_created_by_id_fk","columns":["created_by_id"]},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products","indexes":[{"type":"unique","name":"products_slug_unique","columns":["slug"]},{"name":"products_created_by_id_fk","columns":["created_by_id"]},{"name":"products_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"products_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"products_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"local","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tax","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price_tax","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name_receiver","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"delivered","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name_buyer","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"testes_teste_2_s_links","indexes":[{"name":"testes_teste_2_s_links_fk","columns":["teste_id"]},{"name":"testes_teste_2_s_links_inv_fk","columns":["teste_2_id"]},{"name":"testes_teste_2_s_links_unique","columns":["teste_id","teste_2_id"],"type":"unique"},{"name":"testes_teste_2_s_links_order_fk","columns":["teste_2_order"]},{"name":"testes_teste_2_s_links_order_inv_fk","columns":["teste_order"]}],"foreignKeys":[{"name":"testes_teste_2_s_links_fk","columns":["teste_id"],"referencedColumns":["id"],"referencedTable":"testes","onDelete":"CASCADE"},{"name":"testes_teste_2_s_links_inv_fk","columns":["teste_2_id"],"referencedColumns":["id"],"referencedTable":"teste2s","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"teste_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"teste_2_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"teste_2_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"teste_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"teste_2_s_testes_links","indexes":[{"name":"teste_2_s_testes_links_fk","columns":["teste_2_id"]},{"name":"teste_2_s_testes_links_inv_fk","columns":["teste_id"]},{"name":"teste_2_s_testes_links_unique","columns":["teste_2_id","teste_id"],"type":"unique"},{"name":"teste_2_s_testes_links_order_fk","columns":["teste_order"]},{"name":"teste_2_s_testes_links_order_inv_fk","columns":["teste_2_order"]}],"foreignKeys":[{"name":"teste_2_s_testes_links_fk","columns":["teste_2_id"],"referencedColumns":["id"],"referencedTable":"teste2s","onDelete":"CASCADE"},{"name":"teste_2_s_testes_links_inv_fk","columns":["teste_id"],"referencedColumns":["id"],"referencedTable":"testes","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"teste_2_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"teste_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"teste_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"teste_2_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_category_links","indexes":[{"name":"products_category_links_fk","columns":["product_id"]},{"name":"products_category_links_inv_fk","columns":["category_id"]},{"name":"products_category_links_unique","columns":["product_id","category_id"],"type":"unique"},{"name":"products_category_links_order_inv_fk","columns":["product_order"]}],"foreignKeys":[{"name":"products_category_links_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_category_links_inv_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2023-02-09 22:45:21.156	58f6e7c149e63a8faeee5e1de64eff1e
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: teste2s; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teste2s (id, name, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	b	2022-09-04 18:28:57.092	2022-09-04 18:28:58.828	2022-09-04 18:28:58.826	1	1
\.


--
-- Data for Name: teste_2_s_testes_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teste_2_s_testes_links (teste_2_id, teste_id, id, teste_order, teste_2_order) FROM stdin;
1	1	1	\N	\N
\.


--
-- Data for Name: testes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testes (id, name, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
1	a	2022-09-04 18:28:50.65	2022-09-04 18:29:02.037	2022-09-04 18:29:02.035	1	1
\.


--
-- Data for Name: testes_teste_2_s_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.testes_teste_2_s_links (teste_id, teste_2_id, id, teste_2_order, teste_order) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	plugin::users-permissions.user.me	2022-08-31 03:35:21.458	2022-08-31 03:35:21.458	\N	\N
3	plugin::users-permissions.auth.callback	2022-08-31 03:35:21.467	2022-08-31 03:35:21.467	\N	\N
4	plugin::users-permissions.auth.connect	2022-08-31 03:35:21.467	2022-08-31 03:35:21.467	\N	\N
5	plugin::users-permissions.auth.forgotPassword	2022-08-31 03:35:21.467	2022-08-31 03:35:21.467	\N	\N
6	plugin::users-permissions.auth.resetPassword	2022-08-31 03:35:21.467	2022-08-31 03:35:21.467	\N	\N
7	plugin::users-permissions.auth.register	2022-08-31 03:35:21.467	2022-08-31 03:35:21.467	\N	\N
8	plugin::users-permissions.auth.emailConfirmation	2022-08-31 03:35:21.467	2022-08-31 03:35:21.467	\N	\N
9	plugin::users-permissions.auth.sendEmailConfirmation	2022-08-31 03:35:21.467	2022-08-31 03:35:21.467	\N	\N
20	api::teste.teste.find	2022-09-04 18:29:22.454	2022-09-04 18:29:22.454	\N	\N
21	api::teste2.teste2.find	2022-09-04 18:29:22.454	2022-09-04 18:29:22.454	\N	\N
22	api::teste.teste.findOne	2022-09-04 18:34:54	2022-09-04 18:34:54	\N	\N
23	api::teste2.teste2.findOne	2022-09-04 18:34:54	2022-09-04 18:34:54	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_permissions_role_links (permission_id, role_id, id, permission_order) FROM stdin;
1	1	1	\N
3	2	2	\N
4	2	3	\N
5	2	4	\N
6	2	5	\N
7	2	6	\N
8	2	7	\N
9	2	8	\N
20	2	9	\N
21	2	10	\N
22	2	11	\N
23	2	12	\N
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Authenticated	Default role given to authenticated user.	authenticated	2022-08-31 03:35:21.445	2022-08-31 03:35:21.445	\N	\N
2	Public	Default role given to unauthenticated user.	public	2022-08-31 03:35:21.451	2022-09-04 18:35:50.131	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.up_users_role_links (user_id, role_id, id, user_order) FROM stdin;
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.upload_folders_parent_links (folder_id, inv_folder_id, id, folder_order) FROM stdin;
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 156, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 92, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 2, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 2, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 1, false);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 43, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 75, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: products_category_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_links_id_seq', 160, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 64, true);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 32, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 33, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: teste2s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teste2s_id_seq', 1, true);


--
-- Name: teste_2_s_testes_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teste_2_s_testes_links_id_seq', 1, true);


--
-- Name: testes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.testes_id_seq', 1, true);


--
-- Name: testes_teste_2_s_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.testes_teste_2_s_links_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 23, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 12, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 2, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_id_seq', 1, false);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 1, false);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, false);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: categories categories_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_unique UNIQUE (slug);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: products_category_links products_category_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links
    ADD CONSTRAINT products_category_links_pkey PRIMARY KEY (id);


--
-- Name: products_category_links products_category_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links
    ADD CONSTRAINT products_category_links_unique UNIQUE (product_id, category_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_slug_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_unique UNIQUE (slug);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: teste2s teste2s_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste2s
    ADD CONSTRAINT teste2s_pkey PRIMARY KEY (id);


--
-- Name: teste_2_s_testes_links teste_2_s_testes_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste_2_s_testes_links
    ADD CONSTRAINT teste_2_s_testes_links_pkey PRIMARY KEY (id);


--
-- Name: teste_2_s_testes_links teste_2_s_testes_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste_2_s_testes_links
    ADD CONSTRAINT teste_2_s_testes_links_unique UNIQUE (teste_2_id, teste_id);


--
-- Name: testes testes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes
    ADD CONSTRAINT testes_pkey PRIMARY KEY (id);


--
-- Name: testes_teste_2_s_links testes_teste_2_s_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes_teste_2_s_links
    ADD CONSTRAINT testes_teste_2_s_links_pkey PRIMARY KEY (id);


--
-- Name: testes_teste_2_s_links testes_teste_2_s_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes_teste_2_s_links
    ADD CONSTRAINT testes_teste_2_s_links_unique UNIQUE (teste_id, teste_2_id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_created_by_id_fk ON public.categories USING btree (created_by_id);


--
-- Name: categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX categories_updated_by_id_fk ON public.categories USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: products_category_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_links_fk ON public.products_category_links USING btree (product_id);


--
-- Name: products_category_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_links_inv_fk ON public.products_category_links USING btree (category_id);


--
-- Name: products_category_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_category_links_order_inv_fk ON public.products_category_links USING btree (product_order);


--
-- Name: products_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_created_by_id_fk ON public.products USING btree (created_by_id);


--
-- Name: products_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_updated_by_id_fk ON public.products USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: teste2s_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teste2s_created_by_id_fk ON public.teste2s USING btree (created_by_id);


--
-- Name: teste2s_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teste2s_updated_by_id_fk ON public.teste2s USING btree (updated_by_id);


--
-- Name: teste_2_s_testes_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teste_2_s_testes_links_fk ON public.teste_2_s_testes_links USING btree (teste_2_id);


--
-- Name: teste_2_s_testes_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teste_2_s_testes_links_inv_fk ON public.teste_2_s_testes_links USING btree (teste_id);


--
-- Name: teste_2_s_testes_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teste_2_s_testes_links_order_fk ON public.teste_2_s_testes_links USING btree (teste_order);


--
-- Name: teste_2_s_testes_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX teste_2_s_testes_links_order_inv_fk ON public.teste_2_s_testes_links USING btree (teste_2_order);


--
-- Name: testes_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX testes_created_by_id_fk ON public.testes USING btree (created_by_id);


--
-- Name: testes_teste_2_s_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX testes_teste_2_s_links_fk ON public.testes_teste_2_s_links USING btree (teste_id);


--
-- Name: testes_teste_2_s_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX testes_teste_2_s_links_inv_fk ON public.testes_teste_2_s_links USING btree (teste_2_id);


--
-- Name: testes_teste_2_s_links_order_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX testes_teste_2_s_links_order_fk ON public.testes_teste_2_s_links USING btree (teste_2_order);


--
-- Name: testes_teste_2_s_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX testes_teste_2_s_links_order_inv_fk ON public.testes_teste_2_s_links USING btree (teste_order);


--
-- Name: testes_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX testes_updated_by_id_fk ON public.testes USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products_category_links products_category_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links
    ADD CONSTRAINT products_category_links_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_category_links products_category_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category_links
    ADD CONSTRAINT products_category_links_inv_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: products products_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products products_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: teste2s teste2s_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste2s
    ADD CONSTRAINT teste2s_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: teste2s teste2s_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste2s
    ADD CONSTRAINT teste2s_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: teste_2_s_testes_links teste_2_s_testes_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste_2_s_testes_links
    ADD CONSTRAINT teste_2_s_testes_links_fk FOREIGN KEY (teste_2_id) REFERENCES public.teste2s(id) ON DELETE CASCADE;


--
-- Name: teste_2_s_testes_links teste_2_s_testes_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teste_2_s_testes_links
    ADD CONSTRAINT teste_2_s_testes_links_inv_fk FOREIGN KEY (teste_id) REFERENCES public.testes(id) ON DELETE CASCADE;


--
-- Name: testes testes_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes
    ADD CONSTRAINT testes_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: testes_teste_2_s_links testes_teste_2_s_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes_teste_2_s_links
    ADD CONSTRAINT testes_teste_2_s_links_fk FOREIGN KEY (teste_id) REFERENCES public.testes(id) ON DELETE CASCADE;


--
-- Name: testes_teste_2_s_links testes_teste_2_s_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes_teste_2_s_links
    ADD CONSTRAINT testes_teste_2_s_links_inv_fk FOREIGN KEY (teste_2_id) REFERENCES public.teste2s(id) ON DELETE CASCADE;


--
-- Name: testes testes_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.testes
    ADD CONSTRAINT testes_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

