	.include "macro.inc"

	.syntax unified

	thumb_func_start PhaseIntroVMatchLo
PhaseIntroVMatchLo: @ 0x0801E55C
	push {lr}
	ldr r1, _0801E58C @ =0x04000050
	ldr r2, _0801E590 @ =0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E594 @ =0x04000052
	ldr r1, _0801E598 @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x3b
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0
	bl SetNextVCount
	ldr r0, _0801E59C @ =PhaseIntroVMatchHi
	bl SetOnVMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801E58C: .4byte 0x04000050
_0801E590: .4byte 0x00003C42
_0801E594: .4byte 0x04000052
_0801E598: .4byte 0x0202BBB8
_0801E59C: .4byte PhaseIntroVMatchHi
