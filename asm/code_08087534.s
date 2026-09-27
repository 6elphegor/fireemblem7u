	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08087534
sub_08087534: @ 0x08087534
	push {r4, r5, lr}
	ldr r0, _08087594 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xa0
	bls _08087546
	movs r4, #0
_08087546:
	ldr r0, _08087598 @ =0x0203E738
	adds r5, r0, #0
	adds r5, #0x48
	ldrb r1, [r5]
	lsls r0, r1, #0x1b
	lsrs r0, r0, #0x18
	subs r0, #0x20
	cmp r4, r0
	bne _08087568
	bl GetCgTextBlendControl
	ldr r1, _0808759C @ =0x04000050
	strh r0, [r1]
	bl GetCgTextBlendAlpha
	ldr r1, _080875A0 @ =0x04000052
	strh r0, [r1]
_08087568:
	cmp r4, #0
	beq _0808757A
	ldrh r5, [r5]
	lsls r0, r5, #0x16
	lsrs r0, r0, #0x1b
	lsls r0, r0, #3
	adds r0, #4
	cmp r4, r0
	bne _0808758E
_0808757A:
	ldr r2, _0808759C @ =0x04000050
	ldr r1, _080875A4 @ =0x030028AC
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrb r3, [r1, #9]
	lsls r0, r3, #8
	ldrb r1, [r1, #8]
	orrs r0, r1
	strh r0, [r2]
_0808758E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087594: .4byte 0x04000006
_08087598: .4byte 0x0203E738
_0808759C: .4byte 0x04000050
_080875A0: .4byte 0x04000052
_080875A4: .4byte 0x030028AC
