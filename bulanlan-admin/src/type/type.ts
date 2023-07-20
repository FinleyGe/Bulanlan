export type Response<T = null> = {
  message: string;
  data: T;
};

export type LoginResponse = Response<{
  token: string;
}>;

export type Tag = {
  name: string;
}

export type Book = {
  name: string;
  author: string;
  tags: Tag[];
  level: string;
  url: string;
}

export type Count = {
  count: number;
}

