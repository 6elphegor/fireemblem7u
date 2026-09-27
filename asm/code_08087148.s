	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterStatus_OnEnd
ChapterStatus_OnEnd: @ 0x08087148
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08087170 @ =0x08CC3000
	bl Proc_EndEach
	bl EndHelpPromptSprite
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808716A
	ldr r0, [r4, #0x34]
	ldr r1, [r0, #0xc]
	movs r2, #2
	orrs r1, r2
	str r1, [r0, #0xc]
_0808716A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087170: .4byte 0x08CC3000
