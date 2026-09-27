	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08080424
sub_08080424: @ 0x08080424
	push {r4, lr}
	ldr r0, _0808047C @ =0x083FCB30
	ldr r4, _08080480 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _08080484 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _08080488 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808048C
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #5
	bl DisplayWeaponExp
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #6
	bl DisplayWeaponExp
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #7
	bl DisplayWeaponExp
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #4
	bl DisplayWeaponExp
	b _080804BC
	.align 2, 0
_0808047C: .4byte 0x083FCB30
_08080480: .4byte 0x02020140
_08080484: .4byte 0x0200373C
_08080488: .4byte 0x0200310C
_0808048C:
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl DisplayWeaponExp
	movs r0, #1
	movs r1, #1
	movs r2, #3
	movs r3, #1
	bl DisplayWeaponExp
	movs r0, #2
	movs r1, #9
	movs r2, #1
	movs r3, #2
	bl DisplayWeaponExp
	movs r0, #3
	movs r1, #9
	movs r2, #3
	movs r3, #3
	bl DisplayWeaponExp
_080804BC:
	bl PutStatScreenSupportList
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
