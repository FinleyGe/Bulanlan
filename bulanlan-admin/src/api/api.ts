import axios, { AxiosResponse } from 'axios';
import { LoginResponse, Response as Res, Count, Book } from '../type/type';
axios.defaults.withCredentials = true;

const service = axios.create({
  baseURL: 'http://localhost:8888',
  // withCredentials: true,
});

export async function Login(email: string, password: string): Promise<AxiosResponse<LoginResponse, any>> {
  var res = await service.post('/login', {
    email,
    password,
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
