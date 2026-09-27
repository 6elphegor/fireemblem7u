	.include "macro.inc"

	.syntax unified

	thumb_func_start ConvoyPromotion_Init
ConvoyPromotion_Init: @ 0x0808F618
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x28
	bl GetUnitFromCharId
	adds r5, r0, #0
	cmp r5, #0
	bne _0808F630
	adds r0, r4, #0
	bl Proc_End
	b _0808F678
_0808F630:
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4c
	movs r4, #0
	strh r0, [r1]
	ldr r2, _0808F680 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	subs r1, #0x80
	adds r0, r5, #0
	movs r2, #0
	bl sub_0802CBAC
	ldr r1, _0808F684 @ =0x0203A3D8
	movs r0, #0x88
	lsls r0, r0, #1
	strh r0, [r1]
	ldr r0, _0808F688 @ =0x0203A3F0
	adds r0, #0x4a
	strh r4, [r0]
	ldr r0, _0808F68C @ =0x0203A470
	adds r0, #0x4a
	strh r4, [r0]
	bl BeginBattleAnimations
_0808F678:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808F680: .4byte 0x03002870
_0808F684: .4byte 0x0203A3D8
_0808F688: .4byte 0x0203A3F0
_0808F68C: .4byte 0x0203A470
