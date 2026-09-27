	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxPartsofScroll2Main
EfxPartsofScroll2Main: @ 0x08069BAC
	push {r4, r5, r6, lr}
	ldr r0, _08069BF8 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r3, _08069BFC @ =0x0201FB2C
	cmp r0, #0
	bne _08069BBA
	ldr r3, _08069C00 @ =0x0201FC6C
_08069BBA:
	ldr r2, _08069C04 @ =0x0201FDB8
	cmp r0, #0
	bne _08069BC2
	ldr r2, _08069C08 @ =0x0201FEF8
_08069BC2:
	movs r4, #0
	movs r5, #0
	ldr r0, _08069C0C @ =0x08BDB6EC
	adds r6, r0, #0
	subs r6, #0x50
_08069BCC:
	cmp r4, #0x27
	bls _08069C1C
	cmp r4, #0x47
	bhi _08069C18
	movs r0, #0
	ldrsh r1, [r6, r0]
	ldr r0, _08069C10 @ =0x0202012C
	ldrh r0, [r0]
	muls r0, r1, r0
	lsls r0, r0, #4
	lsrs r1, r0, #0x10
	asrs r0, r0, #0x10
	adds r0, r4, r0
	cmp r0, #0x2e
	bls _08069BEE
	cmp r0, #0x51
	bls _08069BF0
_08069BEE:
	ldr r1, _08069C14 @ =0x0000FFE0
_08069BF0:
	strh r1, [r3]
	adds r3, #2
	strh r1, [r2]
	b _08069C22
	.align 2, 0
_08069BF8: .4byte 0x0201FDAC
_08069BFC: .4byte 0x0201FB2C
_08069C00: .4byte 0x0201FC6C
_08069C04: .4byte 0x0201FDB8
_08069C08: .4byte 0x0201FEF8
_08069C0C: .4byte 0x08BDB6EC
_08069C10: .4byte 0x0202012C
_08069C14: .4byte 0x0000FFE0
_08069C18:
	cmp r4, #0x9f
	bhi _08069C24
_08069C1C:
	strh r5, [r3]
	adds r3, #2
	strh r5, [r2]
_08069C22:
	adds r2, #2
_08069C24:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x9f
	bls _08069BCC
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
