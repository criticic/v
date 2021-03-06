// import time

struct User {
	name string
}

struct Aaa {
mut:
	m map[string]int
	users map[string]User
}

fn (mut a Aaa) set(key string, val int) {
	a.m[key] = val
}

fn test_map() {
	mut m := map[string]int
	assert m.len == 0
	m['hi'] = 80
	m['hello'] = 101
	assert m['hi'] == 80
	assert m['hello'] == 101
	assert m.len == 2
	assert 'hi' in m
	mut sum := 0
	// Test `for in`
	for _, val in m {
		sum += val
	}
	assert sum == 80 + 101
	// Test `.keys()`
	keys := m.keys()
	assert keys.len == 2
	assert 'hi' in keys
	assert 'hello' in keys
	m.delete('hi')
	assert m.len == 1
	m.delete('aloha')
	assert m.len == 1

	assert m['hi'] == 0
	assert m.keys().len == 1
	assert m.keys()[0] == 'hello'
	////
	mut users := map[string]User
	users['1'] = User{'Peter'}
	peter := users['1']
	assert  peter.name == 'Peter'
	mut a := Aaa{
		m: map[string]int
		users: map[string]User
	}
	a.users['Bob'] = User{'Bob'}
	q := a.users['Bob']
	assert q.name == 'Bob'
	a.m['one'] = 1
	a.set('two', 2)
	assert a.m['one'] == 1
	assert a.m['two'] == 2
}

fn test_map_init() {
	m := { 'one': 1, 'two': 2 }
	assert m['one'] == 1
	assert m['two'] == 2
	assert m['three'] == 0
}

fn test_string_map() {
	//m := map[string]Fn
}

fn test_large_map() {
	//ticks := time.ticks()
	mut nums := map[string]int
	n := 30 * 1000
	for i in 0..n {
	        key := i.str()
	        nums[key] = i
	}
	assert nums['1'] == 1
	assert nums['999'] == 999
	assert nums['1000000'] == 0
	//println(time.ticks() - ticks)
}

fn test_various_map_value() {
	mut m1 := map[string]int
	m1['test'] = 1
	assert m1['test'] == 1

	mut m2 := map[string]string
	m2['test'] = 'test'
	assert m2['test'] == 'test'

	mut m3 := map[string]i8
	m3['test'] = i8(0)
	assert m3['test'] == i8(0)

	mut m4 := map[string]i16
	m4['test'] = i16(0)
	assert m4['test'] == i16(0)

	mut m7 := map[string]u16
	m7['test'] = u16(0)
	assert m7['test'] == u16(0)

	mut m8 := map[string]u32
	m8['test'] = u32(0)
	assert m8['test'] == u32(0)

	mut m9 := map[string]bool
	m9['test'] = true
	assert m9['test'] == true

	mut m10 := map[string]byte
	m10['test'] = byte(0)
	assert m10['test'] == byte(0)

	mut m11 := map[string]f32
	m11['test'] = f32(0.0)
	assert m11['test'] == f32(0.0)

	mut m12 := map[string]f64
	m12['test'] = f64(0.0)
	assert m12['test'] == f64(0.0)

	//mut m13 := map[string]rune
	//m13['test'] = rune(0)
	//assert m13['test'] == rune(0)

	mut m14 := map[string]voidptr
	m14['test'] = voidptr(0)
	assert m14['test'] == voidptr(0)

	mut m15 := map[string]byteptr
	m15['test'] = byteptr(0)
	assert m15['test'] == byteptr(0)

	mut m16 := map[string]i64
	m16['test'] = i64(0)
	assert m16['test'] == i64(0)

	mut m17 := map[string]u64
	m17['test'] = u64(0)
	assert m17['test'] == u64(0)

	mut m18 := map[string]&int
	m18['test'] = &int(0)
	assert m18['test'] == &int(0)
}


fn test_string_arr() {
	mut m := map[string][]string
	m['a'] = ['one', 'two']
	assert m['a'].len == 2
	assert m['a'][0] == 'one'
	assert m['a'][1] == 'two'
}

