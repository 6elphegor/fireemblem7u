	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080752F4
sub_080752F4: @ 0x080752F4
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, [r7]
	movs r1, #4
	cmn r0, r1
	bge _08075308
	b _0807533A
_08075308:
	ldr r0, [r7]
	cmp r0, #0xeb
	ble _08075310
	b _0807533A
_08075310:
	ldr r0, [r7, #4]
	movs r1, #4
	cmn r0, r1
	bge _0807531A
	b _0807533A
_0807531A:
	ldr r0, [r7, #4]
	cmp r0, #0x9b
	ble _08075322
	b _0807533A
_08075322:
	ldr r1, [r7]
	subs r0, r1, #4
	lsls r1, r0, #0x17
	lsrs r0, r1, #0x17
	ldr r2, [r7, #4]
	subs r1, r2, #4
	movs r2, #0xff
	ands r1, r2
	ldr r2, _08075344 @ =0x08B905B0
	ldr r3, _08075348 @ =0x000041C0
	bl PutOamHiRam
_0807533A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075344: .4byte 0x08B905B0
_08075348: .4byte 0x000041C0
