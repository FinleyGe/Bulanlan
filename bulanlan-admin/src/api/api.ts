import axios, { AxiosResponse } from 'axios';
import { LoginResponse, Response as Res, Count, Book, User, Tag } from '../type/type';
axios.defaults.withCredentials = true;

const service = axios.create({
  // baseURL: 'http://localhost:8888',
  baseURL: 'https://bulanlan.f1nley.xyz/api',
  // withCredentials: true,
});

export async function Login(email: string, password: string): Promise<AxiosResponse<LoginResponse, any>> {
  var res = await service.post('/login', {
    email,
    password,
  });
  return res;
}

export async function Register(
  email: string,
  password: string,
  name: string): Promise<AxiosResponse<Res, any>> {
  var res = await service.post('/register', {
    email,
    password,
    name,
  });
  return res;
}

export async function CheckAdmin(): Promise<AxiosResponse<Res, any>> {
  var res = await service.get('/checkadmin');
  return res;
}

export async function GetBookCount(): Promise<AxiosResponse<Res<Count>, any>> {
  var res = await service.get('/getbookcount');
  return res;
}

export async function GetUserCount(): Promise<AxiosResponse<Res<Count>, any>> {
  var res = await service.get('/getusercount');
  return res;
}

export async function GetBooks(): Promise<AxiosResponse<Res<Book[]>, any>> {
  var res = await service.get('/getbooks');
  return res;
}

export async function GetUserInfo(): Promise<AxiosResponse<Res<User>, any>> {
  var res = await service.get('/getuserinfo');
  return res;
}

export async function GetRecommendBooks(): Promise<AxiosResponse<Res<Book[]>, any>> {
  var res = await service.get('/getrecommendbooks');
  return res;
}

export async function UpdateUserLevel(level: string): Promise<AxiosResponse<Res, any>> {
  var res = await service.post('/updateuserlevel', {
    level,
  });
  return res;
}

export async function UpdateUserTags(tags: string[]): Promise<AxiosResponse<Res, any>> {
  var res = await service.post('/updateusertags', {
    tags,
  });
  return res;
}

export async function GetTags(): Promise<AxiosResponse<Res<Tag[]>, any>> {
  var res = await service.get('/gettags');
  return res;
}

export async function UploadBookList(file: File): Promise<AxiosResponse<Res, any>> {
  var formData = new FormData();
  formData.append('file', file);
  var res = await service.post('/uploadbooklist', formData, {
    headers: {
      'Content-Type': 'multipart/form-data',
    },
  });
  return res;
}
