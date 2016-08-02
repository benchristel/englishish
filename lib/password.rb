require_relative './weighted_array'
require_relative './phrase_type'
require 'securerandom'

class Password
  def self.generate
    ROOT.choose
  end
end

ROOT = PhraseType.new(<<-__)
[word]-[word]
__

WORD = PhraseType.new(<<-__)
[germanic_root]
[long_germanic_root]
[germanic_root]
__

GERMANIC_ROOT = PhraseType.new(<<-__)
[initial][long_vowel][short_final]
[initial][short_vowel][short_final]
[initial][long_vowel]
__


LONG_GERMANIC_ROOT = PhraseType.new(<<-__)
[initial][short_vowel][long_final]
[initial][short_vowel][short_final]
__

INITIAL = PhraseType.new(<<-__)
b
br
c
ch
cl
cr
d
dr
dw
f
fl
fr
g
gl
gr
gw
h
j
k
kn
kl
kr
l
m
n
p
ph
pl
pr
qu
r
s
sh
sc
scr
sl
sm
sn
sp
spr
st
str
sw
t
th
thr
tr
tw
v
w
wh
wr
z
zw
__

SHORT_VOWEL = PhraseType.new(<<-__)
a
e
i
o
u
__

LONG_VOWEL = PhraseType.new(<<-__)
oo
ee
ou
ea
ai
ei
y
ew
ow
__

LONG_FINAL = PhraseType.new(<<-__)
bb[infl_2_or_null]
bble
ck[infl_2_or_null]
ct[infl_2_or_null]
ctle
dd[infl_2_or_null]
ddle
ff[infl_2_or_null]
ft[infl_2_or_null]
ftle
gg[infl_2_or_null]
ggle
gh[infl_2_or_null]
ght[infl_2_or_null]
lb[infl_2_or_null]
ld[infl_2_or_null]
ll[infl_2_or_null]
mm[infl_2_or_null]
mp[infl_2_or_null]
mple
nd[infl_2_or_null]
ndle
nt[infl_2_or_null]
ntle
nk[infl_2_or_null]
nkle
pp[infl_2_or_null]
pple
ckle
__

SHORT_FINAL = PhraseType.new(<<-__)
b[infl_3_or_null]
d[infl_3_or_null]
n[infl_3_or_null]
t[infl_3_or_null]
g[infl_3_or_null]
p[infl_3_or_null]
ple
gle
tle
dle
ble
__

INFL_2_OR_NULL = PhraseType.new(<<-__)

[infl_2]
__

INFL_3_OR_NULL = PhraseType.new(<<-__)

[infl_3]
__

INFL_1 = PhraseType.new(<<-__)
ed
ing
ity
ite
ous
ow
ows
er
ers
ren
ly
lies
ment
ments
ness
liness
__

INFL_2 = PhraseType.new(<<-__)
y
[infl_1]
__

INFL_2_OR_E = PhraseType.new(<<-__)
e
[infl_2]
__

INFL_3 = PhraseType.new(<<-__)
e
s
[infl_1]
__


puts "entropy: #{(ROOT.entropy / 10e8).round(2)} billion possibilities"
puts '------------'
