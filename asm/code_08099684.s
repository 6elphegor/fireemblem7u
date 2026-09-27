	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099684
sub_08099684: @ 0x08099684
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl GetGameTacticsRank
	adds r5, r7, #0
	adds r5, #0x34
	movs r6, #0
	strb r0, [r5]
	bl GetGameSurvivalRank
	movs r1, #0x35
	adds r1, r1, r7
	mov sl, r1
	strb r0, [r1]
	bl GetGameFundsRank
	movs r2, #0x36
	adds r2, r2, r7
	mov sb, r2
	strb r0, [r2]
	bl GetGameExpRank
	movs r3, #0x37
	adds r3, r3, r7
	mov r8, r3
	strb r0, [r3]
	bl GetGameCombatRank
	adds r4, r7, #0
	adds r4, #0x38
	strb r0, [r4]
	ldrb r0, [r5]
	mov r5, sl
	ldrb r1, [r5]
	mov r3, sb
	ldrb r2, [r3]
	mov r5, r8
	ldrb r3, [r5]
	ldrb r4, [r4]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r7, #0
	adds r1, #0x39
	strb r0, [r1]
	str r6, [r7, #0x2c]
	ldr r0, _08099718 @ =0x0840E830
	ldr r1, _0809971C @ =0x06017000
	bl Decompress
	ldr r0, _08099720 @ =0x0840E978
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08099724 @ =sub_08099474
	adds r1, r7, #0
	bl StartParallelWorker
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099718: .4byte 0x0840E830
_0809971C: .4byte 0x06017000
_08099720: .4byte 0x0840E978
_08099724: .4byte sub_08099474
