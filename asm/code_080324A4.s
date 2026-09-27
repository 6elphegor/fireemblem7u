	.include "macro.inc"

	.syntax unified

	thumb_func_start SubtitleHelpDarkener_FadeOut
SubtitleHelpDarkener_FadeOut: @ 0x080324A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080324CC @ =0x0202BBB8
	adds r1, #0x38
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #8
	bne _080324C6
	movs r0, #0
	bl SetOnHBlankA
	adds r0, r4, #0
	bl Proc_Break
_080324C6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080324CC: .4byte 0x0202BBB8
