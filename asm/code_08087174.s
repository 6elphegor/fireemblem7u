	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterStatus_FocusLeaderUnit
ChapterStatus_FocusLeaderUnit: @ 0x08087174
	push {lr}
	adds r1, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08087186
	ldr r0, _0808718C @ =0x08B9367C
	bl Proc_StartBlocking
_08087186:
	pop {r0}
	bx r0
	.align 2, 0
_0808718C: .4byte 0x08B9367C
