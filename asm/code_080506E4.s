	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxAdvanceFrameLut
EfxAdvanceFrameLut: @ 0x080506E4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r3, r1, #0
	ldrh r0, [r5]
	adds r6, r0, #0
	cmp r6, #0
	bne _0805075C
	ldrh r0, [r3]
	mov ip, r0
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
	movs r7, #0
	ldrsh r1, [r0, r7]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050720
	movs r0, #6
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050720
	movs r0, #5
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08050720
	movs r0, #4
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050724
_08050720:
	adds r0, r1, #0
	b _08050764
_08050724:
	movs r0, #2
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050732
	strh r6, [r3]
	ldrh r4, [r2]
	b _08050746
_08050732:
	movs r0, #3
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08050746
	mov r0, ip
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r4, [r0]
_08050746:
	ldrh r1, [r3]
	lsls r0, r1, #2
	adds r0, r0, r2
	ldrh r0, [r0, #2]
	adds r1, #1
	strh r1, [r3]
	subs r0, #1
	strh r0, [r5]
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	b _08050764
_0805075C:
	subs r0, #1
	strh r0, [r5]
	movs r0, #7
	rsbs r0, r0, #0
_08050764:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