fn mut_map(mut m map[string]int) {
	m['a'] = 10
}

fn test_mut_arg() {
	mut m := map[string]int
	mut_map(mut m)
	a := m['a']
	assert a == 10
}

fn test_delete() {
	mut m := map[string]int
	m['one'] = 1
	m['two'] = 2
	println(m['two']) // => "2"
	m.delete('two')
	println(m['two'].str()) // => 0
	assert ('two' in m) == false
	println('two' in m) // => true, on Linux  and Windows  <-- wrong !
}

fn test_delete_size() {
    arr := ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    mut m := map[string]int
    for _ in 0..10 {
        for i in 0..10 {
            m[arr[i]] = i
        }
        assert(m.len == 10)
        println(m.len)
        for i in 0..10 {
            m.delete(arr[i])
        }
    }
}

struct Mstruct1 {
pub mut:
	mymap map[string]int
}

struct Mstruct2 {
pub mut:
	mymap map[string]f64
}

struct Mstruct3 {
pub mut:
	mymap map[string]u16
}

fn test_map_assign() {
	mut a := map[string]f64{}
	mut b := map[string]int{}
	mut c := map[string]u16{}
	a = {
		'x': 12.4
		'y': 3
	}
	b = {
		'u': -13
		'v': 12
	}
	c = {
		's': u16(5)
		't': 3
	}
	_ := Mstruct1 {
		{ 'p': 12 }
	}
	_ := Mstruct2 {
		{ 'q': 1.7 }
	}
	_ := Mstruct3 {
		{ 'r': u16(6), 's': 5 }
	}
}

fn test_postfix_op_directly() {
	mut a := map[string]int
	a['aaa']++
	assert a['aaa'] == 1
	a['aaa']++
	assert a['aaa'] == 2
	a['bbb']--
	assert a['bbb'] == -1
	a['bbb']--
	assert a['bbb'] == -2
}

fn test_map_push_directly() {
	mut a := map[string][]string
	a['aaa'] << ['a', 'b', 'c']
	assert a['aaa'].len == 3
	assert a['aaa'] == ['a', 'b', 'c']
}

fn test_assign_directly() {
	mut a := map[string]int
	a['aaa'] += 4
	assert a['aaa'] == 4
	a['aaa'] -= 2
	assert a['aaa'] == 2
}

fn test_map_in_directly() {
	for k, v in {'aa': 1} {
		assert k == 'aa'
		assert v == 1
	}
}

fn test_plus_assign_string() {
	mut m := {'one': ''}
	m['one'] += '1'
	assert m.len == 1
	assert m['one'] == '1'
}

fn test_map_keys_to_array() {
	m := {'a': 'b', 'c': 'd'}
	mut arr := []string{}
	for k, _ in m {
		arr << k
	}
	sarr := arr.str()
	println(sarr)
	assert sarr == "['a', 'c']"
}

fn map_in_mut(mut m map[string]int) {
	if 'one' in m {
		m['one'] = 2
	}
}

fn test_map_in_mut() {
	mut m := {'one': 1}
	map_in_mut(mut m)
	assert m['one'] == 2
}

fn mut_map_with_relation_op_in_fn(mut m map[string]int) {
	if m['one'] == 1 {
		m['three'] = 3
	}
	if m['two'] != 1 {
		m['four'] = 4	
	}
	if m['one'] > 0 {
		m['five'] = 5	
	}
	if m['one'] < 2 {
		m['six'] = 6	
	}
	if m['two'] >= 2 {
		m['seven'] = 7	
	}
	if m['two'] <= 2 {
		m['eight'] = 8	
	}
}

fn test_mut_map_with_relation_op_in_fn() {
	mut m := {'one':1, 'two':2}
	mut_map_with_relation_op_in_fn(mut m)
	assert 'three' in m
	assert 'four' in m
	assert 'five' in m
	assert 'six' in m
	assert 'seven' in m
	assert 'eight' in m
}
