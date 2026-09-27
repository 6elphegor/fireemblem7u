	.include "macro.inc"

	.syntax unified

	thumb_func_start MMB_CheckForUnit
MMB_CheckForUnit: @ 0x08085968
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, _08085998 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _0808599C @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	bne _080859A0
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080859AC
	.align 2, 0
_08085998: .4byte 0x0202BBB8
_0808599C: .4byte 0x0202E3DC
_080859A0:
	adds r0, r4, #0
	bl DrawUnitMapUi
	adds r0, r4, #0
	bl sub_08084D90
_080859AC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
