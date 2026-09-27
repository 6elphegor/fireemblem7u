	.include "macro.inc"

	.syntax unified

	thumb_func_start StatScreen_BackUpStatus
StatScreen_BackUpStatus: @ 0x0808140C
	push {r4, lr}
	ldr r3, _08081438 @ =0x0202BBF8
	movs r1, #0xfc
	ldrb r0, [r3, #0x14]
	ands r1, r0
	ldr r2, _0808143C @ =0x0200310C
	movs r0, #3
	ldrb r4, [r2]
	ands r0, r4
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldr r1, _08081440 @ =0x0203E670
	ldr r0, [r2, #0xc]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #1]
	movs r0, #0
	bl SetOnVMatch
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08081438: .4byte 0x0202BBF8
_0808143C: .4byte 0x0200310C
_08081440: .4byte 0x0203E670
