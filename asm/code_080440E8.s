	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080440E8
sub_080440E8: @ 0x080440E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	ldr r1, _08044130 @ =0x0203D90C
	adds r0, r1, #0
	adds r0, #0xa0
	ldrb r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #2
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08044138
	movs r6, #0
	cmp r6, r3
	bge _08044192
	ldr r4, _08044134 @ =0x0203DCAB
	adds r5, r4, #5
	mov r2, r8
_08044114:
	adds r1, r6, r4
	ldrb r0, [r1]
	strb r0, [r2]
	ldrb r1, [r1]
	lsls r0, r1, #2
	adds r0, r0, r5
	ldr r0, [r0]
	str r0, [r2, #4]
	adds r2, #8
	adds r6, #1
	cmp r6, r3
	blt _08044114
	b _08044192
	.align 2, 0
_08044130: .4byte 0x0203D90C
_08044134: .4byte 0x0203DCAB
_08044138:
	movs r6, #0
	subs r1, r3, #2
	mov ip, r1
	cmp r6, r3
	bge _08044158
	ldr r0, _0804415C @ =0x0203DC9C
	adds r2, r0, #0
	adds r2, #0x14
	mov r1, r8
_0804414A:
	strb r6, [r1]
	ldm r2!, {r0}
	str r0, [r1, #4]
	adds r1, #8
	adds r6, #1
	cmp r6, r3
	blt _0804414A
_08044158:
	movs r6, #0
	b _0804418C
	.align 2, 0
_0804415C: .4byte 0x0203DC9C
_08044160:
	adds r5, r0, #0
	adds r7, r6, #1
	cmp r0, r6
	blt _0804418A
	lsls r0, r0, #3
	mov r1, r8
	adds r2, r0, r1
_0804416E:
	ldr r4, [r2, #4]
	ldr r3, [r2, #0xc]
	cmp r4, r3
	bhs _08044182
	ldrb r1, [r2]
	ldrb r0, [r2, #8]
	strb r0, [r2]
	strb r1, [r2, #8]
	str r3, [r2, #4]
	str r4, [r2, #0xc]
_08044182:
	subs r2, #8
	subs r5, #1
	cmp r5, r6
	bge _0804416E
_0804418A:
	adds r6, r7, #0
_0804418C:
	mov r0, ip
	cmp r6, r0
	ble _08044160
_08044192:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
