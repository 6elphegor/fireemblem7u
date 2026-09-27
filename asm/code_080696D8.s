	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_DrawNewLevel
EkrLvup_DrawNewLevel: @ 0x080696D8
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	bne _08069730
	strh r0, [r5, #0x2c]
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	movs r2, #0x84
	movs r3, #0x3c
	bl BanimDrawStatupAp
	ldr r1, _08069724 @ =0x02020108
	ldr r0, _08069728 @ =0x0202010A
	ldrh r0, [r0]
	strh r0, [r1]
	adds r0, r5, #0
	bl EkrLvup_DrawPreLevelValue
	ldr r4, _0806972C @ =0x000002CD
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	adds r0, r5, #0
	bl Proc_Break
	b _0806974A
	.align 2, 0
_08069724: .4byte 0x02020108
_08069728: .4byte 0x0202010A
_0806972C: .4byte 0x000002CD
_08069730:
	ldr r4, _08069754 @ =0x020200D0
	ldr r0, [r4]
	bl Proc_End
	bl NewEfxPartsofScroll
	str r0, [r4]
	movs r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	adds r0, r5, #0
	bl Proc_Break
_0806974A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08069754: .4byte 0x020200D0
