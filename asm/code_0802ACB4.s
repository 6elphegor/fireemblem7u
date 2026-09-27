	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802ACB4
sub_0802ACB4: @ 0x0802ACB4
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x14]
	ldr r0, [r3, #0x40]
	ldr r2, _0802AD28 @ =0x00FFFF00
	ands r0, r2
	ldr r1, [r4, #0x40]
	ands r1, r2
	cmp r0, r1
	beq _0802AD20
	adds r5, r3, #0
	adds r5, #0x41
	ldrb r0, [r5]
	adds r7, r3, #0
	adds r7, #0x42
	cmp r0, #0xff
	beq _0802ACF4
	ldr r0, _0802AD2C @ =0x08B942B8
	ldrb r2, [r5]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r2, [r7]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl ClearUiItemHover
_0802ACF4:
	ldr r0, _0802AD2C @ =0x08B942B8
	adds r6, r4, #0
	adds r6, #0x42
	adds r4, #0x41
	ldrb r2, [r4]
	lsls r1, r2, #2
	adds r1, r1, r2
	ldrb r2, [r6]
	adds r1, r2, r1
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	movs r2, #2
	ldrsh r1, [r1, r2]
	movs r2, #0xc
	bl DrawUiItemHover
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r6]
	strb r0, [r7]
_0802AD20:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802AD28: .4byte 0x00FFFF00
_0802AD2C: .4byte 0x08B942B8
