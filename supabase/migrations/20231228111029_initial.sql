create table
  public.board (
    id bigint generated by default as identity,
    created_at timestamp with time zone not null default now(),
    title text not null,
    user_id uuid not null,
    constraint board_pkey primary key (id)
  ) tablespace pg_default;

create table
  public.lane (
    id bigint generated by default as identity,
    created_at timestamp with time zone not null default now(),
    board_id bigint null,
    title text not null,
    position double precision not null,
    user_id uuid not null,
    constraint lane_pkey primary key (id),
    constraint lane_board_id_fkey foreign key (board_id) references board (id)
  ) tablespace pg_default;

create table
  public.card (
    id bigint generated by default as identity,
    created_at timestamp with time zone not null default now(),
    board_id bigint not null,
    title text not null,
    description text null,
    lane_id bigint not null,
    parent_card_id bigint null,
    position double precision not null,
    user_id uuid not null,
    constraint card_pkey primary key (id),
    constraint card_board_id_fkey foreign key (board_id) references board (id),
    constraint card_lane_id_fkey foreign key (lane_id) references lane (id),
    constraint card_parent_card_id_fkey foreign key (parent_card_id) references card (id)
  ) tablespace pg_default;
