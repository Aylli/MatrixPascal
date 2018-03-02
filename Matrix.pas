program Matrix; // Ну тип заголовок
uses Crt; // Ну тип графический модуль
const width = 100;   // Ну тип ширина
      height = 25; // Высота
      lin = 100; // Количество линий
var lines: array [1..lin, 1..2] of integer; // Ну тип линии
    symbols: string; // Буковки
    i, j: integer; // Итератор
// Функции
procedure Draw(); // Отрисовываес занятые линии
var i, j: integer;
begin
    for i:=1 to lin do begin
        if lines[i][1]<>0 then begin // Если строка используется
            lines[i][2]:=lines[i][2]+1; // Увеличиваем Y на 1
            for j:=1 to 7 do begin // Идём по всей длинне
                if lines[i][2]>=j then begin // Если Y позволяет отрисовать
                    if (j=1) then begin// Если это первый или второй символ
//                        textbackground(10); // Фон ярко-зелёный
                        textcolor(15); // Цвет текста белый
                    end;
                    if (j=2) or (j=3) or (j=4) then begin
//                        textbackground(2); // Фон зелёный
                        textcolor(10); // Цвет текста серый 7 
                    end;
                    if j>=5 then begin
                        textbackground(0); // Фон чёрный
                        textcolor(2); // Цвет текста зелёный
                    end;
                    if j<=7 then begin
                        gotoxy(lines[i][1], lines[i][2]-j-1); // Перемещаемся на координату отрисовки
                        write(symbols[random(69)+1]); // Пишем случайный символ
                    end;
                    if (j=7) and (lines[i][2]>1) then begin
                        gotoxy(lines[i][1], lines[i][2]-j-2); // Перемещаемся на координату где полоски быть не должно
                        write(' '); // Удаляем символ
                    end;
                end;     
            end;
            if lines[i][2]>=height+7 then begin // Если Y>=height+7
                // Очищаем ненужные пиксели
                textbackground(0);
                for j:=1 to 7 do begin
                    gotoxy(lines[i][1], lines[i][2]-j-1);
                    write(' ');
                end;
                // Освобождаем линию
                lines[i][1]:=0; // X
                lines[i][2]:=0; // Y
            end;
        end;
    end;
end;
begin // Ну тип программа
    randomize;
    textbackground(0); // Ставим цвет фона на чёрный
    clrscr; // и заливаем
    // Описываем основные переменные
    symbols:='qwertyuiopasdfghjklzxcvbnmйцукенгшщзхъфывапролджэячсмитьбюё1234567890'; // Буковки
    for i:=1 to lin do begin // Обнуляем строки
        lines[i][1]:=0; // X
        lines[i][2]:=0; // Y
    end;
    while true do begin // Основной цикл
        i:=1;
        while (lines[i][1]<>0) and (lines[i][2]<>0) do // Ищем незанятую строку
            i:=i+1;
        lines[i][1]:=random(width)+1; // Делаем её занятой
        Draw(); // Рисуем матрицу
        delay(50); // Задержка. ~20FPS.
    end;
end.
