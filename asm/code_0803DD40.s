	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DD40
sub_0803DD40: @ 0x0803DD40
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r1, _0803DD94 @ =0x081D5218
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r1, #0
	movs r4, #4
	adds r0, r5, #0
	adds r0, #0x26
_0803DD58:
	strh r1, [r0]
	subs r0, #2
	subs r4, #1
	cmp r4, #0
	bge _0803DD58
	movs r4, #0
_0803DD64:
	cmp r4, #4
	beq _0803DD86
	adds r0, r5, #0
	adds r0, #0x28
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803DD86
	mov r1, sp
	adds r0, r1, r4
	movs r1, #0xff
	lsls r1, r1, #8
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r5, #0
	bl UnitAddItem
_0803DD86:
	adds r4, #1
	cmp r4, #7
	ble _0803DD64
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803DD94: .4byte 0x081D5218
