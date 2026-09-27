	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B8EEC
sub_080B8EEC: @ 0x080B8EEC
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	str r0, [r4, #0x58]
	bl InitBgs
	movs r0, #0x86
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B8F34
	ldr r0, _080B8F30 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	movs r2, #0x3f
	str r2, [sp]
	movs r2, #1
	movs r3, #7
	bl PutCgBackground
	movs r0, #8
	bl EnableBgSync
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B8F38
	.align 2, 0
_080B8F30: .4byte 0x02024460
_080B8F34:
	bl DrawFinImage
_080B8F38:
	ldr r3, _080B8F60 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B8F60: .4byte 0x03002870
