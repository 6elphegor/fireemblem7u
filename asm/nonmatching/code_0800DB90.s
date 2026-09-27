	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_MapChangeInstantNoRender
EvtCmd_MapChangeInstantNoRender: @ 0x0800DB90
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #2]
	adds r4, r1, #0
	ldr r0, _0800DBAC @ =0x0000FFFF
	cmp r4, r0
	bne _0800DBB0
	adds r0, r2, #0
	adds r0, #0x4f
	ldrb r4, [r0]
	movs r5, #0
	b _0800DBC0
	.align 2, 0
_0800DBAC: .4byte 0x0000FFFF
_0800DBB0:
	ldr r0, _0800DBD4 @ =0x00007FFF
	ands r4, r0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
_0800DBC0:
	adds r0, r4, #0
	bl ApplyMapChange
	cmp r5, #0
	beq _0800DBD8
	subs r0, r4, #1
	bl RemoveMapChangeTrap
	b _0800DBDE
	.align 2, 0
_0800DBD4: .4byte 0x00007FFF
_0800DBD8:
	adds r0, r4, #0
	bl AddMapChangeTrap
_0800DBDE:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
