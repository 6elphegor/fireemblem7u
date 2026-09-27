	.include "macro.inc"

	.syntax unified

	thumb_func_start Text_DrawCharacterAscii
Text_DrawCharacterAscii: @ 0x08005B9C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08005BCC @ =0x02028D70
	ldr r3, [r0]
	ldr r2, [r3, #4]
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r1, [r0]
	adds r4, #1
	cmp r1, #0
	bne _08005BBC
	adds r0, r2, #0
	adds r0, #0xfc
	ldr r1, [r0]
_08005BBC:
	ldr r2, [r3, #8]
	adds r0, r5, #0
	bl _call_via_r2
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08005BCC: .4byte 0x02028D70
