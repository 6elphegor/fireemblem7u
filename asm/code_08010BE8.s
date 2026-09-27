	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010BE8
sub_08010BE8: @ 0x08010BE8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010C4C
	ldr r4, _08010C40 @ =0x08B91588
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08010C44 @ =0x06001000
	bl Decompress
	ldr r0, _08010C48 @ =0x02023C60
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r4, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	bl TmApplyTsa_thm
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #8
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [r5, #0x44]
	lsls r2, r2, #5
	movs r1, #0
	bl ApplyPaletteExt
	b _08010C5E
	.align 2, 0
_08010C40: .4byte 0x08B91588
_08010C44: .4byte 0x06001000
_08010C48: .4byte 0x02023C60
_08010C4C:
	ldr r0, _08010C8C @ =0x02023C60
	movs r1, #0x80
	lsls r1, r1, #5
	ldr r3, [r5, #0x44]
	ldr r2, [r5, #0x2c]
	str r2, [sp]
	movs r2, #0
	bl PutCgBackground
_08010C5E:
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r2, _08010C90 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010C8C: .4byte 0x02023C60
_08010C90: .4byte 0x03002870
