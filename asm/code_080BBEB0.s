	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BBEB0
sub_080BBEB0: @ 0x080BBEB0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x30]
	cmp r1, r2
	ble _080BBED4
	ldr r0, [r4, #0x34]
	adds r0, r2, r0
	str r0, [r4, #0x30]
	cmp r0, r1
	ble _080BBECA
	str r1, [r4, #0x30]
_080BBECA:
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x30]
	rsbs r1, r1, #0
	bl sub_080BD688
_080BBED4:
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x30]
	cmp r1, r2
	bge _080BBEF2
	ldr r0, [r4, #0x34]
	subs r0, r2, r0
	str r0, [r4, #0x30]
	cmp r0, r1
	bge _080BBEE8
	str r1, [r4, #0x30]
_080BBEE8:
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x30]
	rsbs r1, r1, #0
	bl sub_080BD688
_080BBEF2:
	ldr r1, [r4, #0x2c]
	ldr r0, _080BBF20 @ =0x000008A2
	cmp r1, r0
	bne _080BBEFC
	b _080BC006
_080BBEFC:
	cmp r1, r0
	bgt _080BBF50
	movs r0, #0xaf
	lsls r0, r0, #3
	cmp r1, r0
	beq _080BBFD8
	cmp r1, r0
	bgt _080BBF30
	subs r0, #0xb4
	cmp r1, r0
	beq _080BBFBC
	cmp r1, r0
	bgt _080BBF24
	movs r0, #0x96
	lsls r0, r0, #1
	cmp r1, r0
	beq _080BBFB0
	b _080BC094
	.align 2, 0
_080BBF20: .4byte 0x000008A2
_080BBF24:
	ldr r0, _080BBF2C @ =0x0000053C
	cmp r1, r0
	beq _080BBFC8
	b _080BC094
	.align 2, 0
_080BBF2C: .4byte 0x0000053C
_080BBF30:
	movs r0, #0xdc
	lsls r0, r0, #3
	cmp r1, r0
	beq _080BBFFC
	cmp r1, r0
	bgt _080BBF44
	subs r0, #0xb4
	cmp r1, r0
	beq _080BBFE4
	b _080BC094
_080BBF44:
	ldr r0, _080BBF4C @ =0x0000080C
	cmp r1, r0
	beq _080BC006
	b _080BC094
	.align 2, 0
_080BBF4C: .4byte 0x0000080C
_080BBF50:
	ldr r0, _080BBF74 @ =0x00000B68
	cmp r1, r0
	bne _080BBF58
	b _080BC044
_080BBF58:
	cmp r1, r0
	bgt _080BBF84
	movs r0, #0xa0
	lsls r0, r0, #4
	cmp r1, r0
	bne _080BBF66
	b _080BC07C
_080BBF66:
	cmp r1, r0
	bgt _080BBF78
	subs r0, #0xc8
	cmp r1, r0
	beq _080BC00E
	b _080BC094
	.align 2, 0
_080BBF74: .4byte 0x00000B68
_080BBF78:
	ldr r0, _080BBF80 @ =0x00000B2C
	cmp r1, r0
	beq _080BC02C
	b _080BC094
	.align 2, 0
_080BBF80: .4byte 0x00000B2C
_080BBF84:
	ldr r0, _080BBF98 @ =0x00000C58
	cmp r1, r0
	bne _080BBF8C
	b _080BC07C
_080BBF8C:
	cmp r1, r0
	bgt _080BBF9C
	subs r0, #0x64
	cmp r1, r0
	beq _080BC064
	b _080BC094
	.align 2, 0
_080BBF98: .4byte 0x00000C58
_080BBF9C:
	ldr r0, _080BBFAC @ =0x00000E74
	cmp r1, r0
	beq _080BC086
	movs r0, #0xfa
	lsls r0, r0, #4
	cmp r1, r0
	beq _080BC08E
	b _080BC094
	.align 2, 0
_080BBFAC: .4byte 0x00000E74
_080BBFB0:
	movs r0, #0xfa
	lsls r0, r0, #2
	adds r1, r4, #0
	bl sub_080BCA6C
	b _080BC094
_080BBFBC:
	ldr r0, _080BBFD0 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #2
	orrs r1, r2
	str r1, [r0]
_080BBFC8:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BBFD4 @ =0x08600584
	b _080BC06A
	.align 2, 0
_080BBFD0: .4byte 0x03001620
_080BBFD4: .4byte 0x08600584
_080BBFD8:
	movs r0, #0x20
	str r0, [r4, #0x34]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r4, #0x38]
	b _080BC094
_080BBFE4:
	ldr r0, _080BBFF8 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r1, r2
	str r1, [r0]
	bl sub_080BBDD0
	b _080BC094
	.align 2, 0
_080BBFF8: .4byte 0x03001620
_080BBFFC:
	movs r0, #0x20
	str r0, [r4, #0x34]
	movs r0, #0
	str r0, [r4, #0x38]
	b _080BC094
_080BC006:
	adds r0, r4, #0
	bl sub_080BBE50
	b _080BC094
_080BC00E:
	adds r0, r4, #0
	bl sub_080BBE7C
	ldr r0, _080BC024 @ =0x03001620
	ldr r1, [r0]
	ldr r2, _080BC028 @ =0xFFFFF9FF
	ands r1, r2
	str r1, [r0]
	bl sub_080BBE40
	b _080BC094
	.align 2, 0
_080BC024: .4byte 0x03001620
_080BC028: .4byte 0xFFFFF9FF
_080BC02C:
	adds r0, r4, #0
	bl sub_080BBE50
	ldr r0, _080BC040 @ =0x03001620
	ldr r1, [r0]
	movs r2, #0x80
	lsls r2, r2, #4
	orrs r1, r2
	str r1, [r0]
	b _080BC094
	.align 2, 0
_080BC040: .4byte 0x03001620
_080BC044:
	movs r0, #0x10
	str r0, [r4, #0x34]
	movs r0, #0xc0
	lsls r0, r0, #1
	str r0, [r4, #0x38]
	ldr r2, _080BC05C @ =0x03001620
	ldr r0, [r2]
	ldr r1, _080BC060 @ =0xFFFFF7FF
	ands r0, r1
	str r0, [r2]
	b _080BC094
	.align 2, 0
_080BC05C: .4byte 0x03001620
_080BC060: .4byte 0xFFFFF7FF
_080BC064:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, _080BC078 @ =0x08600564
_080BC06A:
	str r4, [sp]
	movs r2, #0
	movs r3, #1
	bl sub_080BD0D4
	b _080BC094
	.align 2, 0
_080BC078: .4byte 0x08600564
_080BC07C:
	movs r0, #0x10
	str r0, [r4, #0x34]
	adds r0, #0xf0
	str r0, [r4, #0x38]
	b _080BC094
_080BC086:
	adds r0, r4, #0
	bl sub_080BCAE8
	b _080BC094
_080BC08E:
	adds r0, r4, #0
	bl Proc_Break
_080BC094:
	ldr r0, [r4, #0x2c]
	adds r0, #1
	str r0, [r4, #0x2c]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
