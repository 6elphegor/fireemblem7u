	.include "macro.inc"

	.syntax unified

	thumb_func_start CameraMove_801622C
CameraMove_801622C: @ 0x08015DB0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08015DD4 @ =0x0202BBB8
	movs r2, #0xe
	ldrsh r1, [r0, r2]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015DCE
	ldr r4, _08015DD8 @ =0x08B92E38
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _08015DDC
_08015DCE:
	movs r0, #0
	b _08015E08
	.align 2, 0
_08015DD4: .4byte 0x0202BBB8
_08015DD8: .4byte 0x08B92E38
_08015DDC:
	cmp r5, #0
	beq _08015DEA
	adds r0, r4, #0
	adds r1, r5, #0
	bl Proc_StartBlocking
	b _08015DF2
_08015DEA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Start
_08015DF2:
	adds r2, r0, #0
	ldr r1, _08015E10 @ =0x0202BBB8
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x30]
	ldrh r0, [r1, #0xe]
	strh r0, [r2, #0x32]
	ldrh r0, [r1, #0xc]
	strh r0, [r2, #0x2c]
	ldrh r0, [r1, #0x2a]
	strh r0, [r2, #0x2e]
	movs r0, #1
_08015E08:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08015E10: .4byte 0x0202BBB8
