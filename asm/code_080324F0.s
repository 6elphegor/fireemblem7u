	.include "macro.inc"

	.syntax unified

	thumb_func_start SubtitleHelp_OnEnd
SubtitleHelp_OnEnd: @ 0x080324F0
	push {lr}
	ldr r0, _0803250C @ =0x0202BBB8
	ldrh r1, [r0, #0x2a]
	subs r1, #0x10
	strh r1, [r0, #0x2a]
	movs r0, #0
	bl CameraMove_801622C
	ldr r0, _08032510 @ =0x08B969E4
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_0803250C: .4byte 0x0202BBB8
_08032510: .4byte 0x08B969E4
