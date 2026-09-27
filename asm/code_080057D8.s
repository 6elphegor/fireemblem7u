	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_DrawNumberOrBlank
Text_DrawNumberOrBlank: @ 0x080057D8
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xff
	beq _080057E8
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08005808
_080057E8:
	movs r1, #8
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl Text_Skip
	ldr r0, _08005804 @ =0x0000127C
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	b _0800580E
	.align 2, 0
_08005804: .4byte 0x0000127C
_08005808:
	adds r0, r4, #0
	bl Text_DrawNumber
_0800580E:
	pop {r4}
	pop {r0}
	bx r0
