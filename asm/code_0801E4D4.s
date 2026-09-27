	.include "macro.inc"

	.syntax unified

	thumb_func_start PhaseIntroVMatchHi
PhaseIntroVMatchHi: @ 0x0801E4D4
	push {lr}
	ldr r1, _0801E504 @ =0x04000050
	ldr r2, _0801E508 @ =0x00003C42
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0801E50C @ =0x04000052
	ldr r1, _0801E510 @ =0x0202BBB8
	adds r0, r1, #0
	adds r0, #0x3a
	ldrb r0, [r0]
	strb r0, [r2]
	adds r2, #1
	adds r1, #0x3b
	ldrb r0, [r1]
	strb r0, [r2]
	movs r0, #0x48
	bl SetNextVCount
	ldr r0, _0801E514 @ =PhaseIntroVMatchMid
	bl SetOnVMatch
	pop {r0}
	bx r0
	.align 2, 0
_0801E504: .4byte 0x04000050
_0801E508: .4byte 0x00003C42
_0801E50C: .4byte 0x04000052
_0801E510: .4byte 0x0202BBB8
_0801E514: .4byte PhaseIntroVMatchMid
