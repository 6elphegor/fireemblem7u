	.include "macro.inc"

	.syntax unified

	thumb_func_start PhaseIntroText_PutText
PhaseIntroText_PutText: @ 0x0801E5A0
	push {lr}
	ldr r2, _0801E5C0 @ =0x02022EA0
	movs r1, #0
	ldr r0, _0801E5C4 @ =0x00005140
	adds r3, r0, #0
_0801E5AA:
	adds r0, r1, r3
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #0x5f
	ble _0801E5AA
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0801E5C0: .4byte 0x02022EA0
_0801E5C4: .4byte 0x00005140
