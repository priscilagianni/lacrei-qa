import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  vus: 30,         // 30 usuários virtuais simultâneos
  duration: '30s', // duração do teste
};

export default function () {
  // Teste na página de login
  const loginRes = http.get('https://paciente-staging.lacreisaude.com.br/login');
  check(loginRes, {
    'login status 200': (r) => r.status === 200,
    'login tempo < 500ms': (r) => r.timings.duration < 500,
  });

  sleep(1);

  // Teste na busca de profissional
  const buscaRes = http.get('https://paciente-staging.lacreisaude.com.br/busca');
  check(buscaRes, {
    'busca status 200': (r) => r.status === 200,
    'busca tempo < 500ms': (r) => r.timings.duration < 500,
  });

  sleep(1);
}
