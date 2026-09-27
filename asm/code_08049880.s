	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08049880
sub_08049880: @ 0x08049880
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [sp, #0x14]
	lsls r3, r3, #0x18
	lsrs r5, r3, #0x18
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	movs r3, #0
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080498BC
	ldrb r0, [r4, #0x1e]
	cmp r0, #0
	beq _080498BC
	adds r0, r4, #0
	adds r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _080498BC
	str r6, [r4, #0x20]
	adds r2, #0xf
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r2, r0
	subs r0, #0xf0
	adds r1, r2, r0
	ldr r0, _080498C4 @ =0x0003FF00
	cmp r1, r0
	bls _080498C8
_080498BC:
	adds r0, r4, #0
	bl MultiBootInit
	b _0804993C
	.align 2, 0
_080498C4: .4byte 0x0003FF00
_080498C8:
	adds r0, r6, r2
	str r0, [r4, #0x24]
	lsls r1, r7, #0x18
	movs r2, #0x80
	lsls r2, r2, #0x13
	adds r0, r1, r2
	asrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #8
	bhi _08049928
	lsls r0, r0, #2
	ldr r1, _080498E8 @ =_080498EC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080498E8: .4byte _080498EC
_080498EC: @ jump table
	.4byte _08049910 @ case 0
	.4byte _08049910 @ case 1
	.4byte _08049910 @ case 2
	.4byte _08049910 @ case 3
	.4byte _0804991A @ case 4
	.4byte _08049920 @ case 5
	.4byte _08049920 @ case 6
	.4byte _08049920 @ case 7
	.4byte _08049920 @ case 8
_08049910:
	lsls r3, r5, #3
	asrs r1, r2, #0x18
	movs r0, #3
	subs r0, r0, r1
	b _08049926
_0804991A:
	movs r0, #0x38
	adds r3, r5, #0
	b _08049926
_08049920:
	lsls r3, r5, #3
	asrs r0, r2, #0x18
	subs r0, #1
_08049926:
	orrs r3, r0
_08049928:
	movs r0, #0x3f
	ands r3, r0
	lsls r0, r3, #1
	movs r2, #0x7f
	rsbs r2, r2, #0
	adds r1, r2, #0
	orrs r0, r1
	strb r0, [r4, #0x1c]
	movs r0, #0xd0
	strb r0, [r4, #0x18]
_0804993C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
