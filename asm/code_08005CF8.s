	.include "macro.inc"

	.syntax unified

	thumb_func_start SpriteText_DrawBackgroundExt
SpriteText_DrawBackgroundExt: @ 0x08005CF8
	push {lr}
	sub sp, #4
	movs r2, #0
	strb r2, [r0, #2]
	str r1, [sp]
	ldr r1, _08005D1C @ =0x02028D70
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	bl _call_via_r1
	adds r1, r0, #0
	ldr r2, _08005D20 @ =0x01000200
	mov r0, sp
	bl CpuFastSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_08005D1C: .4byte 0x02028D70
_08005D20: .4byte 0x01000200
