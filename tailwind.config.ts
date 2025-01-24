import type { Config } from 'tailwindcss'
import defaultTheme from 'tailwindcss/defaultTheme'

export default <Partial<Config>>{
  theme: {
    extend: {
      fontFamily: {
        sans: ['DM Sans', ...defaultTheme.fontFamily.sans]
      },
      colors: {
        blue: {
          50: '#FBFDFF',
          100: '#F2F7FD',
          200: '#9EC0E7',
          300: '#3A89E1',
          400: '#1874DC',
          500: '#1874DC',
          600: '#214874',
          700: '#002856',
          800: '#002044',
          900: '#002044',
          950: '#002044'
        }
      }
    }
  }
}
