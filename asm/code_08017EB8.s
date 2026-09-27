	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitChangeFaction
UnitChangeFaction: @ 0x08017EB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetFreeUnit
	adds r4, r0, #0
	ldr r1, _08017EF4 @ =0x03004690
	ldr r0, [r1]
	cmp r0, r5
	bne _08017ED0
	str r4, [r1]
_08017ED0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CopyUnit
	adds r0, r5, #0
	bl ClearUnit
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	bne _08017EFC
	cmp r6, #0
	bne _08017EF8
	ldrb r0, [r4, #8]
	cmp r0, #0x14
	beq _08017EF8
	strb r6, [r4, #9]
	b _08017EFC
	.align 2, 0
_08017EF4: .4byte 0x03004690
_08017EF8:
	movs r0, #0xff
	strb r0, [r4, #9]
_08017EFC:
	ldr r0, [r4, #0xc]
	ldr r1, _08017F20 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _08017F18
	ldr r1, _08017F24 @ =0x08B92EB0
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #0x1b]
_08017F18:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017F20: .4byte 0xFFFFEFFF
_08017F24: .4byte 0x08B92EB0
