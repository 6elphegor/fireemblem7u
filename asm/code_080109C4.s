	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080109C4
sub_080109C4: @ 0x080109C4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010A2C
	ldr r4, _08010A20 @ =0x08B91588
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08010A24 @ =0x06008000
	bl Decompress
	ldr r0, _08010A28 @ =0x02024460
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r4, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #8
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x44]
	lsls r2, r2, #5
	bl ApplyPaletteExt
	b _08010A3E
	.align 2, 0
_08010A20: .4byte 0x08B91588
_08010A24: .4byte 0x06008000
_08010A28: .4byte 0x02024460
_08010A2C:
	ldr r0, _08010A4C @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r3, [r5, #0x44]
	ldr r2, [r5, #0x2c]
	str r2, [sp]
	movs r2, #8
	bl PutCgBackground
_08010A3E:
	movs r0, #8
	bl EnableBgSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010A4C: .4byte 0x02024460
