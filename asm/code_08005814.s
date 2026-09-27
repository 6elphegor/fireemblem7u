	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_DrawCharacter
Text_DrawCharacter: @ 0x08005814
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08005830 @ =0x02028D70
	ldr r1, [r0]
	adds r6, r0, #0
	ldrb r1, [r1, #0x16]
	cmp r1, #5
	beq _08005834
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_DrawCharacterAscii
	b _08005876
	.align 2, 0
_08005830: .4byte 0x02028D70
_08005834:
	ldrb r3, [r4]
	adds r4, #1
	ldrb r2, [r4]
	adds r4, #1
_0800583C:
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _0800584C @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _08005852
	.align 2, 0
_0800584C: .4byte 0xFFFFFF00
_08005850:
	ldr r1, [r1]
_08005852:
	cmp r1, #0
	bne _08005864
	movs r3, #0x81
	movs r2, #0xa7
	ldr r6, _08005860 @ =0x02028D70
	b _0800583C
	.align 2, 0
_08005860: .4byte 0x02028D70
_08005864:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _08005850
	ldr r0, [r6]
	ldr r2, [r0, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
_08005876:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
