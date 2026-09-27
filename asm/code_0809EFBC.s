	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckLinkedToFE6
CheckLinkedToFE6: @ 0x0809EFBC
	push {r4, lr}
	sub sp, #0x88
	add r4, sp, #0x24
	adds r0, r4, #0
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EFE4
	adds r0, r4, #0
	bl GetGlobalCompletionCntByInfo
	cmp r0, #9
	ble _0809EFDC
	movs r0, #2
	b _0809EFF8
_0809EFDC:
	cmp r0, #7
	ble _0809EFE4
	movs r0, #1
	b _0809EFF8
_0809EFE4:
	mov r0, sp
	bl ReadFe6LinkSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809EFF4
	movs r0, #0
	b _0809EFF8
_0809EFF4:
	mov r0, sp
	ldrh r0, [r0, #0x20]
_0809EFF8:
	add sp, #0x88
	pop {r4}
	pop {r1}
	bx r1
