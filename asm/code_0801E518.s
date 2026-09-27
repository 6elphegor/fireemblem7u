	.include "macro.inc"

	.syntax unified

	thumb_func_start PhaseIntroVMatchMid
PhaseIntroVMatchMid: @ 0x0801E518
	push {lr}
	ldr r1, _0801E548 @ =0x04000050
	ldr r2, _0801E54C @ =0x00003E41
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E550 @ =0x04000052
	ldr r1, _0801E554 @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x38
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x39
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0x60
	bl SetNextVCount
	ldr r0, _0801E558 @ =PhaseIntroVMatchLo
	bl SetOnVMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801E548: .4byte 0x04000050
_0801E54C: .4byte 0x00003E41
_0801E550: .4byte 0x04000052
_0801E554: .4byte 0x0202BBB8
_0801E558: .4byte PhaseIntroVMatchLo
