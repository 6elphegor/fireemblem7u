	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808AC90
sub_0808AC90: @ 0x0808AC90
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	cmp r5, #0
	beq _0808ACCC
	ldr r4, _0808ACC8 @ =0x02023CD4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r5, #0
	bl PutNumber
	adds r0, r4, #2
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #4
	adds r0, r4, #0
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	b _0808ACDE
	.align 2, 0
_0808ACC8: .4byte 0x02023CD4
_0808ACCC:
	ldr r0, _0808ACF8 @ =0x02023492
	movs r1, #6
	movs r2, #3
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #2
	bl EnableBgSync
_0808ACDE:
	cmp r7, #0
	beq _0808ACEA
	ldr r0, _0808ACFC @ =0x02023DA0
	adds r1, r5, #0
	bl UnitList_DrawColumnNames
_0808ACEA:
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808ACF8: .4byte 0x02023492
_0808ACFC: .4byte 0x02023DA0
