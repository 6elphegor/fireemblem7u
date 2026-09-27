	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxUpdatePartsofScroll
EfxUpdatePartsofScroll: @ 0x08069B0C
	push {r4, r5, r6, lr}
	ldr r0, _08069B38 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r2, _08069B3C @ =0x0201FB2C
	cmp r0, #0
	bne _08069B1A
	ldr r2, _08069B40 @ =0x0201FC6C
_08069B1A:
	ldr r1, _08069B44 @ =0x0201FDB8
	cmp r0, #0
	bne _08069B22
	ldr r1, _08069B48 @ =0x0201FEF8
_08069B22:
	movs r3, #0
	movs r6, #0
	ldr r5, _08069B4C @ =0x0202012C
	ldr r4, _08069B50 @ =0x0202012E
_08069B2A:
	cmp r3, #0x27
	bhi _08069B54
	strh r6, [r2]
	adds r2, #2
	strh r6, [r1]
	b _08069B70
	.align 2, 0
_08069B38: .4byte 0x0201FDAC
_08069B3C: .4byte 0x0201FB2C
_08069B40: .4byte 0x0201FC6C
_08069B44: .4byte 0x0201FDB8
_08069B48: .4byte 0x0201FEF8
_08069B4C: .4byte 0x0202012C
_08069B50: .4byte 0x0202012E
_08069B54:
	cmp r3, #0x47
	bhi _08069B62
	ldrh r0, [r5]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r5]
	b _08069B6E
_08069B62:
	cmp r3, #0x9f
	bhi _08069B72
	ldrh r0, [r4]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r4]
_08069B6E:
	strh r0, [r1]
_08069B70:
	adds r1, #2
_08069B72:
	adds r3, #1
	cmp r3, #0x9f
	bls _08069B2A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
