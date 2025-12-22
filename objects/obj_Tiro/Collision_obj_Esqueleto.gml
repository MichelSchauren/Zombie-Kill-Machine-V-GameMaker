// Tira vida do inimigo quando colidir com ele
other.vida = max(other.vida - global.Tiro_DANO, 0);
instance_destroy();