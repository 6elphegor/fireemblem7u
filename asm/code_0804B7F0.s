	.include "macro.inc"

	.syntax unified

	thumb_func_start ekrBattle_StartPromotion
ekrBattle_StartPromotion: @ 0x0804B7F0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804B808 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _0804B814
	ldr r0, _0804B80C @ =0x02000000
	ldr r0, [r0, #8]
	bl NewEkrClassChg
	ldr r0, _0804B810 @ =ekrBattle_WaitPromotionIdle
	b _0804B81E
	.align 2, 0
_0804B808: .4byte 0x0203E02C
_0804B80C: .4byte 0x02000000
_0804B810: .4byte ekrBattle_WaitPromotionIdle
_0804B814:
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804B828 @ =sub_0804B858
_0804B81E:
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804B828: .4byte sub_0804B858
